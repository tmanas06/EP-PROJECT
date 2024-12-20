<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nearby Hospitals</title>
    <!-- Leaflet CSS -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <!-- Leaflet JS -->
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        /* Font faces */
        @font-face {
            font-family: 'Nobility';
            src: url('../fonts/NobilityCasual-pZdR.ttf') format('truetype');
        }
        @font-face {
            font-family: 'sp';
            src: url('../fonts/SpButchLiteBold-8O88B.otf') format('truetype');
        }

        /* CSS Variables */
        :root {
            --primary-color: #3498db;
            --secondary-color: #2ecc71;
            --text-color: #333;
            --background-color: #f4f7f9;
            --content-background: rgba(255, 255, 255, 0.8);
            --blur-effect: blur(10px);
            --card-gradient: linear-gradient(135deg, #e0f7fa, #f1f8e9);
            --navbar-gradient: linear-gradient(90deg, #3498db, #2ecc71);
            --button-gradient: linear-gradient(135deg, #6dd5ed, #2193b0);
        }

        /* Dark Mode Variables */
        .dark-mode {
            --primary-color: #2980b9;
            --secondary-color: #27ae60;
            --text-color: #e0e0e0;
            --background-color: #1a1a1a;
            --content-background: rgba(44, 44, 44, 0.8);
            --blur-effect: blur(15px);
            --card-gradient: linear-gradient(135deg, #263238, #37474f);
            --navbar-gradient: linear-gradient(90deg, #2980b9, #27ae60);
            --button-gradient: linear-gradient(135deg, #3a6186, #89253e);
        }

        /* Base Styles */
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

        /* Header Styles */
        header {
            background: var(--navbar-gradient);
            color: white;
            padding: 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid var(--secondary-color);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .logo {
            font-family: 'Cinzel', serif;
            font-size: 2.5rem;
            font-weight: bold;
        }

        /* Navigation Styles */
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

        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            transition: all 0.3s ease;
        }

        nav ul li a:hover {
            background-color: rgba(255, 255, 255, 0.2);
            transform: translateY(-3px);
        }

        /* Main Content Styles */
        h1 {
            font-family: 'sp', sans-serif;
            text-align: center;
            background: linear-gradient(90deg, rgba(131,58,180,1) 0%, rgba(253,29,29,1) 50%, rgba(252,176,69,1) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-size: 3rem;
            margin: 2rem 0;
        }

        .filters {
            background: var(--content-background);
            backdrop-filter: var(--blur-effect);
            border-radius: 15px;
            padding: 20px;
            margin: 20px auto;
            max-width: 800px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .filters:hover {
            transform: scale(1.02);
        }

        /* Map Container */
        #map {
            height: 80vh;
            width: 90%;
            margin: 20px auto;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        /* Button Styles */
        button {
            background: var(--button-gradient);
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 25px;
            cursor: pointer;
            font-size: 1.1rem;
            transition: transform 0.3s ease;
            margin: 10px;
        }

        button:hover {
            transform: scale(1.05);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .logo {
                font-size: 2rem;
            }
            nav ul {
                flex-direction: column;
                align-items: center;
            }
            h1 {
                font-size: 2rem;
            }
            .filters {
                margin: 10px;
                padding: 15px;
            }
            #map {
                height: 60vh;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">HealthMate</div>
        <button id="darkModeToggle">Toggle Dark Mode</button>
    </header>

    <nav>
        <ul>
            <li><a href="index">Home</a></li>
            <li><a href="symptomChecker">Symptom Checker</a></li>
            <li><a href="nearbyFacilities">Nearby Healthcare Facilities</a></li>
            <li><a href="medicationPrices">Medication Price Comparison</a></li>
            <li><a href="profile">profile</a></li>
            <li><button id="connectWalletBtn">Connect Wallet</button></li>
        </ul>
        <div id="walletAddress"></div>
    </nav>

    <h1>Find Nearby Hospitals</h1>

    <div class="filters">
        <label><input type="checkbox" id="emergencyService" /> Emergency Services</label>
        <label><input type="checkbox" id="specialtyCardiology" /> Cardiology</label>
        <label><input type="checkbox" id="specialtyNeurology" /> Neurology</label>
        <label><input type="checkbox" id="specialtyOrthopedics" /> Orthopedics</label>
    </div>

    <button id="findHospitals">Find Nearby Hospitals</button>
    <div id="map"></div>

    <script>
        // Initialize map
        const map = L.map('map').setView([0, 0], 13);
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '� OpenStreetMap contributors'
        }).addTo(map);

        // Dark mode functionality
        const darkModeToggle = document.getElementById('darkModeToggle');
        const body = document.body;
        
        darkModeToggle.addEventListener('click', () => {
            body.classList.toggle('dark-mode');
            localStorage.setItem('darkMode', body.classList.contains('dark-mode'));
        });

        if (localStorage.getItem('darkMode') === 'true') {
            body.classList.add('dark-mode');
        }

        // Wallet connection
        const connectWalletBtn = document.getElementById('connectWalletBtn');
        const walletAddressDiv = document.getElementById('walletAddress');

        connectWalletBtn.addEventListener('click', async () => {
            if (typeof window.ethereum !== 'undefined') {
                try {
                    await window.ethereum.request({ method: 'eth_requestAccounts' });
                    const accounts = await window.ethereum.request({ method: 'eth_accounts' });
                    const address = accounts[0];

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
                    }
                } catch (error) {
                    console.error('Failed to connect wallet', error);
                    walletAddressDiv.textContent = 'Failed to connect wallet';
                }
            } else {
                walletAddressDiv.textContent = 'MetaMask not detected';
            }
        });

        // Hospital finding functionality
        document.getElementById('findHospitals').addEventListener('click', () => {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(async (position) => {
                    const lat = position.coords.latitude;
                    const lon = position.coords.longitude;

                    map.setView([lat, lon], 13);
                    L.marker([lat, lon]).addTo(map).bindPopup("You are here").openPopup();

                    try {
                        const response = await $.get('http://localhost:3000/nearby-hospitals', { lat, lon });
                        const hospitals = response.elements || [];
                        
                        if (hospitals.length === 0) {
                            alert("No hospitals found nearby.");
                            return;
                        }

                        const filteredHospitals = hospitals.filter(hospital => {
                            let matchesFilters = true;
                            if (document.getElementById('emergencyService').checked && 
                                !hospital.tags['health_facility:type']?.includes('Emergency Service')) {
                                matchesFilters = false;
                            }
                            if (document.getElementById('specialtyCardiology').checked && 
                                !hospital.tags['healthcare:speciality']?.includes('Cardiology')) {
                                matchesFilters = false;
                            }
                            if (document.getElementById('specialtyNeurology').checked && 
                                !hospital.tags['healthcare:speciality']?.includes('Neurology')) {
                                matchesFilters = false;
                            }
                            if (document.getElementById('specialtyOrthopedics').checked && 
                                !hospital.tags['healthcare:speciality']?.includes('Orthopedics')) {
                                matchesFilters = false;
                            }
                            return matchesFilters;
                        });

                        filteredHospitals.forEach(hospital => {
                            const hospitalLat = hospital.lat;
                            const hospitalLon = hospital.lon;
                            const name = hospital.tags.name || "Unknown Hospital";
                            L.marker([hospitalLat, hospitalLon])
                                .addTo(map)
                                .bindPopup(`<b>${name}</b>`);
                        });
                    } catch (error) {
                        console.error("Error fetching nearby hospitals:", error);
                        alert("Unable to fetch nearby hospitals. Please try again later.");
                    }
                }, (error) => {
                    console.error("Geolocation error:", error);
                    alert("Unable to access location. Please enable location services.");
                });
            } else {
                alert("Geolocation is not supported by your browser.");
            }
        });
    </script>
</body>
</html>