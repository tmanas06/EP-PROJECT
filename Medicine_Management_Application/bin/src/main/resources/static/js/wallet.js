document.getElementById('connectWalletBtn').addEventListener('click', async () => {
    if (typeof window.ethereum !== 'undefined') {
        try {
            // Request account access
            await window.ethereum.request({ method: 'eth_requestAccounts' });
            
            // Get the selected address
            const accounts = await window.ethereum.request({ method: 'eth_accounts' });
            const address = accounts[0];
            
            // Send the address to your server
            const response = await fetch('/connect-wallet', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: `providerUrl=${window.ethereum.networkVersion}`
            });
            
            if (response.ok) {
                document.getElementById('walletAddress').textContent = `Connected: ${address}`;
            } else {
                console.error('Failed to connect wallet on server');
            }
        } catch (error) {
            console.error('Failed to connect wallet', error);
        }
    } else {
        console.error('MetaMask not detected');
    }
});