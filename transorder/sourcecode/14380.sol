contract WhitelistCrowdsale {
  mapping(address => bool) whitelisted;
  uint256 public whitelistedCount;
  address owner;

  function setOwner(address nextOwner) public auth {
      require(nextOwner != address(0x0), "invalid-address");
      owner = nextOwner;
  }

  function addAddress() external {
    whitelisted[owner] = true;
    whitelistedCount = block.timestamp;
  }
}