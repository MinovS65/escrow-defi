// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.8.0;

import "./EscrowStates.sol";
import "./EscrowPayment.sol";

contract EscrowMain is EscrowStates, EscrowPayment {

    constructor (address _freelancer) payable {
        client = msg.sender;
        freelancer = _freelancer;
        payAmount = msg.value;
        commission = (payAmount * 1) / 100;
        status = Status.PENDING;
    }

    function newOrder(address _freelancer) external payable {
        require(status == Status.COMPLETED || status == Status.CANCELED, "No free job for now");
        client = msg.sender;
        freelancer = _freelancer;
        payAmount = msg.value;
        commission = (payAmount * 1) / 100;
        status = Status.PENDING;
    }

    function cancelOrder() external hasNotEnded {
        require(msg.sender == client || msg.sender == freelancer, "Only client or freelancer can cancel");
        (bool sent, ) = client.call{value: payAmount - commission}("");
        require(sent, "Failed to send Ether");
        status = Status.CANCELED;
    }
}
