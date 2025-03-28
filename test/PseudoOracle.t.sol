// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/PseudoOracle.sol";

contract PseudoOracleTest is Test {
    PseudoOracle oracle;
    address owner = address(this);
    address nonOwner = address(0x1);

    function setUp() public {
        oracle = new PseudoOracle(1000); // Initial price of 1000
    }

    function testInitialPrice() public {
        assertEq(oracle.getPrice(), 1000, "Initial price should be 1000");
    }

    function testSetPriceAsOwner() public {
        oracle.setPrice(2000);
        assertEq(oracle.getPrice(), 2000, "Price should update to 2000");
    }

    function testSetPriceAsNonOwner() public {
        vm.prank(nonOwner); // Simulate call from non-owner
        vm.expectRevert("Only owner can call this function");
        oracle.setPrice(3000);
    }
}