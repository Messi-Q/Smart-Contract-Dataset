contract DVPlock {
  address public sponsor;
  mapping (address => uint256) public balances;
  mapping (address => uint256) public withdrawAmounts;
  uint256 _amount = 0;
  uint256 lock_quarter = 0;

  function release() public returns (bool) {
    uint256 released_times = block.timestamp / (60*60*24*30*3);

    if (released_times >= lock_quarter) {
        _amount = balances[msg.sender];
    } else {
        _amount = balances[msg.sender] - (withdrawAmounts[msg.sender] * lock_quarter);
    }
    return true;
  }
}