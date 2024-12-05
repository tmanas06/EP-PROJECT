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

        .header {
            background: var(--primary-gradient);
            padding: 1rem;
            width: 100%;
        }

        .logo {
            color: var(--text-light);
            font-size: 2rem;
            margin-left: 20px;
            display: inline-block;
        }

        #darkModeToggle {
            float: right;
            margin-right: 20px;
            background: transparent;
            border: 1px solid white;
            color: white;
            padding: 8px 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        .nav-menu {
            background: var(--nav-background);
            padding: 15px;
            text-align: center;
            margin-top: 10px;
        }

        .nav-item {
            color: var(--text-light);
            text-decoration: none;
            padding: 10px 20px;
            margin: 0 10px;
        }

        #connectWalletBtn {
            background: white;
            color: black;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            cursor: pointer;
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
    </style>
</head>
<body>
    <div class="header">
        <div class="logo">HealthMate</div>
        <button id="darkModeToggle">Toggle Dark Mode</button>
    </div>

    <div class="nav-menu">
        <a href="Home" class="nav-item">Home</a>
        <a href="symptomChecker" class="nav-item">Symptom Checker</a>
        <a href="nearbyFacilities" class="nav-item">Nearby Healthcare Facilities</a>
        <a href="medicationPrices" class="nav-item">Medication Price Comparison</a>
        <a href="profile" class="nav-item">Profile</a>
        <button id="connectWalletBtn">Connect Wallet</button>
    </div>

    <h1>Profile</h1>

    <div class="profile-card">
        <div class="profile-name">No wallet connected</div>
        <div class="profile-details">
            Please connect your wallet to view your profile.
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const connectWalletBtn = document.getElementById('connectWalletBtn');
            
            connectWalletBtn.addEventListener('click', async () => {
                if (typeof window.ethereum !== 'undefined') {
                    try {
                        await window.ethereum.request({ method: 'eth_requestAccounts' });
                        const accounts = await window.ethereum.request({ method: 'eth_accounts' });
                        window.location.reload();
                    } catch (error) {
                        console.error('Failed to connect wallet:', error);
                        alert('Failed to connect wallet');
                    }
                } else {
                    alert('MetaMask not detected');
                }
            });
        });
    </script>
    
    <script src="https://cdn.ethers.io/lib/ethers-5.0.umd.min.js"></script>
    <script>
        let userWallet;
        const contractAddress = "0x2E9d30761DB97706C536A112B9466433032b28e3";
        const contractABI = [
        	{
        		"inputs": [
        			{
        				"internalType": "string",
        				"name": "_name",
        				"type": "string"
        			},
        			{
        				"internalType": "uint256",
        				"name": "_price",
        				"type": "uint256"
        			},
        			{
        				"internalType": "bool",
        				"name": "_deliveryAvailable",
        				"type": "bool"
        			}
        		],
        		"name": "addPharmacy",
        		"outputs": [],
        		"stateMutability": "nonpayable",
        		"type": "function"
        	},
        	{
        		"inputs": [],
        		"stateMutability": "nonpayable",
        		"type": "constructor"
        	},
        	{
        		"anonymous": false,
        		"inputs": [
        			{
        				"indexed": false,
        				"internalType": "string",
        				"name": "name",
        				"type": "string"
        			},
        			{
        				"indexed": false,
        				"internalType": "uint256",
        				"name": "price",
        				"type": "uint256"
        			},
        			{
        				"indexed": false,
        				"internalType": "bool",
        				"name": "deliveryAvailable",
        				"type": "bool"
        			}
        		],
        		"name": "PharmacyAdded",
        		"type": "event"
        	},
        	{
        		"anonymous": false,
        		"inputs": [
        			{
        				"indexed": false,
        				"internalType": "string",
        				"name": "name",
        				"type": "string"
        			},
        			{
        				"indexed": false,
        				"internalType": "uint256",
        				"name": "price",
        				"type": "uint256"
        			},
        			{
        				"indexed": false,
        				"internalType": "bool",
        				"name": "deliveryAvailable",
        				"type": "bool"
        			}
        		],
        		"name": "PharmacyUpdated",
        		"type": "event"
        	},
        	{
        		"inputs": [
        			{
        				"internalType": "string",
        				"name": "_name",
        				"type": "string"
        			},
        			{
        				"internalType": "uint256",
        				"name": "_price",
        				"type": "uint256"
        			},
        			{
        				"internalType": "bool",
        				"name": "_deliveryAvailable",
        				"type": "bool"
        			}
        		],
        		"name": "updatePharmacy",
        		"outputs": [],
        		"stateMutability": "nonpayable",
        		"type": "function"
        	},
        	{
        		"inputs": [
        			{
        				"internalType": "address",
        				"name": "",
        				"type": "address"
        			}
        		],
        		"name": "admins",
        		"outputs": [
        			{
        				"internalType": "bool",
        				"name": "",
        				"type": "bool"
        			}
        		],
        		"stateMutability": "view",
        		"type": "function"
        	},
        	{
        		"inputs": [],
        		"name": "getAllPharmacies",
        		"outputs": [
        			{
        				"internalType": "string[]",
        				"name": "names",
        				"type": "string[]"
        			},
        			{
        				"internalType": "uint256[]",
        				"name": "prices",
        				"type": "uint256[]"
        			},
        			{
        				"internalType": "bool[]",
        				"name": "deliveryOptions",
        				"type": "bool[]"
        			}
        		],
        		"stateMutability": "view",
        		"type": "function"
        	},
        	{
        		"inputs": [
        			{
        				"internalType": "string",
        				"name": "_name",
        				"type": "string"
        			}
        		],
        		"name": "getPharmacy",
        		"outputs": [
        			{
        				"internalType": "string",
        				"name": "name",
        				"type": "string"
        			},
        			{
        				"internalType": "uint256",
        				"name": "price",
        				"type": "uint256"
        			},
        			{
        				"internalType": "bool",
        				"name": "deliveryAvailable",
        				"type": "bool"
        			}
        		],
        		"stateMutability": "view",
        		"type": "function"
        	},
        	{
        		"inputs": [
        			{
        				"internalType": "string",
        				"name": "",
        				"type": "string"
        			}
        		],
        		"name": "pharmacies",
        		"outputs": [
        			{
        				"internalType": "string",
        				"name": "name",
        				"type": "string"
        			},
        			{
        				"internalType": "uint256",
        				"name": "price",
        				"type": "uint256"
        			},
        			{
        				"internalType": "bool",
        				"name": "deliveryAvailable",
        				"type": "bool"
        			},
        			{
        				"internalType": "bool",
        				"name": "isActive",
        				"type": "bool"
        			}
        		],
        		"stateMutability": "view",
        		"type": "function"
        	},
        	{
        		"inputs": [
        			{
        				"internalType": "uint256",
        				"name": "",
        				"type": "uint256"
        			}
        		],
        		"name": "pharmacyNames",
        		"outputs": [
        			{
        				"internalType": "string",
        				"name": "",
        				"type": "string"
        			}
        		],
        		"stateMutability": "view",
        		"type": "function"
        	}
        ]; // Your contract ABI here

        async function connectWallet() {
            if (typeof window.ethereum !== 'undefined') {
                try {
                    await window.ethereum.request({ method: 'eth_requestAccounts' });
                    const provider = new ethers.providers.Web3Provider(window.ethereum);
                    userWallet = provider.getSigner();
                    checkUserRegistration();
                } catch (error) {
                    console.error('Failed to connect wallet:', error);
                }
            } else {
                alert('MetaMask not detected');
            }
        }

        async function checkUserRegistration() {
            const contract = new ethers.Contract(contractAddress, contractABI, userWallet);
            const isRegistered = await contract.isUserRegistered(await userWallet.getAddress());
            if (isRegistered) {
                displayUserProfile();
            } else {
                document.getElementById('signupForm').style.display = 'block';
            }
        }

        async function displayUserProfile() {
            const contract = new ethers.Contract(contractAddress, contractABI, userWallet);
            const userAddress = await userWallet.getAddress();
            const userData = await contract.getUserData(userAddress);
            
            const profileContent = `
                <div class="profile-card">
                    <div class="profile-name">${userData.name}</div>
                    <div class="profile-details">
                        Email: ${userData.email}<br>
                        Phone: ${userData.phone}<br>
                        Wallet Address: ${userAddress}
                    </div>
                </div>
            `;
            document.getElementById('profileContent').innerHTML = profileContent;
        }

        document.getElementById('userSignupForm').addEventListener('submit', async (e) => {
            e.preventDefault();
            const name = document.getElementById('name').value;
            const email = document.getElementById('email').value;
            const phone = document.getElementById('phone').value;

            const contract = new ethers.Contract(contractAddress, contractABI, userWallet);
            try {
                await contract.registerUser(name, email, phone);
                alert('User registered successfully!');
                displayUserProfile();
            } catch (error) {
                console.error('Error registering user:', error);
                alert('Failed to register user');
            }
        });

        // Connect wallet on page load
        document.addEventListener('DOMContentLoaded', connectWallet);
    </script>
</body>
</html>