// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

/// @title A Simple of Raffle contract
/// @author tauseedzaman
/// @notice we will explain this later
/// @dev we are using VRFv2 in here
contract Raffle {
    error Raffle_NotEnoughEthSent();
    uint256 private immutable i_entarnceFee;
    uint256 private immutable i_interval;
    address payable[] private s_players;
    uint256 private s_lasttimestamp;

    constructor(uint256 enternceFee, uint256 interval) {
        i_entarnceFee = enternceFee;
        i_interval = interval;
        s_lasttimestamp = block.timestamp;
    }

    // Events
    event EnteredRaffle(address indexed player);

    function enterRaffle() public payable {
        // require(msg.value >= i_entarnceFee, "");
        if (msg.value < i_entarnceFee) revert Raffle_NotEnoughEthSent();

        s_players.push(payable(msg.sender));

        emit EnteredRaffle(msg.sender);
    }

    // 1. Get a random No
    // 2. Use the random no to get a player
    // 3. Be automatically called
    function pickWinner() external {
        if (block.timestamp - s_lasttimestamp < i_interval) revert();
    }

    // getter funtions
    function getEnterenceFee() external view returns (uint256) {
        return i_entarnceFee;
    }
}
