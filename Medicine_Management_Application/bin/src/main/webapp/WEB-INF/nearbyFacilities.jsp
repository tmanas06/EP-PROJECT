<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nearby Healthcare Facilities</title>
    <style>
        /* Basic Styling */
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/home.jpeg'); /* Optional: Set background image */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            text-align: center;
            padding: 20px;
            color: #ffffff;
            margin: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            min-height: 100vh;
            position: relative;
        }

        /* Background Blur Effect */
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5); /* Slight darkening for text visibility */
            filter: blur(6px);
            z-index: -1;
        }

        /* Title Styling */
        h1 {
            color: #ffffff;
            font-size: 2.5em;
            margin-bottom: 20px;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.7);
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background for the title */
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
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            transition: transform 0.2s ease, background-color 0.2s ease, box-shadow 0.2s ease;
        }

        li:hover {
            transform: scale(1.02);
            background-color: #f1f7ff;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.25);
        }

        /* Facility Name Styling */
        li span {
            font-weight: bold;
            font-size: 1.3em;
            color: #007bff;
            margin-bottom: 10px;
        }

        /* Distance Styling */
        .distance {
            font-weight: bold;
            font-size: 1.1em;
            margin-bottom: 10px;
            color: #007bff;
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

        /* Mobile responsiveness */
        @media (max-width: 600px) {
            h1 {
                font-size: 2em;
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
