# EcoCoin NFT Project

An environmentally-themed blockchain project combining an ERC-20 utility token
(**EcoCoin**), an ERC-721 NFT collection (**EcoNFT**), and a donation
contract (**GreenDonation**) that lets holders donate EcoCoin to support
eco-friendly initiatives. A minimal React front end is included to interact
with the deployed contracts.

## Contracts

| Contract | Standard | Description |
|---|---|---|
| `contracts/EcoCoin.sol` | ERC-20 | The EcoCoin (`ECO`) token. The full initial supply is minted to the deployer at construction time. |
| `contracts/EcoNFT.sol` | ERC-721 | The EcoNFT (`ECONFT`) collection. Minting is restricted to the contract owner (`onlyOwner`). |
| `contracts/GreenDonation.sol` | — | Accepts EcoCoin donations (via `transferFrom`, so donors must `approve` this contract first) and forwards them to the project owner. Emits a `DonationReceived` event on every donation. |

Sample NFT artwork used by the collection lives under `NFTs/`.

## Key Features

- **EcoCoin (ERC-20):** standard OpenZeppelin ERC-20 token used to fund and
  reward eco-friendly activity within the project.
- **EcoNFT (ERC-721):** owner-minted collection of eco-themed NFTs.
- **GreenDonation:** simple pull-based donation flow — users `approve` the
  contract and call `donate(amount)`, which forwards the funds to the
  project owner and emits an event for on-chain tracking.

## Tech Stack

- **Solidity** `0.8.0`
- **OpenZeppelin Contracts** `^4.0.0`
- **Truffle** `^5.4.0` (compilation, migrations, testing)
- **Web3.js** `^1.3.5`
- **React** front end (`client/`)

## Prerequisites

- [Node.js](https://nodejs.org/) and npm
- [Truffle](https://trufflesuite.com/) (installed automatically as a project dependency)
- A local Ethereum development chain such as [Ganache](https://trufflesuite.com/ganache/), listening on `127.0.0.1:8545` (see `truffle-config.js`)

## Installation & Setup

1. Install the root project dependencies:

   ```bash
   npm install
   ```

2. Start a local blockchain with Ganache (default RPC `127.0.0.1:8545`,
   matching the `development` network in `truffle-config.js`).

3. Compile the contracts:

   ```bash
   npx truffle compile
   ```

4. Deploy (migrate) the contracts to the local network:

   ```bash
   npx truffle migrate --network development
   ```

5. Run the test suite:

   ```bash
   npm test
   ```

6. Start the React front end:

   ```bash
   cd client
   npm install
   npm start
   ```

   Note: the front end currently expects the deployed EcoCoin contract
   address and ABI to be wired in (`client/src/App.js`) before it can read
   live balances.

## Deployment

Contract addresses are not currently published — this repository does not
target a specific public network out of the box. `truffle-config.js` defines
only a local `development` network; add additional network entries (e.g.
for a testnet) and the corresponding provider/mnemonic configuration if you
need to deploy beyond your local chain.

## Project Structure

```
contracts/            Solidity smart contracts (EcoCoin, EcoNFT, GreenDonation)
migrations/            Truffle migration scripts
test/                   Truffle/Mocha test suite
client/                 React front end
NFTs/                   Sample NFT artwork
truffle-config.js       Truffle network & compiler configuration
```

## License

The smart contracts are released under the **MIT License** (see the
SPDX license identifiers at the top of each contract file).
