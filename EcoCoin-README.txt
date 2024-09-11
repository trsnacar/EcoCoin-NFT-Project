# EcoCoin NFT Project

This project presents an environmentally friendly cryptocurrency and an associated NFT collection. The project includes smart contracts for both the EcoCoin token and NFTs, along with a donation contract for supporting eco-friendly projects.

## Installation

1. Install the necessary dependencies:
   ```
   npm install
   ```

2. Start a local blockchain using Ganache.

3. Deploy the contracts:
   ```
   truffle migrate --network development
   ```

4. Start the frontend application:
   ```
   cd client
   npm start
   ```

## Features

- **EcoCoin (ERC-20 token):** A cryptocurrency aimed at supporting eco-friendly projects.
- **NFT Collection (ERC-721):** Unique NFTs representing eco-themed characters.
- **Donation Contract:** Users can donate their EcoCoins to support environmental initiatives.

### Contracts:

- **EcoCoin.sol:** ERC-20 token for EcoCoin.
- **EcoNFT.sol:** ERC-721 contract for the NFT collection.
- **GreenDonation.sol:** A donation contract for supporting environmental projects.

This project leverages **Ethereum blockchain** for secure, decentralized operations.
