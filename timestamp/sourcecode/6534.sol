contract XTVToken {
  uint public endTime;
  uint public XTVBurned;
  mapping(address => uint256) balances;

  function burnTokens() public returns (uint){
    require(block.timestamp > endTime);
    uint256 remaining = balances[address(0)];
    XTVBurned = remaining;
    return XTVBurned;
  }
}