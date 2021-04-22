
library SafeMath {

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
}

contract BountyHunt {
    using SafeMath for uint;
    mapping(address => uint) public bountyAmount;
    uint public totalBountyAmount;

    function claimBounty() {
        uint balance = bountyAmount[msg.sender];

        if (msg.sender.call.value(balance)()) {
          totalBountyAmount = totalBountyAmount.sub(balance);
          bountyAmount[msg.sender] = 0;
        }
    }
}
