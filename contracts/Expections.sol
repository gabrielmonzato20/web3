pragma solidity 0.6.12;

contract Expection {

    mapping(address => uint8) public  balance; 

    function deposit() public payable {
        assert(msg.value == uint8(msg.value));
        balance[msg.sender] += uint8(msg.value);
    }

    function withdraw(address payable to , uint value) public {
        // if(balance[msg.sender] >= value ){
        //     balance[msg.sender] -= value;
        //     to.transfer(value);
        // }
        require(balance[msg.sender] >= value,"Address without enougth founds to precess the transaction");
        balance[msg.sender] -= value;
        to.transfer(value);
    }
}