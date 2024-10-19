pragma solidity 0.8.15;

contract AbiArray {
    uint public data  = 123;

    function setint(uint param) public {
        data = param ; 
    }
}