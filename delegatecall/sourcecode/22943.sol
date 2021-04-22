contract ThatCallsSomeContract {

    function callTheOtherContract(address _contractAddress) public {
        require(_contractAddress.delegatecall(bytes4(keccak256("callMeMaybe()"))));
    }
}