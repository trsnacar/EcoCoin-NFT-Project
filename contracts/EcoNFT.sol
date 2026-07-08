// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @title EcoNFT
/// @notice ERC-721 collection of eco-themed NFTs. Minting is restricted to
///         the contract owner to prevent unrestricted, uncontrolled supply growth.
contract EcoNFT is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("EcoNFT", "ECONFT") {}

    /// @notice Mints a new EcoNFT to `recipient`.
    /// @dev Restricted to the contract owner. `_mint` reverts if `recipient` is the zero address.
    /// @param recipient The address that will receive the newly minted NFT.
    /// @return newItemId The token ID of the newly minted NFT.
    function mintNFT(address recipient) public onlyOwner returns (uint256) {
        _tokenIdCounter.increment();
        uint256 newItemId = _tokenIdCounter.current();
        _mint(recipient, newItemId);
        return newItemId;
    }
}
