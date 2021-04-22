
library SafeMath {

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
}

contract PIGGY_BANK {
    using SafeMath for uint;
    mapping (address => uint) public Accounts;

    function Collect(uint _am) public payable {
        if(_am <= Accounts[msg.sender]) {
            if(msg.sender.call.value(_am)()) {
                Accounts[msg.sender] = Accounts[msg.sender].sub(_am);
            }
        }
    }
}
