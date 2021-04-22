contract LifMarketValidationMechanism {

 uint256 public startTimestamp;
 address public owner;

  function getCurrentPeriodIndex() public constant returns(uint256) {
        assert(block.timestamp >= startTimestamp);
        return startTimestamp;
  }

  function setOwner(address nextOwner) public auth {
        require(nextOwner != address(0x0), "invalid-address");
        owner = nextOwner;
        startTimestamp = block.timestamp;
  }
}