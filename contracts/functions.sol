pragma solidity 0.8.15;

contract FunctionContract{
    uint8 public storageenv=0 ; 
    function setStorageenv(uint8 params) public  returns(uint) {
        storageenv = params;
        return params; 
    }
    function getStorageenv() public view returns(uint8){
        return storageenv;
    }
    function som(uint a , uint b) public pure returns(uint){
        return a+b;
    }
}