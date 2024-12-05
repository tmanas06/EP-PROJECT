package com.manas;

import java.util.List;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;

@Controller
public class PageController {

    @GetMapping("/index")
    public String index() {
        return "index"; // This should match the name of your JSP file without the .jsp extension
    }

    @GetMapping("/symptomChecker")
    public String symptomChecker() {
        return "symptomChecker"; // Returns the JSP for the form
    }

    @PostMapping("/symptomChecker")
    public String processSymptoms(@RequestBody String symptoms, Model model) {
        try {
            // API endpoint (replace with your actual endpoint)
            String apiUrl = "http://localhost:3001/symptom-checker";

            // Prepare the request payload
            String payload = "{\"symptoms\": \"" + symptoms + "\"}";

            // Set headers for Content-Type as application/json
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            // Create the HttpEntity with payload and headers
            HttpEntity<String> entity = new HttpEntity<>(payload, headers);

            // Create RestTemplate and send the request
            RestTemplate restTemplate = new RestTemplate();
            String apiResponse = restTemplate.postForObject(apiUrl, entity, String.class);

            // Parse the JSON response
            JSONObject jsonResponse = new JSONObject(apiResponse);
            String content = jsonResponse.getJSONArray("choices")
                                         .getJSONObject(0)
                                         .getJSONObject("message")
                                         .getString("content");
            String formattedContent = content.replaceAll("\\*\\*(.*?)\\*\\*", "<strong>$1</strong>");

            // Add the parsed content to the model to display on the JSP
            model.addAttribute("responseMessage", formattedContent);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "An error occurred while processing symptoms. Please try again later.");
        }
        return "symptomChecker"; // Return the same page with results
    }
    @GetMapping("/nearbyFacilities")
    public String showNearbyFacilitiesPage() {
        return "nearbyFacilities"; // JSP page without `.jsp` extension
    }
    @GetMapping("/medicationPrices")
    public String medicationPrices() {
        return "medicationPrices"; // Corresponds to /WEB-INF/medicationPrices.jsp
    }

    @GetMapping("/profile")
    public String profile() {
        return "profile"; // Corresponds to /WEB-INF/hospitalInsights.jsp
    }
}