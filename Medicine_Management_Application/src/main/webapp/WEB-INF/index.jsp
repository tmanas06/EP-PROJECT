<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HealthMate - Blockchain Medical Assistant</title>
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2ecc71;
            --text-color: #333;
            --background-color: #f4f7f9;
            --content-background: white;
        }

        .dark-mode {
            --primary-color: #2980b9;
            --secondary-color: #27ae60;
            --text-color: #e0e0e0;
            --background-color: #1a1a1a;
            --content-background: #2c2c2c;
        }

        body {
            font-family: 'Roboto', Arial, sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            transition: background-color 0.3s, color 0.3s;
        }

        header {
		    background-color: var(--primary-color);
		    color: white;
		    padding: 1rem;
		    display: flex;
		    justify-content: center; /* Center content horizontally */
		    align-items: center; /* Vertically center items */
		    position: relative; /* Allows positioning the button on the right */
		}
		
		.logo {
		    font-size: 2rem;
		    font-weight: bold;
		}
		
		#darkModeToggle {
		    background-color: var(--secondary-color);
		    border: none;
		    color: white;
		    padding: 0.5rem 1rem;
		    border-radius: 5px;
		    cursor: pointer;
		    position: absolute; /* Positioning the button absolutely */
		    right: 20px; /* Aligning it to the right */
		}
		
		#darkModeToggle:hover {
		    background-color: #219653; /* Slightly darker green on hover */
		}
        background-color: var(--primary-color);
        color: white;
        padding: 1rem;
        display: flex;
        justify-content: center; /* Center content horizontally */
        align-items: center; /* Vertically center items */
        position: relative; /* Allows positioning the button on the right */
    }
    
    .logo {
        font-size: 2rem;
        font-weight: bold;
    }
    
    #darkModeToggle {
        background-color: var(--secondary-color);
        border: none;
        color: white;
        padding: 0.5rem 1rem;
        border-radius: 5px;
        cursor: pointer;
        position: absolute; /* Positioning the button absolutely */
        right: 20px; /* Aligning it to the right */
    }
    
    #darkModeToggle:hover {
        background-color: #219653; /* Slightly darker green on hover */
    }

        nav {
            background-color: #2980b9;
            padding: 0.5rem;
        }

        nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
            justify-content: center;
        }

        nav ul li {
            margin: 0 1rem;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        nav ul li a:hover {
            color: var(--secondary-color);
        }

        main {
            flex-grow: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 2rem;
        }

        .content-wrapper {
            background-color: var(--content-background);
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            padding: 2rem;
            max-width: 800px;
            width: 100%;
            transition: background-color 0.3s;
        }

        h1 {
            color: var(--primary-color);
            font-size: 2.5rem;
            margin-bottom: 1rem;
            text-align: center;
        }

        p {
            font-size: 1.1rem;
            line-height: 1.6;
            margin-bottom: 2rem;
            text-align: center;
        }

        .feature-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
        }

        .feature-item {
            background-color: var(--content-background);
            border-radius: 8px;
            padding: 1.5rem;
            text-align: center;
            transition: transform 0.3s ease, background-color 0.3s;
            border: 1px solid var(--primary-color);
        }

        .feature-item:hover {
            transform: translateY(-5px);
        }

        .feature-item i {
            font-size: 2.5rem;
            color: var(--secondary-color);
            margin-bottom: 1rem;
        }

        .feature-item h3 {
            color: var(--primary-color);
            margin-bottom: 0.5rem;
        }

        .blockchain-visual {
            display: flex;
            justify-content: center;
            margin-top: 2rem;
        }

        .block {
            width: 50px;
            height: 50px;
            background-color: var(--secondary-color);
            margin: 0 5px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            font-weight: bold;
            border-radius: 5px;
            position: relative;
        }

        .block::after {
            content: '';
            position: absolute;
            right: -10px;
            top: 50%;
            transform: translateY(-50%);
            width: 10px;
            height: 2px;
            background-color: var(--secondary-color);
        }

        .block:last-child::after {
            display: none;
        }

        footer {
            background-color: var(--primary-color);
            color: white;
            text-align: center;
            padding: 1rem;
            margin-top: 2rem;
        }
        /* Add styles for the wallet button and address display */
        #connectWalletBtn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px 18px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 18px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s;
        }

        #connectWalletBtn:hover {
            background-color: #45a049;
        }

        #walletAddress {
    margin-top: 10px !important;
    font-size: 14px !important;
    color: #ffeb3b !important;
    display: block !important;
}
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous"></script>
</head>
<body>
    <header>
        <div class="logo">HealthMate</div>
        <button id="darkModeToggle">Toggle Dark Mode</button>
    </header>

    <nav>
        <ul>
            <li><a href="symptomChecker">Symptom Checker</a></li>
            <li><a href="nearbyFacilities">Nearby Healthcare Facilities</a></li>
            <li><a href="medicationPrices">Medication Price Comparison</a></li>
            <li><a href="hospitalInsights">Hospital Insights</a></li>
                <li><button id="connectWalletBtn">Connect Wallet</button></li>

        </ul>
             <div id="walletAddress"></div>
        
    </nav>

    <main>
        <div class="content-wrapper">
            <h1>Welcome to HealthMate</h1>
            <p>Your blockchain-powered healthcare assistant, ensuring secure and transparent medical services.</p>

            <div class="feature-grid">
                <div class="feature-item">
                    <i class="fas fa-stethoscope"></i>
                    <h3>Symptom Checker</h3>
                    <p>AI-powered diagnosis assistance</p>
                </div>
                <div class="feature-item">
                    <i class="fas fa-hospital"></i>
                    <h3>Nearby Facilities</h3>
                    <p>Find healthcare providers near you</p>
                </div>
                <div class="feature-item">
                    <i class="fas fa-pills"></i>
                    <h3>Medication Prices</h3>
                    <p>Compare medication costs</p>
                </div>
                <div class="feature-item">
                    <i class="fas fa-chart-bar"></i>
                    <h3>Hospital Insights</h3>
                    <p>Transparent hospital performance data</p>
                </div>
            </div>

            <div class="blockchain-visual">
                <div class="block">1</div>
                <div class="block">2</div>
                <div class="block">3</div>
                <div class="block">4</div>
                <div class="block">5</div>
            </div>
        </div>
    </main>

    <footer>
        &copy; 2024 HealthMate - Blockchain Medical Solutions
    </footer>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const connectWalletBtn = document.getElementById('connectWalletBtn');
        const walletAddressDiv = document.getElementById('walletAddress'); // Use the existing div

        connectWalletBtn.addEventListener('click', async () => {
            if (typeof window.ethereum !== 'undefined') {
                try {
                    // Request account access
                    await window.ethereum.request({ method: 'eth_requestAccounts' });
                    
                    // Get the selected address
                    const accounts = await window.ethereum.request({ method: 'eth_accounts' });
                    const address = accounts[0];
                    console.log("Retrieved address:", address);

                    // Send the address to your server
                    const response = await fetch('/connect-wallet', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        body: `providerUrl=${window.ethereum.networkVersion}`
                    });

                    if (response.ok) {
                        walletAddressDiv.innerHTML = `Connected: <span style="word-break: break-all;">${address}</span>`;
                        connectWalletBtn.textContent = 'Wallet Connected';
                        connectWalletBtn.disabled = true;
                    } else {
                        console.error('Failed to connect wallet on server');
                        walletAddressDiv.textContent = 'Failed to connect wallet on server';
                    }
                } catch (error) {
                    console.error('Failed to connect wallet', error);
                    walletAddressDiv.textContent = 'Failed to connect wallet';
                }
            } else {
                console.error('MetaMask not detected');
                walletAddressDiv.textContent = 'MetaMask not detected';
            }
        });
    });

        const darkModeToggle = document.getElementById('darkModeToggle');
        const body = document.body;

        darkModeToggle.addEventListener('click', () => {
            body.classList.toggle('dark-mode');
            localStorage.setItem('darkMode', body.classList.contains('dark-mode'));
        });

        // Check for saved dark mode preference
        if (localStorage.getItem('darkMode') === 'true') {
            body.classList.add('dark-mode');
        }
    </script>
</body>
</html>