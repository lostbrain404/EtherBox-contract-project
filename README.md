## Description

This Solidity smart contract is a simple example that demonstrates basic concepts such as ownership, receiving Ether, checking contract balance, and allowing the owner to withdraw funds. It is intended for learning and testing purposes.

## Features

- Automatically assigns the deployer as the owner.
- Can receive Ether through the receive() function.
- Emits an event when Ether is received.
- Allows only the owner to withdraw the full balance.
- Provides a function to check the contract’s Ether balance.

## Functions

### Constructor

Sets the deployer of the contract as the Owner.

solidity
constructor() {
    Owner = msg.sender;
}



### receive()

Triggered when the contract receives Ether without any data. Emits the Received event.

solidity
receive() external payable {
    emit Received(msg.sender, msg.value);
}



### withdrawTo()

Allows the owner to withdraw all Ether from the contract.

solidity
function withdrawTo() public {
    require(msg.sender == Owner, "Not the owner");
    payable(Owner).transfer(address(this).balance);
}



### getBalance()

Returns the current Ether balance of the contract.

solidity
function getBalance() public view returns (uint) {
    return address(this).balance;
}



## Events

- Received(address sender, uint amount) — emitted when Ether is received.
- Withdrawn(address to, uint amount) — declared but not used in the current code.

## License

MIT
