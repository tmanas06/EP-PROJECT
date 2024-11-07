package com.manas;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {

    @GetMapping("/symptomChecker")
    public String symptomChecker() {
        return "symptomChecker"; // Corresponds to /WEB-INF/symptomChecker.jsp
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