contract DVPlock {
  mapping (address => uint256) public balances;
  uint256 _amount = 0;
  uint256 lock_quarter = 0;

  function release() public returns (bool) {
    uint256 released_times = block.timestamp / (60*60*24*30*3);

    if (released_times >= lock_quarter) {
        _amount = balances[msg.sender];
    }
    return true;
  }
}