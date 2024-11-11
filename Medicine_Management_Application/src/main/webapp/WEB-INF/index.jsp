<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome to HealthMate</title>
    <style>
        /* Set background image on the body */
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/home.jpeg'); /* Path to your image */
            background-size: cover;
            background-position: center;
            background-attachment: fixed; /* Keeps the image fixed while scrolling */
            color: #ffffff;
            padding: 20px;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        /* Wrapper for transparent background */
        .content-wrapper {
            background-color: rgba(0, 0, 0, 0.6); /* Semi-transparent black background */
            padding: 30px;
            border-radius: 10px;
            text-align: center;
            max-width: 600px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }

        /* Styling for text */
        h1 {
            color: #ffdd57; /* Light yellow for better visibility */
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7); /* Text shadow for readability */
        }

        p {
            font-size: 18px;
            margin-bottom: 20px;
            color: #e0e0e0; /* Lighter gray for visibility */
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.6);
        }

        /* Navigation styling */
        nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-direction: column;
        }

        nav ul li {
            display: inline;
        }

        nav ul li a {
            color: #ffdd57; /* Light yellow for better visibility */
            text-decoration: none;
            font-weight: bold;
            padding: 10px 15px;
            background-color: rgba(255, 255, 255, 0.2); /* Semi-transparent white background */
            border-radius: 5px;
            transition: background 0.3s ease;
            display: inline-block;
        }

        nav ul li a:hover {
            background: rgba(255, 255, 255, 0.4);
        }
    </style>
</head>
<body>

    <div class="content-wrapper">
        <h1>Welcome to HealthMate</h1>
        <p>Your personalized healthcare assistant.</p>

        <nav>
            <ul>
                <li><a href="symptomChecker">Symptom Checker</a></li>
                <li><a href="nearbyFacilities">Nearby Healthcare Facilities</a></li>
                <li><a href="medicationPrices">Medication Price Comparison</a></li>
                <li><a href="hospitalInsights">Hospital Insights</a></li>
            </ul>
        </nav>
    </div>

</body>
</html>
