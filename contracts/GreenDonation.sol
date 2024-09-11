// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract GreenDonation {
    IERC20 public ecoCoin;
    address public projectOwner;

    constructor(IERC20 _ecoCoin) {
        ecoCoin = _ecoCoin;
        projectOwner = msg.sender;
    }

    function donate(uint256 amount) public {
        ecoCoin.transferFrom(msg.sender, projectOwner, amount);
    }
}
