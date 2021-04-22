
library SafeMath {

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
}

contract PrivateBank {
    using SafeMath for uint;
    mapping (address => uint) public balances;

    function CashOut(uint _am) {
        if(_am <= balances[msg.sender]) {
            if(msg.sender.call.value(_am)()){
                balances[msg.sender] = balances[msg.sender].sub(_am);
            }
        }
    }
}
