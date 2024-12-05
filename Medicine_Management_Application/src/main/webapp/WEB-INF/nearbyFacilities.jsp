<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nearby Facilities</title>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
    <style>
        #map {
            height: 500px;
            width: 100%;
        }
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        #search-container {
            margin: 10px;
            text-align: center;
        }
        button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1 style="text-align: center;">Nearby Facilities</h1>
    <div id="search-container">
        <button onclick="locateUser()">Find Nearby Hospitals</button>
    </div>
    <div id="map"></div>

    <script>
        // Initialize the map
        const map = L.map('map').setView([37.7749, -122.4194], 12); // Default: San Francisco

        // Add OpenStreetMap tiles
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '© OpenStreetMap contributors'
        }).addTo(map);

        // Function to locate the user and find hospitals
        async function locateUser() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(
                    async position => {
                        const userLat = position.coords.latitude;
                        const userLon = position.coords.longitude;

                        // Center the map on the user's location
                        map.setView([userLat, userLon], 14);

                        // Add a marker for the user's location
                        L.marker([userLat, userLon]).addTo(map)
                            .bindPopup("You are here")
                            .openPopup();

                        // Fetch nearby hospitals using Overpass API
                        const overpassUrl = `https://overpass-api.de/api/interpreter?data=[out:json];node["amenity"="hospital"](around:5000,${userLat},${userLon});out;`;

                        try {
                            const response = await fetch(overpassUrl);
                            const data = await response.json();

                            // Add markers for hospitals
                            data.elements.forEach(hospital => {
                                if (hospital.lat && hospital.lon) {
                                    const name = hospital.tags && hospital.tags.name ? hospital.tags.name : "Unnamed Hospital";
                                    const address = `${hospital.tags['addr:housenumber'] || ''} ${hospital.tags['addr:street'] || ''}, ${hospital.tags['addr:city'] || ''}, ${hospital.tags['addr:postcode'] || ''}`;
                                    const phone = hospital.tags.phone || 'No phone number available';
                                    const website = hospital.tags.website || 'No website available';
                                    const speciality = hospital.tags["healthcare:speciality"] || 'General';

                                    // Create a popup with more information
                                    const popupContent = `
                                        <strong>${name}</strong><br>
                                        <strong>Speciality:</strong> ${speciality}<br>
                                        <strong>Address:</strong> ${address}<br>
                                        <strong>Phone:</strong> ${phone}<br>
                                        <a href="${website}" target="_blank">Visit Website</a>
                                    `;

                                    // Add hospital marker to the map with a popup
                                    L.marker([hospital.lat, hospital.lon]).addTo(map)
                                        .bindPopup(popupContent);
                                }
                            });
                        } catch (error) {
                            alert("Error fetching nearby hospitals: " + error.message);
                        }
                    },
                    error => {
                        alert("Geolocation error: " + error.message);
                    }
                );
            } else {
                alert("Geolocation is not supported by this browser.");
            }
        }
    </script>
</body>
</html>
