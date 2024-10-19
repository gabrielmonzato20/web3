pragma solidity 0.8.13;

contract MyContract{
    
    string public mystring = "hello";

    function updatedstring(string memory value ) public {
        mystring = value;
    }
}