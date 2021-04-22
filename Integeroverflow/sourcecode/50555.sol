
library SafeMath {

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract CardsRaffle {
  using SafeMath for uint;
  uint256 private raffleTicketsBought;
  uint256 private raffleTicketThatWon;

  function drawRandomWinner() public returns (uint256) {
    uint256 seed = raffleTicketsBought.add(block.timestamp);
    raffleTicketThatWon = seed.add(raffleTicketsBought);
    return raffleTicketThatWon;
  }
}