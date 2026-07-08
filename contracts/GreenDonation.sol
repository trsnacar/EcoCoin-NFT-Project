// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

/// @title GreenDonation
/// @notice Accepts EcoCoin donations from users and forwards them to the project owner.
contract GreenDonation {
    using SafeERC20 for IERC20;

    IERC20 public ecoCoin;
    address public projectOwner;

    /// @notice Emitted whenever a donation is successfully processed.
    /// @param donor The address that made the donation.
    /// @param amount The amount of EcoCoin donated.
    event DonationReceived(address indexed donor, uint256 amount);

    /// @param _ecoCoin The EcoCoin (ERC-20) token contract accepted for donations.
    constructor(IERC20 _ecoCoin) {
        require(address(_ecoCoin) != address(0), "GreenDonation: zero token address");
        ecoCoin = _ecoCoin;
        projectOwner = msg.sender;
    }

    /// @notice Donates `amount` of EcoCoin from the caller to the project owner.
    /// @dev Caller must have approved this contract to spend at least `amount` EcoCoin.
    ///      Uses SafeERC20 so the call reverts on failure even for non-standard tokens
    ///      that do not return a bool from `transferFrom`.
    /// @param amount The amount of EcoCoin to donate.
    function donate(uint256 amount) public {
        require(amount > 0, "GreenDonation: amount must be > 0");
        ecoCoin.safeTransferFrom(msg.sender, projectOwner, amount);
        emit DonationReceived(msg.sender, amount);
    }
}
