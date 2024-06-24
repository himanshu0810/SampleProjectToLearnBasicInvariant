// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SimpleStorage {
    uint256 public storedValue;
    uint256 public MAX_StoredValue = 3;

    event ValueChanged(uint256 newValue);

    function store(uint256 value) public {
        require(value <= MAX_StoredValue, "Stored value should always be less than 3");

        if (value == storedValue) {
            reset(); // Stored value should always be less than Max value, else reset to zero
        }
        else{
            storedValue = value;
        }

        emit ValueChanged(value);
    }

    function retrieve() public view returns (uint256) {
        return storedValue;
    }

    function increment() public {
        require(storedValue < MAX_StoredValue + 1, "Stored value should always be less than max Stored Value");
        storedValue += 2; // Bug: incrementing by 2 instead of 1

        if (storedValue == MAX_StoredValue) {
            reset();
        }

        emit ValueChanged(storedValue);
    }

    function reset() public {
        // Bug: forgetting to set storedValue to 0
        emit ValueChanged(0); 
    }
}