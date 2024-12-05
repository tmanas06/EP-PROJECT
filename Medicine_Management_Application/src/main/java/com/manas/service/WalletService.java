package com.manas.service;

import org.springframework.stereotype.Service;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.http.HttpService;
import org.web3j.crypto.Credentials;
import org.web3j.tx.gas.ContractGasProvider;
import org.web3j.tx.gas.DefaultGasProvider;

@Service
public class WalletService {
    private final Web3j web3;
    private String connectedAddress;
    private static final String CONTRACT_ADDRESS = "0x2E9d30761DB97706C536A112B9466433032b28e3";

    public WalletService() {
        this.web3 = Web3j.build(new HttpService("https://mainnet.infura.io/v3/646091530d70408b972c4e59d52cf046"));
    }

    public void connectWallet(String address) {
        if (address == null || address.isEmpty()) {
            throw new IllegalArgumentException("Invalid wallet address");
        }
        this.connectedAddress = address;
    }

    public String getWalletAddress() {
        return connectedAddress;
    }
}