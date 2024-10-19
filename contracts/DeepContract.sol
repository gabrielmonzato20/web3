pragma solidity 0.8.15; 

contract Sender {
function receive() external payable { }
function transfer(address payable _to) public {
    _to.transfer(10);
}
function send(address payable _to) public {
    _to.send(10);
}

}

contract RecieveNoAction{
    function balance() public view returns(uint){
        return address(this).balance;
    }

    receive() external payable { }
}

contract RecieveAction{
uint public  balance ; 
function balance() public view returns(uint){
    return address(this).balance;
}
receive() external payable { 
    balance += msg.value;
}

}


contract ContractOne {

    mapping(address => uint) public addressBalances;

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        addressBalances[msg.sender] += msg.value;
    }
}

contract ContractTwo {

    function deposit() public payable {}

    function depositOnContractOne(address _contractOne) public { 
        ContractOne one = ContractOne(_contractOne);
        one.deposit{value: 10, gas: 100000}(); 
    }
}


contract ContractOne {

    mapping(address => uint) public addressBalances;

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        addressBalances[msg.sender] += msg.value;
    }
}

contract ContractTwo {

    function deposit() public payable {}

    function depositOnContractOne(address _contractOne) public { 
        bytes memory payload = abi.encodeWithSignature("deposit()");
        (bool success, ) = _contractOne.call{value: 10, gas: 100000}(payload);
        require(success);
    }
}