pragma solidity 0.8.15;

contract PayableContract{

    string private myString;

    function sendMoney(string memory param) public payable{
        if(msg.value == 1 ether){
            myString=param;
        }
        payable(msg.sender).transfer(msg.value);
    }
    function getString() public view returns(string memory){
        return myString;
    } 
}