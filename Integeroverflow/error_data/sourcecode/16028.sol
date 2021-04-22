contract BasicToken {
    mapping(address => uint256) balances;
    mapping(address => uint256) releaseTimeMap;

    function checkNotLocked(address _addr, uint256 _value) internal view returns (bool) {
        uint256 balance = balances[_addr] - _value;
        if (releaseTimeMap[_addr] > block.timestamp) { revert(); }
        return true;
    }
}