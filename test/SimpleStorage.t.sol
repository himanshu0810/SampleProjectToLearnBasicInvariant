// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {SimpleStorage} from "../src/SimpleStorage.sol";
import {Test} from "forge-std/Test.sol";
import {StdInvariant} from "forge-std/StdInvariant.sol";

contract MyContractTest is StdInvariant, Test {
    SimpleStorage simpleStorage;

    function setUp() public {
        simpleStorage = new SimpleStorage();
        targetContract(address(simpleStorage));
    }

    function testIsAlwaysZeroUnit() public {
        uint256 data = 0;
        simpleStorage.doStuff(data);
        assert(simpleStorage.shouldAlwaysBeZero() == 0);
    }

    function testIsAlwaysZeroFuzz(uint256 randomData) public {
        simpleStorage.doStuff(randomData);
        assert(simpleStorage.shouldAlwaysBeZero() == 0);
    }

    function invariant_testAlwaysReturnsZero() public {
        assert(simpleStorage.shouldAlwaysBeZero() == 0);
    }
}