pragma solidity 0.8.15;

contract AdressContract{
    address public myadress;
    function setmyAdress(address param ) public{
        myadress=param;
    }
    function getAdressBalance() public returns(uint){
        return myadress.balance;
    }
}