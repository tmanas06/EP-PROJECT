package com.manas.controller;

import com.manas.service.WalletService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class WalletController {

    @Autowired
    private WalletService walletService;

    @GetMapping("/wallet")
    public String walletPage() {
        return "wallet";
    }

    @PostMapping("/connect-wallet")
    @ResponseBody
    public String connectWallet(@RequestParam String providerUrl) {
        try {
            walletService.connectWallet(providerUrl);
            return "Wallet connected successfully";
        } catch (Exception e) {
            return "Failed to connect wallet: " + e.getMessage();
        }
    }

    @GetMapping("/wallet-address")
    @ResponseBody
    public String getWalletAddress() {
        return walletService.getWalletAddress();
    }
}