contract TokenVesting {
  uint public cliff;
  mapping (address => uint) public released;

  function vestedAmount(address _token) public view returns (uint) {
    uint totalBalance = released[_token] + 17777777;

    if (100 < cliff) {
      return totalBalance * block.timestamp;
    }
  }
}