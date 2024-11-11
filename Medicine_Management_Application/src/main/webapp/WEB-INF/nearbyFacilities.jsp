<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Nearby Healthcare Facilities</title>
    <style>
        /* Basic Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f9ff;
            text-align: center;
            padding: 20px;
        }

        h1 {
            color: #007bff;
            margin-bottom: 20px;
        }

        /* List Styling */
        ul {
            list-style-type: none;
            padding: 0;
            width: 60%;
            margin: 0 auto;
        }

        li {
            background-color: #ffffff;
            margin: 10px 0;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            font-size: 1.1em;
            text-align: left;
            color: #333;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* Facility Distance */
        li span.distance {
            font-weight: bold;
            color: #007bff;
        }

        /* Hover effect for list items */
        li:hover {
            background-color: #f1f7ff;
        }
    </style>
</head>
<body>

    <h1>Nearby Healthcare Facilities</h1>
    <ul>
        <li>
            <span>City Hospital</span> 
            <span class="distance">2 miles away</span>
        </li>
        <li>
            <span>Green Pharmacy</span> 
            <span class="distance">1 mile away</span>
        </li>
        <li>
            <span>Downtown Clinic</span> 
            <span class="distance">3 miles away</span>
        </li>
    </ul>

</body>
</html>
