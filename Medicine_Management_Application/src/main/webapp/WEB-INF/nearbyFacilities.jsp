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
        #map {
            height: 80vh;
            width: 100%;
            margin-top: 20px;
        }
        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
        }
        button:hover {
            background-color: #45a049;
        }
        .filters {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <h1>Find Nearby Hospitals</h1>

    <!-- Filter Options -->
    <div class="filters">
        <label><input type="checkbox" id="emergencyService" /> Emergency Services</label><br>
        <label><input type="checkbox" id="specialtyCardiology" /> Cardiology</label><br>
        <label><input type="checkbox" id="specialtyNeurology" /> Neurology</label><br>
        <label><input type="checkbox" id="specialtyOrthopedics" /> Orthopedics</label><br>
    </div>

    <button id="findHospitals">Find Nearby Hospitals</button>
    <div id="map"></div>

    <script>
        // Initialize the map
        const map = L.map('map').setView([0, 0], 13); // Default location until user location is fetched

        // Add OpenStreetMap tiles
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '© OpenStreetMap contributors'
        }).addTo(map);

        // Get the user's current location and fetch hospitals
        document.getElementById('findHospitals').addEventListener('click', () => {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(async (position) => {
                    const lat = position.coords.latitude;
                    const lon = position.coords.longitude;

                    // Center the map to the user's location
                    map.setView([lat, lon], 13);
                    L.marker([lat, lon]).addTo(map).bindPopup("You are here").openPopup();

                    // Fetch nearby hospitals from the backend
                    try {
                        const response = await $.get('http://localhost:3000/nearby-hospitals', { lat, lon });
                        const hospitals = response.elements || [];
                        
                        if (hospitals.length === 0) {
                            alert("No hospitals found nearby.");
                            return;
                        }

                        // Filter hospitals based on user input
                        const filteredHospitals = hospitals.filter(hospital => {
                            let matchesFilters = true;

                            // Check for Emergency Service filter
                            if (document.getElementById('emergencyService').checked && 
                                !hospital.tags['health_facility:type']?.includes('Emergency Service')) {
                                matchesFilters = false;
                            }

                            // Check for specialty filters
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

                        // Add filtered hospital markers to the map
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
