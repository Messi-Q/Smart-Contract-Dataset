contract WhitelistCrowdsale {
  mapping(address => bool) whitelisted;
  uint256 public whitelistedCount;

  function addAddress(address _addr) external {
    whitelisted[_addr] = true;
    whitelistedCount = block.timestamp;
    return;
  }
}