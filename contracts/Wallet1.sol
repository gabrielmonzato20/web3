pragma solidity 0.8.15;

// contract PaymentInfo{
//     address public from;
//     uint public amount;
//     constructor(address param1 , uint param2){
//         from = param1;
//         amount = param2;
//     }
// }

struct PaymentInfo{
    address from ;
    uint amiunt;
}
contract Wallet1{
PaymentInfo public payment ;
function payContract() public payable {
    payment =  PaymentInfo(msg.sender,msg.value);
    
}


}