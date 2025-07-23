// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.8.0;

import "./EscrowStates.sol";

contract EscrowPayment is EscrowStates {

    function sendForApproval() external onlyFreelancer {
        status = Status.AWAITING_APPROVAL;
    }

    function approve() external onlyClient hasNotEnded {
        require(status == Status.AWAITING_APPROVAL, "No order for approval");
        (bool sent, ) = freelancer.call{value: payAmount - commission}("");
        require(sent, "Failed to send Ether");
        status = Status.COMPLETED;
    }
}
