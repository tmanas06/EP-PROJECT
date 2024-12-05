<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <style>
        :root {
    --primary-gradient: linear-gradient(90deg, #2193b0, #6dd5ed);
    --nav-background: rgba(0, 0, 0, 0.2);
    --card-background: rgba(40, 40, 40, 0.9);
    --text-light: #ffffff;
    --text-blue: #2193b0;
    --text-red: #ff4444;
}

body {
    margin: 0;
    padding: 0;
    min-height: 100vh;
    background-color: #1a1a1a;
    color: var(--text-light);
    font-family: Arial, sans-serif;
}

.nav-container {
    background: var(--primary-gradient);
    padding: 1rem;
    width: 100%;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.logo {
    color: white;
    font-size: 2.5rem;
    font-weight: bold;
    margin-left: 20px;
    text-align: center;
}

.nav-menu {
    display: flex;
    justify-content: center;
    gap: 20px;
    padding: 15px;
    background: var(--nav-background);
    border-radius: 10px;
    margin: 10px auto;
    width: fit-content;
    flex-wrap: wrap;
}

.nav-item {
    color: white;
    padding: 10px 20px;
    border-radius: 5px;
    text-decoration: none;
    transition: background-color 0.3s;
    white-space: nowrap;
}

.nav-item:hover {
    background-color: rgba(255, 255, 255, 0.1);
}

h1 {
    color: var(--text-red);
    text-align: center;
    font-size: 2.5rem;
    margin: 2rem 0;
}

.profile-card {
    background: var(--card-background);
    margin: 2rem auto;
    padding: 2rem;
    border-radius: 10px;
    width: 80%;
    max-width: 600px;
}

.profile-name {
    color: var(--text-blue);
    font-size: 1.4rem;
    margin-bottom: 1rem;
}

.profile-details {
    color: var(--text-light);
    line-height: 1.6;
}

#connectWalletBtn {
    background: white;
    color: black;
    border: none;
    padding: 8px 16px;
    border-radius: 5px;
    cursor: pointer;
    margin: 10px;
}

#darkModeToggle {
    position: absolute;
    right: 20px;
    top: 20px;
    background: transparent;
    border: 1px solid white;
    color: white;
    padding: 8px 16px;
    border-radius: 5px;
    cursor: pointer;
}

@media (max-width: 768px) {
    .nav-menu {
        flex-direction: column;
        width: 90%;
    }
    
    .logo {
        font-size: 2rem;
    }
    
    .profile-card {
        width: 90%;
        margin: 1rem auto;
    }
    
    h1 {
        font-size: 2rem;
    }
}
    </style>
</head>
<body>
    <div class="nav-container">
        <div class="logo">HealthMate</div>
        <button id="darkModeToggle">Toggle Dark Mode</button>
        <div class="nav-menu">
            <a href="index" class="nav-item">Home</a>
            <a href="symptomChecker" class="nav-item">Symptom Checker</a>
            <a href="nearbyFacilities" class="nav-item">Nearby Healthcare Facilities</a>
            <a href="medicationPrices" class="nav-item">Medication Price Comparison</a>
            <a href="profile" class="nav-item">Profile</a>
            <button id="connectWalletBtn">Connect Wallet</button>
        </div>
    </div>

    <h1>Profile</h1>

    <div class="profile-card">
        <div id="profileContent">
            <div class="profile-name">Not Connected</div>
            <div class="profile-details">
                Please connect your wallet to view your profile.
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const connectWalletBtn = document.getElementById('connectWalletBtn');
            const profileContent = document.getElementById('profileContent');
            
            connectWalletBtn.addEventListener('click', async () => {
                if (typeof window.ethereum !== 'undefined') {
                    try {
                        await window.ethereum.request({ method: 'eth_requestAccounts' });
                        const accounts = await window.ethereum.request({ method: 'eth_accounts' });
                        const address = accounts[0];

                        profileContent.innerHTML = `
                            <div class="profile-name">Wallet Connected</div>
                            <div class="profile-details">
                                Address: ${address}
                            </div>
                        `;
                        connectWalletBtn.textContent = 'Connected';
                        connectWalletBtn.disabled = true;
                    } catch (error) {
                        console.error('Failed to connect wallet:', error);
                        alert('Failed to connect wallet');
                    }
                } else {
                    alert('MetaMask not detected');
                }
            });

            const darkModeToggle = document.getElementById('darkModeToggle');
            darkModeToggle.addEventListener('click', () => {
                document.body.classList.toggle('dark-mode');
                localStorage.setItem('darkMode', document.body.classList.contains('dark-mode'));
            });

            if (localStorage.getItem('darkMode') === 'true') {
                document.body.classList.add('dark-mode');
            }
        });
    </script>
</body>
</html>