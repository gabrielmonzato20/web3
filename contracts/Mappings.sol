pragma solidity 0.8.15;

contract Mapping {
mapping(uint => bool) public mymapping; 
mapping(address => bool ) public muaddress; 

function setmap(uint _index) public {
    mymapping[_index] = true ; 
}
function setadress(address _index) public {
    muaddress[_index] = true ;
}

}