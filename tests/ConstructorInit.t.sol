// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../contracts/EscrowMain.sol";

contract ConstructorTest is Test {
    EscrowMain escrow;

    address freelancer = address(2);
    uint payAmount = 1 ether;


    function setUp() public {
        escrow = new EscrowMain(freelancer);
    }

    function testInit() public {
        assertEq(escrow.freelancer(), freelancer);
        assertEq(uint(escrow.status()), 0);
    }

    function testCommission() public {
        uint expectedCommission = (payAmount * 1) / 100;
        assertEq(escrow.commission(), expectedCommission, "Initial commission should be calculated correctly.");
    }
}