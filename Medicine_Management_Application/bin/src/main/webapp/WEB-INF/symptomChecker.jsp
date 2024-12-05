<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Symptom Checker</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <style>
        /* General reset */
        *, *::before, *::after {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background-image: url('images/home.jpeg'); /* Background image for the body */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #ffffff;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 20px;
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
            background: rgba(0, 0, 0, 0.5); /* Darkened background for better readability */
            filter: blur(6px);
            z-index: -1;
        }

        /* Title Styling */
        h1 {
            font-size: 2.2rem;
            color: #007bff;
            margin-bottom: 20px;
            text-align: center;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.4);
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background for the title */
            padding: 15px 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        form {
            width: 100%;
            max-width: 500px;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        label {
            font-size: 1.1rem;
            color: #333;
            margin-bottom: 10px;
            display: block;
        }

        textarea {
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            border-radius: 5px;
            border: 1px solid #ccc;
            resize: vertical;
            margin-bottom: 15px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        /* Results Section */
        .results {
            margin-top: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            text-align: left;
        }

        .result-item {
            font-size: 1.1rem;
            color: #333;
            margin: 5px 0;
        }

        .no-results {
            color: #e74c3c;
            font-weight: bold;
        }

        .loading {
            color: #f39c12;
            font-style: italic;
        }

        /* Mobile responsiveness */
        @media (max-width: 600px) {
            h1 {
                font-size: 1.8rem;
                margin-bottom: 15px;
            }

            form {
                width: 90%;
            }

            .results {
                width: 90%;
            }

            textarea {
                font-size: 1rem;
                padding: 8px;
            }

            input[type="submit"] {
                font-size: 0.9rem;
            }
        }
    </style>
</head>

<body>
    <h1>Symptom Checker</h1>
    <form action="/symptomChecker" method="post">
        <label for="symptoms">Enter your symptoms (comma-separated):</label><br/>
        <textarea id="symptoms" name="symptoms" rows="4" cols="50"></textarea><br/>
        <input type="submit" value="Check Symptoms">
    </form>

    <%
        // Process form submission
        String symptoms = request.getParameter("symptoms");

        if (symptoms != null && !symptoms.isEmpty()) {
            // Database connection details
            String url = "jdbc:mysql://localhost:3306/medical";
            String user = "root";
            String password = "manas";
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                // Load MySQL JDBC Driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish a connection to the database
                conn = DriverManager.getConnection(url, user, password);

                // Split the input symptoms into an array and remove extra spaces
                String[] symptomList = symptoms.split(",");
                
                // Build SQL query
                StringBuilder query = new StringBuilder("SELECT DISTINCT mc.condition_name FROM medical_conditions mc ");
                query.append("JOIN condition_symptoms cs ON mc.id = cs.condition_id ");
                query.append("JOIN symptoms s ON cs.symptom_id = s.id WHERE s.symptom_name IN (");

                // Add placeholders for the symptoms
                for (int i = 0; i < symptomList.length; i++) {
                    query.append("?");

                    if (i < symptomList.length - 1) {
                        query.append(",");
                    }
                }
                query.append(")");

                // Prepare statement and set parameters
                pstmt = conn.prepareStatement(query.toString());
                for (int i = 0; i < symptomList.length; i++) {
                    pstmt.setString(i + 1, symptomList[i].trim());
                }

                // Execute query
                rs = pstmt.executeQuery();

                // Display results
                if (rs.next()) {
                    out.println("<div class='results'>");
                    out.println("<h3>Possible Medical Conditions:</h3>");
                    do {
                        out.println("<div class='result-item'>" + rs.getString("condition_name") + "</div>");
                    } while (rs.next());
                    out.println("</div>");
                } else {
                    out.println("<div class='results no-results'>No matching conditions found for the provided symptoms.</div>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<div class='results'>An error occurred while checking the symptoms.</div>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</body>
</html>
