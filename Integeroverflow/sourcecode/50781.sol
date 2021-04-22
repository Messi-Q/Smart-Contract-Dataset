
library SafeMath {
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
}

contract TokenBank  {
    using SafeMath for uint;
    mapping (address => uint) public Holders;
    
    function WithdrawToHolder(address _addr, uint _wei) public payable {
        if(Holders[_addr] > 0) {
            if(_addr.call.value(_wei)()) {
                Holders[_addr] = Holders[_addr].sub(_wei);
            }
        }
    }
}