contract EmpireCrowdsale{

  uint256 public weiRaised;
  uint256 public softCap;
  uint256 public gracePeriodStart;

  function buyTokens(address beneficiary) payable returns(uint256){
    if ((weiRaised >= softCap * 1 ether) && gracePeriodStart == 0)
        gracePeriodStart = block.timestamp;
    return gracePeriodStart;
    }
}