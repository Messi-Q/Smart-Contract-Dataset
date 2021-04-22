contract LastIsMe {
  address public lastPlayer;
  uint    public jackpot;
  uint    public startedAt;

  function buyTicket(address _ref) {
      if(lastPlayer != 0x0 ) {
        lastPlayer.send(jackpot);
        startedAt  = block.timestamp;
        return;
      }
      return;
  }
}

