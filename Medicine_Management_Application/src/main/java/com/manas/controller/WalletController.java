package com.manas.controller;

import com.manas.service.WalletService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class WalletController {
    
    @Autowired
    private WalletService walletService;

//    @GetMapping("/profile")
//    public String profilePage() {
//        return "profile";
//    }
    @GetMapping("/wallet-profile")
    public String profilePage() {
        return "profile";
    }

    @PostMapping("/connect-wallet")
    @ResponseBody
    public String connectWallet(@RequestParam String address) {
        try {
            walletService.connectWallet(address);
            return "success";
        } catch (Exception e) {
            return "error: " + e.getMessage();
        }
    }

    @GetMapping("/wallet-address")
    @ResponseBody
    public String getWalletAddress() {
        return walletService.getWalletAddress();
    }
}