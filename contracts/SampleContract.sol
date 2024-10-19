pragma solidity 0.8.15;

contract SampleContract{
     string public  myString; 
    function updateString(string memory _param) public{
        myString = _param;
    }
}