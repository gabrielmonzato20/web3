pragma solidity 0.8.13;

contract StringContract {
    string public myString = "Hello guty";
    bytes public myBytes = "Hello guty";
    function setMystring(string memory _param) public {
        myString = _param;

    }
    function compare(string memory _param) public view returns(bool){
        return keccak256(abi.encode(myString)) == keccak256(abi.encode(_param));
    }

    function getLength() public view returns(uint){
        return myBytes.length;
    }

}