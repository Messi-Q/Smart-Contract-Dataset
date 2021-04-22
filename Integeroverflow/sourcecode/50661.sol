
library SafeMath {

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract JadeCoin {
  using SafeMath for uint;
  mapping(address => uint256) public jadeBalance;
  mapping(address => uint256) public lastJadeSaveTime;  

  function updatePlayersCoinByOut(address player) external returns (bool){
    lastJadeSaveTime[player] = block.timestamp;
    jadeBalance[player] = jadeBalance[player].add(66666666);
    return true;
  }
}