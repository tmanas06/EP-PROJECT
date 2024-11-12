<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hospital Insights - Pharmacy Prices</title>
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
            transition: transform 0.2s ease, background-color 0.2s ease;
        }

        /* Pharmacy Name Styling */
        li span.pharmacy-name {
            font-weight: bold;
            font-size: 1.2em;
            color: #007bff;
            margin-bottom: 8px;
        }

        /* Price and Delivery Option */
        li .details {
            color: #555;
            line-height: 1.6;
        }

        /* Hover effect for list items */
        li:hover {
            background-color: #f1f7ff;
            transform: scale(1.02);
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.15);
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
