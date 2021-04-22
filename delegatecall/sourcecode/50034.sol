contract Machine {   
    address public owner;
    address public calculator;

    function addC(address addr) {
        require(owner==msg.sender);
        calculator=addr;
    }
     function addValuesWithDelegateCall(uint256 a, uint256 b) public {
        calculator.delegatecall(abi.encodeWithSignature("add(uint256,uint256)", a, b));
    }
}