contract Machine {

    function addValuesWithDelegateCall(address calculator, uint256 a, uint256 b) public returns (uint256) {
        calculator.delegatecall(abi.encodeWithSignature("add(uint256,uint256)", a, b));
    }
}