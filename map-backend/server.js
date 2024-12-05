const express = require('express');
const axios = require('axios');
const cors = require('cors');

const app = express();
const port = 3000;

// Enable CORS to allow frontend to make requests to the backend
app.use(cors());

// Endpoint to fetch nearby hospitals
app.get('/nearby-hospitals', async (req, res) => {
    const { lat, lon } = req.query;

    if (!lat || !lon) {
        return res.status(400).json({ error: 'Latitude and Longitude are required' });
    }

    const latNum = parseFloat(lat);
    const lonNum = parseFloat(lon);

    if (isNaN(latNum) || isNaN(lonNum)) {
        return res.status(400).json({ error: 'Invalid latitude or longitude' });
    }

    // Construct the Overpass API URL
    const overpassUrl = `https://overpass-api.de/api/interpreter?data=[out:json];node["amenity"="hospital"](around:5000,${latNum},${lonNum});out;`;

    try {
        // Fetch the data from the Overpass API
        const response = await axios.get(overpassUrl);
        console.log('Fetched data:', response.data);  // Log the API response
        res.json(response.data);  // Send the data as JSON to the frontend
    } catch (error) {
        console.error("Error fetching data from Overpass API:", error.response ? error.response.data : error.message);
        res.status(500).json({ error: 'Error fetching nearby hospitals' });
    }
});

// Start the server
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
