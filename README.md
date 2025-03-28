## ROOTSTOCK PSEUDO ORACLE

simple oracle code to implement with CDP contract

### Deploy

```shell
$ forge script script/DeployPseudoOracle.s.sol --rpc-url https://public-node.testnet.rsk.co --broadcast --legacy --evm-version londonforge build
```

### Usage

#### Call getPrice:

```shell
$ cast call 0x1{deployed address} "getPrice()(uint256)" --rpc-url https://public-node.testnet.rsk.co
```

#### Call setPrice:
```shell
$ cast send 0x{deployed address} "setPrice(uint256)" {some_price} --rpc-url $ROOTSTOCK_RPC_URL --private-key $PRIVATE_KEY
```

### Impliment example
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IPseudoOracle {
    function getPrice() external view returns (uint256);
}

contract Manager {
    IPseudoOracle public oracle;

    constructor(address _oracle) {
        oracle = IPseudoOracle(_oracle);
    }

    function useOraclePrice() public view returns (uint256) {
        return oracle.getPrice();
    }
}
```

