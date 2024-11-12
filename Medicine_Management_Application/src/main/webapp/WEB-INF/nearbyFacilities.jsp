<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Nearby Healthcare Facilities</title>
    <style>
        /* Basic Styling */
        body {
            font-family: Arial, sans-serif;
            background: url('https://images.unsplash.com/photo-1585435541088-e352fc432d67') no-repeat center center fixed;
            background-size: cover;
            text-align: center;
            padding: 20px;
            position: relative;
            color: #333;
        }

        /* Background Blur Effect */
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.4);
            filter: blur(6px);
            z-index: -1;
        }

        h1 {
            color: #ffffff;
            font-size: 2em;
            margin-bottom: 20px;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.5);
        }

        /* List Styling */
        ul {
            list-style-type: none;
            padding: 0;
            width: 60%;
            margin: 0 auto;
            z-index: 1;
            position: relative;
        }

        li {
            background-color: rgba(255, 255, 255, 0.9);
            margin: 10px 0;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.2);
            font-size: 1.1em;
            text-align: left;
            color: #333;
            display: flex;
            flex-direction: column;
            position: relative;
            transition: transform 0.2s ease, background-color 0.2s ease;
        }

        li:hover {
            transform: scale(1.02);
            background-color: #e8f4ff;
        }

        /* Facility Details */
        .distance {
            font-weight: bold;
            color: #007bff;
            font-size: 1.1em;
            margin-bottom: 10px;
        }

        /* Button Styling */
        .show-details-btn {
            padding: 10px 20px;
            border: none;
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            margin-top: 15px;
            align-self: flex-start;
            transition: background-color 0.3s ease;
        }

        .show-details-btn:hover {
            background-color: #0056b3;
        }

        /* Additional Details Section */
        .details {
            display: none;
            margin-top: 15px;
            padding: 10px;
            border-top: 1px solid #ddd;
            font-size: 0.9em;
            color: #555;
            line-height: 1.5;
            animation: fadeIn 0.5s ease;
        }

        /* Keyframes for fade-in effect */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>

    <script>
        // Toggle visibility of details
        function toggleDetails(id) {
            var details = document.getElementById("details-" + id);
            if (details.style.display === "none" || details.style.display === "") {
                details.style.display = "block";
            } else {
                details.style.display = "none";
            }
        }
    </script>
</head>
<body>

    <h1>Nearby Healthcare Facilities</h1>
    <ul>
        <%
            // Database connection details
            String url = "jdbc:mysql://localhost:3306/medical"; // Replace with your database name
            String user = "root"; // Replace with your database username
            String password = "manas"; // Replace with your database password
            
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            try {
                // Load JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                // Establish connection
                conn = DriverManager.getConnection(url, user, password);
                
                // Create SQL query
                String query = "SELECT * FROM nearby_healthcare_facilities ORDER BY distance_km ASC";
                
                // Execute query
                stmt = conn.createStatement();
                rs = stmt.executeQuery(query);
                
                // Iterate over results and display each record
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String facilityName = rs.getString("facility_name");
                    String facilityType = rs.getString("facility_type");
                    String address = rs.getString("address");
                    String contactNumber = rs.getString("contact_number");
                    double distanceKm = rs.getDouble("distance_km");
        %>
        <li>
            <span><%= facilityName %></span>
            <span class="distance"><%= distanceKm %> miles away</span>
            <button class="show-details-btn" onclick="toggleDetails(<%= id %>)">Show Details</button>

            <!-- Additional details div, initially hidden -->
            <div class="details" id="details-<%= id %>">
                <p>Type: <%= facilityType %></p>
                <p>Address: <%= address %></p>
                <p>Contact: <%= contactNumber %></p>
            </div>
        </li>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
        %>
    </ul>

</body>
</html>
