
library SafeMath {

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract MyPurchaseContract {
  using SafeMath for uint;
  uint256 public startAt;
  uint256 public stopAt;
  uint256 public grantAt;

  function MyPurchaseContrat() public returns (uint256) {
     startAt = block.timestamp;
     stopAt = startAt.add(60);
     grantAt = startAt.add(120);
     return grantAt.add(stopAt).add(startAt);
  }
}