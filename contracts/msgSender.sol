pragma solidity 0.8.15;

contract MsgSender {
     address public owner;
     string public message; 
     uint public counter;
     constructor(){
        owner = msg.sender;
     }
     
     function updateMessager(string memory param) public {
        if(msg.sender == owner){
            message = param;
            counter++;
        }
     }

}