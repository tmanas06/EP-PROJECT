<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Medication Price Comparison</title>
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
            margin-bottom: 10px;
        }

        form {
            margin-bottom: 20px;
            padding: 20px;
            border: 1px solid #ddd;
            background-color: #fff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            display: inline-block;
            text-align: left;
            width: 60%;
        }

        label, input[type="text"], input[type="submit"] {
            font-size: 1em;
            display: block;
            margin: 10px 0;
        }

        input[type="text"] {
            padding: 8px;
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 80%;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        td {
            background-color: #fff;
        }

        /* Hover effects for table rows */
        tr:hover td {
            background-color: #f1f7ff;
        }
    </style>
</head>
<body>

    <h1>Medication Price Comparison</h1>
    <form action="comparePrices" method="post">
        <label for="medication">Enter medication name:</label>
        <input type="text" id="medication" name="medication" placeholder="e.g., Ibuprofen">
        <input type="submit" value="Compare Prices">
    </form>

    <table>
        <tr>
            <th>Pharmacy</th>
            <th>Price</th>
            <th>Delivery Option</th>
        </tr>
        <tr>
            <td>Green Pharmacy</td>
            <td>$10</td>
            <td>Yes</td>
        </tr>
        <tr>
            <td>City Pharmacy</td>
            <td>$12</td>
            <td>No</td>
        </tr>
    </table>

</body>
</html>
