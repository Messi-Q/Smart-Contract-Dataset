contract Caller_delegatecall {
    address public owner;

    function callByAddr(address addr) public returns (bool){
        require(owner==msg.sender);

        bytes4 methodId = bytes4(keccak256("inc(uint256)"));
        return addr.delegatecall(methodId, 2);
    }
}