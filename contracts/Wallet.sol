pragma solidity 0.8.15;

contract Wallet {

    uint private balance;

    function deposity() payable {
        balance += msg.value;
    } 
    function getBalance() public view returns(uint){
        return adress(this).balance;
    }

    function withdrawAll() public {
        address payable to = payable(msg.sender);
        to.transfer(getBalance());
    }
    function withDrawtoAdress(address payable to) public {
        to.transfer(getBalance());
    }
}