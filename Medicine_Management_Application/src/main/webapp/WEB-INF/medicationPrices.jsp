<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pharmacy Prices</title>
    <style>
        @font-face {
            font-family: 'Nobility';
            src: url('../fonts/NobilityCasual-pZdR.ttf') format('truetype');
        }
        @font-face {
            font-family: 'sp';
            src: url('../fonts/SpButchLiteBold-8O88B.otf') format('truetype');
        }
        :root {
            --primary-color: #3498db;
            --secondary-color: #2ecc71;
            --text-color: #333;
            --background-color: #f4f7f9;
            --content-background: rgba(255, 255, 255, 0.8);
            --blur-effect: blur(10px);
            --card-gradient: linear-gradient(135deg, #e0f7fa, #f1f8e9);
            --navbar-gradient: linear-gradient(90deg, #2193b0, #6dd5ed);
            --button-gradient: linear-gradient(135deg, #6dd5ed, #2193b0);
        }
        
        .dark-mode {
            --primary-color: #2980b9;
            --secondary-color: #27ae60;
            --text-color: #e0e0e0;
            --background-color: #1a1a1a;
            --content-background: rgba(44, 44, 44, 0.8);
            --blur-effect: blur(15px);
            --card-gradient: linear-gradient(135deg, #263238, #37474f);
            --navbar-gradient: linear-gradient(90deg, #2980b9, #27ae60);
            --button-gradient: linear-gradient(135deg, #3a6186, #89253e);
        }

        body {
            font-family: 'Comfortaa', 'Nanum Gothic', cursive, sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            transition: background-color 0.3s, color 0.3s;
        }

        .nav-container {
            background: var(--navbar-gradient);
            padding: 1rem;
            width: 100%;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .logo {
            color: white;
            font-size: 2.5rem;
            font-weight: bold;
            margin-left: 20px;
            text-align: center;
        }

        .nav-menu {
            display: flex;
            justify-content: center;
            gap: 20px;
            padding: 15px;
            background: rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            margin: 10px auto;
            width: fit-content;
            flex-wrap: wrap;
        }

        .nav-item {
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s;
            white-space: nowrap;
        }

        .nav-item:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .content-container {
            width: 80%;
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 20px;
        }

        h1 {
            color: #ff4444;
            text-align: center;
            font-size: 2.5rem;
            margin: 30px 0;
            font-family: 'sp', sans-serif;
        }

        .card {
            background: var(--content-background);
            backdrop-filter: var(--blur-effect);
            border-radius: 15px;
            padding: 25px;
            margin: 20px 0;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card-title {
            color: var(--primary-color);
            font-size: 1.4em;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .card-content {
            color: var(--text-color);
            line-height: 1.6;
        }

        .connect-wallet {
            background: white;
            color: black;
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            font-weight: bold;
            transition: transform 0.2s ease;
        }

        .connect-wallet:hover {
            transform: scale(1.05);
        }

        #darkModeToggle {
            position: absolute;
            right: 20px;
            top: 20px;
            background: transparent;
            border: 1px solid white;
            color: white;
            padding: 8px 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        #darkModeToggle:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        @media (max-width: 768px) {
            .nav-menu {
                flex-direction: column;
                width: 90%;
                gap: 10px;
            }
            
            .logo {
                font-size: 2rem;
                margin-left: 0;
            }

            .content-container {
                width: 95%;
                padding: 0 10px;
            }

            h1 {
                font-size: 2rem;
            }

            .card {
                padding: 15px;
            }
        }
    </style>
</head>
<body>
    <div class="nav-container">
        <div class="logo">HealthMate</div>
        <button id="darkModeToggle">Toggle Dark Mode</button>
        <nav class="nav-menu">
            <a href="index" class="nav-item">Home</a>
            <a href="symptomChecker" class="nav-item">Symptom Checker</a>
            <a href="nearbyFacilities" class="nav-item">Nearby Healthcare Facilities</a>
            <a href="medicationPrices" class="nav-item">Medication Price Comparison</a>
            <a href="profile" class="nav-item">Profile</a>
            <button class="connect-wallet" id="connectWalletBtn">Connect Wallet</button>
        </nav>
    </div>

    <div class="content-container">
        <h1>Pharmacy Prices</h1>
        
        <%
            String url = "jdbc:mysql://localhost:3306/medical";
            String user = "root";
            String password = "manas";

            try (Connection conn = DriverManager.getConnection(url, user, password);
                 Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery("SELECT pharmacy_name, price, delivery_option FROM pharmacy_prices")) {
                
                while (rs.next()) {
        %>
                <div class="card">
                    <div class="card-title"><%= rs.getString("pharmacy_name") %></div>
                    <div class="card-content">
                        Price: $<%= rs.getString("price") %><br>
                        Delivery Available: <%= rs.getBoolean("delivery_option") ? "Yes" : "No" %>
                    </div>
                </div>
        <%
                }
            } catch (Exception e) {
                out.println("<div class='card'><div class='card-content'>Error: " + e.getMessage() + "</div></div>");
            }
        %>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const darkModeToggle = document.getElementById('darkModeToggle');
            const body = document.body;
            
            darkModeToggle.addEventListener('click', () => {
                body.classList.toggle('dark-mode');
                localStorage.setItem('darkMode', body.classList.contains('dark-mode'));
            });

            if (localStorage.getItem('darkMode') === 'true') {
                body.classList.add('dark-mode');
            }

            // Wallet connection functionality
            const connectWalletBtn = document.getElementById('connectWalletBtn');
            connectWalletBtn.addEventListener('click', async () => {
                if (typeof window.ethereum !== 'undefined') {
                    try {
                        await window.ethereum.request({ method: 'eth_requestAccounts' });
                        const accounts = await window.ethereum.request({ method: 'eth_accounts' });
                        connectWalletBtn.textContent = 'Connected';
                        connectWalletBtn.disabled = true;
                    } catch (error) {
                        console.error('Failed to connect wallet:', error);
                        alert('Failed to connect wallet');
                    }
                } else {
                    alert('MetaMask not detected');
                }
            });
        });
    </script>
</body>
</html>