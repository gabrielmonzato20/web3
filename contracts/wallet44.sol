pragma solidity 0.8.15;

contract Wallet {

    struct Transaction {
        uint amount ;
        uint timestemp;
    }

    struct Balance {
        uint totBalance;
        uint numtransactions ; 
        mapping(uint => Transaction) deposit ; 
        uint numwithdraws ; 
        mapping(uint => Transaction) withdrwas;
    }
    mapping(address => Balance) report ; 
    function getbalance(address from , uint index) public view  returns( Transaction memory){
        return  report[from].deposit[index];
    }

    function deposit() public payable {
        report[msg.sender].totBalance+= msg.value;
        report[msg.sender].deposit[report[msg.sender].numtransactions] =  Transaction(msg.value,block.timestamp);
        report[msg.sender].numtransactions++;
    }

        function withdraw(address payable to , uint amount) public payable  {
        report[msg.sender].totBalance -= amount;
        report[msg.sender].withdrwas[report[msg.sender].numwithdraws] =  Transaction(msg.value,block.timestamp);
        report[msg.sender].numwithdraws++;
        to.transfer(amount);
    }
}