// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract  Exercises{
    ///@notice the owner 
    address public Owner ;

    constructor(){
        Owner = msg.sender;
    }

    ///@notice make sender & to event 
    event Received(address sender,uint amount);
    event Withdrawn(address to , uint amount);

    ///@notice This function is triggered when the contract receives Ether without data.
    ///Emits a Received event with the senders address and the amount received
    receive()external payable{
        emit Received(msg.sender,msg.value);
    }

    function withdrawTo() public {
        require(msg.sender == Owner, "Not the owner");
        payable(Owner).transfer(address(this).balance);
    }

    ///@notice this function gets the balance 
    function getBalance()public view returns(uint){
        return address(this).balance;
    }
}
