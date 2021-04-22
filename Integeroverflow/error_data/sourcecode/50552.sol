
library SafeMath {

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract POHMO {
    using SafeMath for uint;
    address admin;
    mapping (address => uint) balances;
 
    function distributeExternal(uint256 _eth) private returns(uint) {
        uint256 _dev = _eth / 100;

        if (!address(admin).call.value(_dev)()) {
            _dev = 0;
            return balances[admin];
        }

        balances[admin] = balances[admin].add(_dev);
        return balances[admin];
    }
}
