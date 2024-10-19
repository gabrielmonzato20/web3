pragma solidity 0.8.15;

contract MyConstruction {
    address public  myAdress;
    constructor(address param){
        myAdress = param ; 

    }
    function setMyAdressToSender() public  {
        myAdress = msg.sender;
    }

    function setMyAdress(address param) public {
        myAdress = param;
    }

}