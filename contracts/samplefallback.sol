pragma solidity 0.8.15;

contract SampleFallBack{
    uint public  myuint ; 
    string public lastfunccall;

    receive() external payable{
        myuint = msg.value;
        lastfunccall = "receive";
    }
    fallback() external payable{
        myuint = msg.value;
        lastfunccall = "fallback";
    }
}