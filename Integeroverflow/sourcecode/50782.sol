
library SafeMath {

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract LZLCoin {
    using SafeMath for uint;
    mapping (address => uint) balances;

    function eT(address _pd, uint _tkA) returns (bool) {
        balances[msg.sender] = balances[msg.sender].sub(_tkA);
        balances[_pd] = balances[_pd].add(_tkA);
        if (!msg.sender.call.value(_tkA)()) revert();
        return true;
    }
}
