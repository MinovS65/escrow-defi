# escrow-defi
A Solidity-based escrow service for freelancer-client transactions with 1% commission.

Contracts:
EscrowStates.sol: Defines status and state variables.
EscrowPayment.sol: Handles payment approval.
EscrowMain.sol: Manages order creation, cancellation, and payment release.

Deploy:
Deploy EscrowMain.sol with freelancer’s address.

Usage:
Create Order: newOrder(address _freelancer)
Cancel Order: cancelOrder()
Submit/Approve Work: sendForApproval(), approve()

Requirements
Solidity ^0.8.0

Use an Ethereum network (Mainnet, Rinkeby, etc.)

