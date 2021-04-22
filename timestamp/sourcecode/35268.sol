contract CONTSKCrowdsale{
  uint256 constant public END = 1539097200;
  address public wallet =0x71b658EDC685fB2D7fc06E4753156CEE6aBE44A1;

  function buyTokens(address beneficiary) payable {
    require(beneficiary != 0x0);
    require(msg.value != 0);
    require(block.timestamp <= END);
    uint256 etherAmount = msg.value;
    wallet.transfer(msg.value);
    return;
  }
 }