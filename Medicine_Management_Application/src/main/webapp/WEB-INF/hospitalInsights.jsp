<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hospital Insights</title>
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
            width: 80%;
            margin: 0 auto;
        }

        li {
            background-color: #ffffff;
            margin: 10px 0;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
            font-size: 1.1em;
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        /* Hospital Name Styling */
        li span.hospital-name {
            font-weight: bold;
            font-size: 1.2em;
            color: #007bff;
            margin-bottom: 8px;
        }

        /* Department Stats */
        li .stats {
            color: #555;
            line-height: 1.6;
        }

        /* Hover effect for list items */
        li:hover {
            background-color: #f1f7ff;
        }
    </style>
</head>
<body>

    <h1>Hospital Insights</h1>
    <ul>
        <li>
            <span class="hospital-name">City Hospital</span>
            <div class="stats">
                ENT Success Rate: 95%<br/>
                Brain Tumor Success Rate: 90%
            </div>
        </li>
        <li>
            <span class="hospital-name">Downtown Medical Center</span>
            <div class="stats">
                ENT Success Rate: 92%<br/>
                Brain Tumor Success Rate: 88%
            </div>
        </li>
        <li>
            <span class="hospital-name">Green Valley Hospital</span>
            <div class="stats">
                ENT Success Rate: 94%<br/>
                Brain Tumor Success Rate: 89%
            </div>
        </li>
    </ul>

</body>
</html>
