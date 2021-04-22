contract CardsRaffle {
  uint256 private raffleTicketsBought;
  uint256 private raffleTicketThatWon;

  function drawRandomWinner() public returns (uint256) {
    uint256 seed = raffleTicketsBought + block.timestamp;
    raffleTicketThatWon = seed + raffleTicketsBought;
    return raffleTicketThatWon;
  }
}