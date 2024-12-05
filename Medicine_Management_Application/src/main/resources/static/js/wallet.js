document.addEventListener('DOMContentLoaded', function() {
    const connectWalletBtn = document.getElementById('connectWalletBtn');
    const profileContent = document.getElementById('profileContent');

    connectWalletBtn.addEventListener('click', async () => {
        if (typeof window.ethereum !== 'undefined') {
            try {
                await window.ethereum.request({ method: 'eth_requestAccounts' });
                const accounts = await window.ethereum.request({ method: 'eth_accounts' });
                const address = accounts[0];

                const response = await fetch('/connect-wallet', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: `address=${address}`
                });

                if (response.ok) {
                    profileContent.innerHTML = `
                        <div style="color: var(--text-blue)">Wallet Connected</div>
                        <div style="margin-top: 1rem;">
                            Address: ${address}
                        </div>
                    `;
                } else {
                    throw new Error('Failed to connect wallet on server');
                }
            } catch (error) {
                console.error('Failed to connect wallet:', error);
                alert('Failed to connect wallet');
            }
        } else {
            alert('MetaMask not detected');
        }
    });
});