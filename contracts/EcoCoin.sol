// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/// @title EcoCoin
/// @notice ERC-20 token used across the EcoCoin NFT Project to support
///         eco-friendly initiatives (e.g. donations via GreenDonation).
contract EcoCoin is ERC20 {
    /// @notice Deploys the EcoCoin token and mints the initial supply to the deployer.
    /// @param initialSupply The initial supply expressed in whole tokens
    ///        (i.e. without decimals; it is scaled internally by `decimals()`).
    constructor(uint256 initialSupply) ERC20("EcoCoin", "ECO") {
        require(initialSupply > 0, "EcoCoin: initial supply must be > 0");
        _mint(msg.sender, initialSupply * (10 ** decimals()));
    }
}
