<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Insights - Pharmacy Prices</title>
    <style>
        /* Basic Styling */
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/home.jpeg'); /* Optional: Set background image */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #ffffff;
            padding: 0;
            margin: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            min-height: 100vh;
        }

        /* Title Styling */
        h1 {
            color: #ffffff;
            margin-top: 50px;
            font-size: 3em;
            text-align: center;
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background for visibility */
            padding: 15px 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        /* List Styling */
        ul {
            list-style-type: none;
            padding: 0;
            width: 80%;
            max-width: 800px;
            margin-top: 30px;
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
            transition: transform 0.2s ease, background-color 0.2s ease, box-shadow 0.2s ease;
        }

        /* Pharmacy Name Styling */
        li span.pharmacy-name {
            font-weight: bold;
            font-size: 1.4em;
            color: #007bff;
            margin-bottom: 8px;
        }

        /* Price and Delivery Option Styling */
        li .details {
            color: #555;
            line-height: 1.6;
        }

        /* Hover effect for list items */
        li:hover {
            background-color: #f1f7ff;
            transform: scale(1.02); /* Slight zoom-in effect */
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.15); /* More prominent shadow */
        }

        /* Mobile responsiveness */
        @media (max-width: 600px) {
            h1 {
                font-size: 2.5em;
                padding: 10px 20px;
            }

            ul {
                width: 90%;
            }

            li {
                font-size: 1em;
            }
        }
    </style>
</head>
<body>

    <h1>Pharmacy Prices</h1>

    <ul>
        <%
            // Database connection parameters
            String url = "jdbc:mysql://localhost:3306/medical";
            String user = "root";
            String password = "manas";

            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                // Load the MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish a connection
                conn = DriverManager.getConnection(url, user, password);

                // Create a statement to execute SQL
                stmt = conn.createStatement();

                // Query to retrieve data from pharmacy_prices table
                String sql = "SELECT pharmacy_name, price, delivery_option FROM pharmacy_prices";
                rs = stmt.executeQuery(sql);

                // Iterate through the result set and display each row
                while (rs.next()) {
                    String pharmacyName = rs.getString("pharmacy_name");
                    String price = rs.getString("price");
                    boolean deliveryOption = rs.getBoolean("delivery_option");
        %>
                    <li>
                        <span class="pharmacy-name"><%= pharmacyName %></span>
                        <div class="details">
                            Price: $<%= price %><br/>
                            Delivery Available: <%= deliveryOption ? "Yes" : "No" %>
                        </div>
                    </li>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Close the resources
                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
        %>
    </ul>

</body>
</html>
