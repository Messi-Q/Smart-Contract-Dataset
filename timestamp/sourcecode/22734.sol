contract CCCRCoin {
  mapping(address => uint256) public holdTime;

  function serHoldTime(address _address, uint256 _seconds) external {
      holdTime[_address] = block.timestamp + (_seconds);
      return;
  }
}