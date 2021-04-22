contract Bob {

    function delegatecallWendy(address _wendy, uint _n) {
        _wendy.delegatecall(bytes4(keccak256("setN(uint256)")), _n);
    }
}