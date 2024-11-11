<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome to HealthMate</title>
    <style>
        /* Set background image on the body */
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/home.jpeg'); /* Replace with the path to your image */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #ffffff;
            padding: 0;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            overflow: hidden;
        }

        /* Apply blur overlay effect */
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.7); /* Dark overlay for readability */
            backdrop-filter: blur(8px); /* Blurs the background image */
            z-index: 1;
        }

        /* Content wrapper for main content */
        .content-wrapper {
            position: relative;
            z-index: 2;
            background-color: rgba(255, 255, 255, 0.1); /* Light semi-transparent background */
            padding: 40px;
            border-radius: 15px;
            text-align: center;
            max-width: 600px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }

        /* Heading and paragraph styling */
        h1 {
            color: #ffeb3b; /* Bright yellow */
            font-size: 36px;
            margin-bottom: 20px;
            text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.8); /* Stronger shadow for clarity */
        }

        p {
            font-size: 18px;
            margin-bottom: 30px;
            color: #e0e0e0; /* Soft gray */
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.7);
        }

        /* Styling for navigation */
        nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
            gap: 15px;
            flex-direction: column;
        }

        nav ul li a {
            color: #ffeb3b; /* Yellow for links */
            text-decoration: none;
            font-weight: bold;
            padding: 12px 18px;
            background-color: rgba(255, 235, 59, 0.2); /* Semi-transparent yellow background */
            border-radius: 8px;
            transition: all 0.3s ease;
            display: inline-block;
            font-size: 18px;
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.7);
        }

        nav ul li a:hover {
            background: rgba(255, 235, 59, 0.4);
            transform: scale(1.05); /* Scale effect on hover */
            color: #ffffff;
            box-shadow: 0px 4px 10px rgba(255, 235, 59, 0.3);
        }
    </style>
</head>
<body>

    <!-- Overlay for background blur effect -->
    <div class="overlay"></div>

    <!-- Main content wrapper -->
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
