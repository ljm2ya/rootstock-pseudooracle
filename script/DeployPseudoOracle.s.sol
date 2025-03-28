// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/PseudoOracle.sol";

contract DeployPseudoOracle is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        PseudoOracle oracle = new PseudoOracle(1000); // Initial price of 1000
        console.log("PseudoOracle deployed at:", address(oracle));

        vm.stopBroadcast();
    }
}