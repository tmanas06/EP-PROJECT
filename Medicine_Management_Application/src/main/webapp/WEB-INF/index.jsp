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
		    --content-background: rgba(255, 255, 255, 0.8); /* Semi-transparent white for glassmorphism */
		    --blur-effect: blur(10px);
		    --card-gradient: linear-gradient(135deg, #e0f7fa, #f1f8e9);
		    --navbar-gradient: linear-gradient(90deg, #3498db, #2ecc71);
		    --button-gradient: linear-gradient(135deg, #6dd5ed, #2193b0);
		}

		.dark-mode {
		    --primary-color: #2980b9;
		    --secondary-color: #27ae60;
		    --text-color: #e0e0e0;
		    --background-color: #1a1a1a;
		    --content-background: rgba(44, 44, 44, 0.8); /* Dark glassmorphism effect */
		    --blur-effect: blur(15px);
		    --card-gradient: linear-gradient(135deg, #263238, #37474f);
		    --navbar-gradient: linear-gradient(90deg, #2980b9, #27ae60);
		    --button-gradient: linear-gradient(135deg, #3a6186, #89253e);
		}
		@font-face {
		    font-family: 'Nobility'; /* The name you will use in your CSS */
		    src: url('../fonts/NobilityCasual-pZdR.ttf') format('truetype'), /* WOFF2 format */
		}
		@font-face {
				    font-family: 'sp'; /* The name you will use in your CSS */
				    src: url('../fonts/SpButchLiteBold-8O88B.otf') format('truetype'), /* WOFF2 format */
				}

		body {
		    font-family: 'Comfortaa', 'Nanum Gothic', cursive, sans-serif;
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
		    background: var(--navbar-gradient);
		    color: white;
		    padding: 1rem;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    position: relative;
		    border-bottom: 2px solid var(--secondary-color);
		    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		}

		.logo {
		    font-family: 'Cinzel', serif;
		    font-size: 2.5rem;
		    font-weight: bold;
		}

		#darkModeToggle {
		    background: var(--button-gradient);
		    border: none;
		    color: white;
		    padding: 0.5rem 1.5rem;
		    border-radius: 25px;
		    cursor: pointer;
		    position: absolute;
		    right: 20px;
		    transition: background 0.3s, transform 0.2s;
		}

		#darkModeToggle:hover {
		    transform: scale(1.1);
		    background: linear-gradient(135deg, #4caf50, #2c3e50);
		}

		nav {
		    background: var(--navbar-gradient);
		    padding: 0.7rem;
		    border-radius: 10px;
		    margin: 0.5rem auto;
		    max-width: 90%;
		    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
		}

		nav ul {
		    list-style: none;
		    padding: 0;
		    margin: 0;
		    display: flex;
		    justify-content: center;
		    gap: 1rem;
		}

		nav ul li {
		    margin: 0;
		}

		nav ul li a {
		    color: white;
		    text-decoration: none;
		    font-weight: bold;
		    padding: 0.5rem 1rem;
		    border-radius: 20px;
		    transition: background-color 0.3s ease, transform 0.3s;
		}

		nav ul li a:hover {
		    background-color: rgba(255, 255, 255, 0.2);
		    transform: translateY(-3px);
		}

		main {
		    flex-grow: 1;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    padding: 2rem;
		    background: linear-gradient(120deg, #e0f7fa, #f1f8e9);
		}

		.content-wrapper {
		    background: var(--content-background);
		    backdrop-filter: var(--blur-effect);
		    border-radius: 15px;
		    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
		    padding: 2rem;
		    max-width: 800px;
		    width: 100%;
		    transition: background-color 0.3s;
		}

		h1 {
			font-family:'sp', sans-serif;
		    color: var(--primary-color);
		    font-size: 3rem;
		    margin-bottom: 1rem;
		    text-align: center;
			background: rgb(131,58,180);
			background: linear-gradient(90deg, rgba(131,58,180,1) 0%, rgba(253,29,29,1) 50%, rgba(252,176,69,1) 100%);
		    -webkit-background-clip: text;
		    -webkit-text-fill-color: transparent;
		}

		p {
		    font-size: 1.1rem;
		    line-height: 1.6;
		    margin-bottom: 2rem;
		    text-align: center;
		    color: var(--text-color);
		}

		.feature-grid {
		    display: grid;
		    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
		    gap: 1.5rem;
		}

		.feature-item {
		    background: var(--content-background);
		    border-radius: 15px;
		    padding: 1.5rem;
		    text-align: center;
		    transition: transform 0.3s ease, background-color 0.3s;
		    border: 1px solid rgba(255, 255, 255, 0.2);
		    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
		}

		.feature-item:hover {
		    transform: translateY(-5px);
		}

		.feature-item i {
		    font-size: 3rem;
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
		    width: 60px;
		    height: 60px;
		    background: var(--button-gradient);
		    margin: 0 5px;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    color: white;
		    font-weight: bold;
		    border-radius: 10px;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		    transition: transform 0.3s ease, background-color 0.3s;
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
		    background: var(--navbar-gradient);
		    color: white;
		    text-align: center;
		    padding: 1rem;
		    margin-top: 2rem;
		    border-radius: 10px 10px 0 0;
		    box-shadow: 0 -4px 10px rgba(0, 0, 0, 0.1);
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
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300..700&family=Nanum+Gothic&display=swap" rel="stylesheet">    <script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&family=Comfortaa:wght@300..700&family=Nanum+Gothic&display=swap" rel="stylesheet">
	</script>
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