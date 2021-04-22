contract CrowdsaleBase {
  uint public startsAt;
  bool public finalized;
  enum State{ PreFunding, Failure, Finalized}

  function getState() public constant returns (State) {
    if(finalized) return State.Finalized;
    else if (block.timestamp < startsAt) return State.PreFunding;
    else return State.Failure;
  }
}
