contract Alice {
    address owner;

    function delegatecallWendy(address _wendy, uint _n) {
        require(owner==msg.sender);
        _wendy.delegatecall(bytes4(keccak256("setN(uint256)")), _n);
    }
}