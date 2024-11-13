package com.manas.service;
import org.springframework.stereotype.Service;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.http.HttpService;
import org.web3j.protocol.core.methods.response.EthAccounts;

import java.io.IOException;

@Service
public class WalletService {

    private Web3j web3;

    public void connectWallet(String providerUrl) {
        this.web3 = Web3j.build(new HttpService(providerUrl));
    }

    public String getWalletAddress() {
        try {
            EthAccounts accounts = web3.ethAccounts().send();
            return accounts.getAccounts().get(0);
        } catch (IOException e) {
            throw new RuntimeException("Failed to get wallet address", e);
        }
    }
}