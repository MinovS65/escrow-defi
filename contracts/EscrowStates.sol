// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.8.0;

contract EscrowStates {

    address public client;
    address public freelancer;
    uint public payAmount;
    uint public commission;

    enum Status { PENDING, AWAITING_APPROVAL, COMPLETED, CANCELED }

    Status public status;

    modifier onlyClient() {
        require(msg.sender == client, "You are not the client");
        _;
    }

    modifier onlyFreelancer() {
        require(msg.sender == freelancer, "You are not the freelancer");
        _;
    }

    modifier hasNotEnded() {
        require(status != Status.CANCELED, "Already ended");
        require(status != Status.COMPLETED, "Already ended");
        _;
    }
}
