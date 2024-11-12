package com.manas;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PageController {

	@GetMapping("/symptomChecker")
    public String symptomChecker() {
        return "symptomChecker"; // Corresponds to /WEB-INF/symptomChecker.jsp
    }

    @PostMapping("/symptomChecker")
    public String processSymptoms(@RequestParam("symptoms") String symptoms) {
        // Here, you will process the symptoms
        // For example, look up conditions based on symptoms in your database

        // You can add the results to the model to be shown in the same view
        // Use Model to pass attributes to the view
        // model.addAttribute("conditions", conditions);

        // Assuming you process symptoms and find some conditions
        String conditions = "Condition 1, Condition 2";  // Example result

        // Add the result to the model and return the view with results
        return "symptomChecker"; // Return the same page with results
    }

    @GetMapping("/nearbyFacilities")
    public String nearbyFacilities() {
        return "nearbyFacilities"; // Corresponds to /WEB-INF/nearbyFacilities.jsp
    }

    @GetMapping("/medicationPrices")
    public String medicationPrices() {
        return "medicationPrices"; // Corresponds to /WEB-INF/medicationPrices.jsp
    }

    @GetMapping("/hospitalInsights")
    public String hospitalInsights() {
        return "hospitalInsights"; // Corresponds to /WEB-INF/hospitalInsights.jsp
    }
}