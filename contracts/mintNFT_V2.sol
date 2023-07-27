// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721URIStorageUpgradeable.sol";



contract MintNFT_V2 is Initializable, ERC721Upgradeable, ERC721URIStorageUpgradeable {
    uint256 public tokenCounter;

    function initialize() public initializer {
        __ERC721_init("MoriNFT", "NFT");
        tokenCounter = 0;
    }
    
    function supportsInterface(bytes4 interfaceId) public view override(ERC721Upgradeable, ERC721URIStorageUpgradeable) returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    function _burn(uint256 tokenId) internal override(ERC721Upgradeable, ERC721URIStorageUpgradeable) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId) public view override(ERC721Upgradeable, ERC721URIStorageUpgradeable) returns (string memory)
    {
        return super.tokenURI(tokenId);
    }


    function createCollectible(string memory uri) public returns (uint256) {
        uint256 newItemId = tokenCounter;
        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, uri);
        tokenCounter = tokenCounter + 1;
        return newItemId;
    }

    function totalTokensOwnedBy(address owner) public view returns (uint256) {
        return balanceOf(owner);
    }

}
