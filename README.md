# Intellectual-Property-Protection-with-Blockchain
Intellectual Property Protection with Blockchain

step-by-step guide to deploy your IPRegistry contract using Remix and MetaMask, which is the easiest and most common method for beginners and developers testing on Ethereum or other EVM networks.

🚀 Deploying IPRegistry via Remix + MetaMask

🧰 Requirements
Before you start, make sure you have:
	1. MetaMask installed in your browser.
👉 https://metamask.io/
	2. Some testnet ETH (for example, from https://sepoliafaucet.com/).
Access to Remix IDE: https://remix.ethereum.org<img width="1056" height="337" alt="image" src="https://github.com/user-attachments/assets/a9e6ce98-2de4-4e38-935e-50b0bc3791d2" />
🪜 Step-by-Step Deployment

Step 1: Open Remix
	1. Go to https://remix.ethereum.org
	2. In the File Explorer (left sidebar), click the “+” icon to create a new file.
	3. Name it: IPRegistry.sol.

Step 2: Paste Your Contract Code
Copy and paste your full contract code into that new file<img width="782" height="289" alt="image" src="https://github.com/user-attachments/assets/4abc370b-edb3-4331-b039-0bab3542e1f2" />
Step 3: Compile the Contract
	1. In the left sidebar, click the Solidity Compiler icon (looks like “Solidity” logo ⚙️).
	2. Select Compiler Version: 0.8.20
		○ Make sure it matches the version declared in your code (pragma solidity ^0.8.20;).
	3. Click Compile IPRegistry.sol.
		○ You should see a ✅ checkmark once compiled successfully.

Step 4: Connect MetaMask
	1. Click the Deploy & Run Transactions tab (Ethereum logo 💠).
	2. Under Environment, select “Injected Provider - MetaMask”.
		○ Remix will now connect to MetaMask.
	3. MetaMask will pop up asking for permission — click Connect.
	4. Make sure you are on the desired network (e.g., Sepolia Testnet or Ethereum Mainnet).

Step 5: Deploy the Contract
	1. Make sure the Contract dropdown shows IPRegistry.
	2. Since your constructor takes no arguments, just click Deploy.
	3. MetaMask will open a confirmation window.
		○ Review gas fees and confirm the transaction.
	4. Wait a few seconds — once mined, Remix will show your deployed contract under Deployed Contracts.
✅ You’ll see something like:

IPRegistry deployed at: 0xABC123...DEF

Step 6: Interact with Your Contract
Now you can use the Remix interface to interact with your deployed contract.
Common actions:
	• Register a new IP
		○ Expand your deployed contract.
		○ In registerIP, enter:
			§ title: "My New Song"
			§ ipHash: "Qm1234abc..." (can be any unique hash)
		○ Click transact → confirm in MetaMask.
		○ You’ll see the transaction succeed and get the ipId in Remix logs.
	• Check IP details
		○ Copy the ipId returned.
		○ Paste it in getIPDetails(ipId) → click call.
		○ You’ll see the stored data.
	• Transfer ownership
		○ Paste the same ipId.
		○ Enter the new owner’s Ethereum address.
		○ Click transact → confirm.
	• Revoke IP (admin only)
		○ Use revokeIP(ipId) — only the deployer (admin) can do this.

Step 7: Verify on Etherscan (Optional)
If you deployed to a public testnet (like Sepolia):
	1. Go to https://sepolia.etherscan.io/
	2. Search your contract address.
	3. Click “Verify and Publish” to upload the source code if you want others to see it.

Step 8: Done! 🎉
Your smart contract is now live on the blockchain.
You can interact with it through Remix, Etherscan, or integrate it into a DApp front-end later.
<img width="1056" height="1553" alt="image" src="https://github.com/user-attachments/assets/a94e3175-6f95-43f8-b2fc-009b00f6dce1" />


