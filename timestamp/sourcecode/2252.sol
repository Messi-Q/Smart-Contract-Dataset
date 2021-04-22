contract CardsRaffle {
  uint256 private raffleTicketsBought;
  uint256 private raffleTicketThatWon;
  address public owner;

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  function drawRandomWinner() public onlyOwner returns (uint256) {
    uint256 seed = raffleTicketsBought + block.timestamp;
    raffleTicketThatWon = addmod(uint256(block.blockhash(block.number-1)), seed, raffleTicketsBought);
    return raffleTicketThatWon;
  }
}