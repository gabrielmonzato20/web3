pragma solidity 0.8.15;

contract Wallet {
    address payable public owner; 
    address payable nextOwner;
    mapping(address => bool) guardian ; 
    mapping(address => uint) allowance;
    mapping(address => bool) allowtoTransfer;

    uint guardiansResetCount;
    uint constant count = 3 ;

    constructor(){
        owner = payable(msg.sender);
    }
    function newOwnerfunc(address payable newOwner) public{
        require(guardian[msg.sender], "You are no guardian, aborting");
        if (nextOwner != newOwner){
        nextOwner = newOwner;
        guardiansResetCount = 0 ;
        }
        if(guardiansResetCount >= count) {
            owner = nextOwner;
            nextOwner = payable(address(0));
        }
    }
        function setAllowance(address _from, uint _amount) public {
        require(msg.sender == owner, "You are not the owner, aborting!");
        allowance[_from] = _amount;
        allowtoTransfer[_from] = true;
    }

    function denySending(address _from) public {
        require(msg.sender == owner, "You are not the owner, aborting!");
        allowtoTransfer[_from] = false;
    }
    function transfer(address payable _to, uint _amount, bytes memory payload) public returns (bytes memory) {
        require(_amount <= address(this).balance, "Can't send more than the contract owns, aborting.");
        if(msg.sender != owner) {
            require(allowtoTransfer[msg.sender], "You are not allowed to send any transactions, aborting");
            require(allowance[msg.sender] >= _amount, "You are trying to send more than you are allowed to, aborting");
            allowance[msg.sender] -= _amount;

        }

        (bool ok , bytes memory response) = _to.call{value:_amount}(payload);
        require(ok, "Transaction failed, aborting");
        return response ; 

    }
    receive() external payable { }
}