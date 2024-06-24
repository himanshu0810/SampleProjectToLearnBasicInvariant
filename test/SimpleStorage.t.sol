// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract SimpleStorageTest is Test {
    SimpleStorage simpleStorage;

    function setUp() public {
        simpleStorage = new SimpleStorage();
    }

    function testisAlwayslessthanMax() public {
        uint256 value = 5;
        simpleStorage.store(value);
        assert(simpleStorage.storedValue() < simpleStorage.MAX_StoredValue());
    }
}
