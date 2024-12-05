package com.manas.service;

import org.springframework.stereotype.Service;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.http.HttpService;

@Service
public class WalletService {

    private final Web3j web3;

    // Constructor-based Dependency Injection (Recommended)
    public WalletService() {
        // Initialize Web3j with a provider URL (Replace with a valid provider)
        this.web3 = Web3j.build(new HttpService("https://mainnet.infura.io/v3/646091530d70408b972c4e59d52cf046"));
    }

    public String getWalletAddress() {
        try {
            // Example: Get the first wallet address
            return web3.ethAccounts().send().getAccounts().get(0);
        } catch (Exception e) {
            e.printStackTrace();
            return "Error retrieving wallet address";
        }
    }
}
