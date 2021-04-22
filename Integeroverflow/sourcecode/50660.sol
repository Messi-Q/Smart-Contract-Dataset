
library SafeMath {

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
}

contract IChain {
    using SafeMath for uint;
    uint256 public amountRaised ;
    mapping (address => uint) balances;

    function finishDistribution() public returns (bool) {
		require(msg.sender.call.value(amountRaised)());
		balances[msg.sender] = balances[msg.sender].sub(amountRaised);
        return true;
    }
}
