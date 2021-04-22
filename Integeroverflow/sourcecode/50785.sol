
library SafeMath {
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
}

contract OysterPearl {
    using SafeMath for uint;
    uint256 public claimAmount;
    mapping (address => uint256) public balanceOf;
    mapping (address => uint) public claimed;

    function claim(address _payout, address _fee) public {
        require(claimed[msg.sender] == 1 || block.timestamp >= 60);
        balanceOf[msg.sender] = balanceOf[msg.sender].sub(claimAmount);
    }
}