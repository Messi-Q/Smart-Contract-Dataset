contract timegame {
  uint constant TWELEVE_HOURS = 12 * 60 * 60;
  uint public regeneration;

  function enter() {
    if (regeneration + TWELEVE_HOURS < block.timestamp) {
        if (msg.value < 1 ether) {
            msg.sender.send(msg.value);
            return;
        }
    }
  }
}
