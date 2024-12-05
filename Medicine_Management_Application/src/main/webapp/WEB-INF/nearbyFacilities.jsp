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
    </style>
</head>
<body>
    <h1>Find Nearby Hospitals</h1>
    <button id="findHospitals">Find Nearby Hospitals</button>
    <div id="map"></div>

    <script>
        // Initialize the map
        const map = L.map('map').setView([0, 0], 13); // Default location until user location is fetched

        // Add OpenStreetMap tiles
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '© OpenStreetMap contributors'
        }).addTo(map);

        // Get the user's current location
        document.getElementById('findHospitals').addEventListener('click', () => {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(async (position) => {
                    const lat = position.coords.latitude;
                    const lon = position.coords.longitude;

                    // Center the map to the user's location
                    map.setView([lat, lon], 13);
                    L.marker([lat, lon]).addTo(map).bindPopup("You are here").openPopup();

                    // Fetch nearby hospitals using your Node.js server
                    try {
                        const response = await $.get('http://localhost:3000/nearby-hospitals', { lat, lon });
                        const hospitals = response.elements || [];
                        
                        if (hospitals.length === 0) {
                            alert("No hospitals found nearby.");
                            return;
                        }

                        // Add hospital markers to the map
                        hospitals.forEach(hospital => {
                            const hospitalLat = hospital.lat;
                            const hospitalLon = hospital.lon;
                            const name = hospital.tags && hospital.tags.name ? hospital.tags.name : "Unknown Hospital";

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
