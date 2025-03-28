// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PseudoOracle {
    uint256 private price;
    address public owner;

    event PriceUpdated(uint256 newPrice);

    constructor(uint256 initialPrice) {
        price = initialPrice;
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    // Function to manually set the price
    function setPrice(uint256 newPrice) external onlyOwner {
        price = newPrice;
        emit PriceUpdated(newPrice);
    }

    // Function to get the current price
    function getPrice() external view returns (uint256) {
        return price;
    }
}