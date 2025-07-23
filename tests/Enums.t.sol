// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../contracts/EscrowMain.sol";

contract EnumsTest is Test {
    EscrowMain escrow;

    address client = address(1);
    address freelancer = address(2);

    function setUp() public {
        vm.prank(client);
        escrow = new EscrowMain(freelancer);
    }

    function testApprove() public {
        vm.prank(freelancer);
        escrow.sendForApproval();
        assertEq(escrow.status(), 1);
    }

    function testCompleted() public {
        vm.prank(freelancer);
        escrow.sendForApproval();

        vm.prank(client);
        escrow.approve();

        assertEq(escrow.status(), 2);
    }

    function testCanceled() public {
        vm.prank(freelancer);
        escrow.cancelOrder();

        assertEq(escrow.status(), 3);
    }
}