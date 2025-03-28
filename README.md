## ROOTSTOCK PSEUDO ORACLE

simple oracle code to implement with CDP contract

first set $ROOTSTOCK_RPC_URL and $PRIVATE_KEY environment variable

### Deploy

```shell
$ forge script script/DeployPseudoOracle.s.sol --rpc-url $ROOTSTOCK_RPC_URL --broadcast --legacy --evm-version london --private-key $PRIVATE_KEY
```

you can achieve contract address

### Usage

#### Call getPrice:

```shell
$ cast call {contract address} "getPrice()(uint256)" --rpc-url $ROOTSTOCK_RPC_URL
```

#### Call setPrice:
```shell
$ cast send {contract address} "setPrice(uint256)" {some_price} --rpc-url $ROOTSTOCK_RPC_URL --private-key $PRIVATE_KEY
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

