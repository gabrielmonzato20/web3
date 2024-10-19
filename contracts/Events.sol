pragma solidity 0.8.15;

contract Event {
mapping(address => uint ) balance ; 
event Tokensend(address   from , address   to , uint amount);
constructor(){
    balance[msg.sender] = 100;
}
 function sendToken(address  _to , uint _amount) public returns(uint){
    require(balance[msg.sender] >= _amount,"Not enough Tokens");
    balance[msg.sender] -= _amount;
    balance[_to] += _amount;
    emit Tokensend(msg.sender, _to, _amount);
 }

}