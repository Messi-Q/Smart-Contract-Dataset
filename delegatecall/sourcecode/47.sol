contract Ownable1 {
  uint public startsAt;
  enum State { PreFunding, Funding}

  function getState() public constant returns (State) {
    if (block.timestamp < startsAt) {
        return State.PreFunding;
    } else {
        return State.Funding;
    }
  }
}