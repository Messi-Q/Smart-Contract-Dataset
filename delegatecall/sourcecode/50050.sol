contract Call_delegatecall {
    address public owner;
    address public callee;

    function setcallee(address newcallee) {
        require(msg.sender==owner);
        callee = newcallee;
    }

    function callByAddr() public returns (bool) {
        bytes4 methodId = bytes4(keccak256("inc(uint256)"));
        return callee.delegatecall(methodId,2);
    }
}