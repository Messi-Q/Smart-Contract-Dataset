contract Caller_by_delegatecall {

    function callByAddr(address addr) public returns (bool){
        bytes4 methodId = bytes4(keccak256("inc(uint256)"));
        return addr.delegatecall(methodId, 2);
    }
}