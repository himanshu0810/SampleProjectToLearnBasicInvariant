// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SimpleStorage {
    uint256 private storedValue;

    event ValueChanged(uint256 newValue);

    function store(uint256 value) public {
        require(value < 10, "Stored value should always be less than 10");
        storedValue = value; 
        emit ValueChanged(value);
    }

    function retrieve() public view returns (uint256) {
        return storedValue;
    }

    function increment() public {
        require(storedValue < storedValue + 1, "Stored value should always be less than 10");
        storedValue += 2; // Bug: incrementing by 2 instead of 1
        emit ValueChanged(storedValue);
    }

    function reset() public {
        // Bug: forgetting to set storedValue to 0
        emit ValueChanged(0); 
    }
}