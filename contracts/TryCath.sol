pragma solidity 0.8.15;

contract ErrorTryCath {
    error CustomError(string ,string);
    function aError() public pure {
        revert CustomError("Error call it function","Error call it function2");
        require(false,"Error call it function ");
    }
}

contract ErrorHandle{
    event LogError(string  message);
    function cathError() public {
        ErrorTryCath a = new ErrorTryCath();
        try a.aError(){

        }catch Error(string memory message){
        emit LogError(message);
        }
    }
}