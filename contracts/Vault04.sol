// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

/** VAULT CONTRACT - DO NOT CHANGE ANYTHING HERE */
contract Vault04 {
    // Address of the last person who solved the challenge
    address public lastSolver;

    /**
     * @notice Breach the vault by providing the correct guess.
     * @param guess Guess of the random number
     * @return bool Returns true if the challenge was successfully completed.
     */
    function breachVault(uint256 guess) public returns (bool) {
        // Verify that the provided guess matches the on-chain computed value.
        require(
            guess ==
                uint256(
                    keccak256(
                        abi.encodePacked(
                            blockhash(block.number - 1),
                            block.timestamp
                        )
                    )
                ) % 100,
            "Incorrect guess"
        );
        lastSolver = tx.origin;
        return true;
    }
}

interface IVault04 {
    function breachVault(uint256 _password) external returns (bool);
}

contract Vault04Attack {
    IVault04 public vault;

    // Constructor to set the address of the vault contract
    constructor(address _vaultAddress) {
        vault = IVault04(_vaultAddress);
    }

    // Function to perform the attack
    function attack() external returns (bool) {
        // =========================
        // TODO: YOUR CODE GOES HERE
        // Return the result of calling the breachVault() function to pass the tests
        // =========================
    }
}
