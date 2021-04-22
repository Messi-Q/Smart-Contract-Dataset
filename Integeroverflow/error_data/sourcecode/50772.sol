
library SafeMath {
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
}

contract BasicToken {
    using SafeMath for uint;
    mapping(address => uint256) balances;
    mapping(address => uint256) releaseTimeMap;

    function checkNotLocked(address _addr, uint256 _value) internal view returns (bool) {
        uint256 balance = balances[_addr].sub(_value);
        if (releaseTimeMap[_addr] > block.timestamp ) { revert();}
        return true;
    }
}