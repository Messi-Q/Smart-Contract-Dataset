contract Paypite {
  mapping(address => uint256) releaseTimes;

  function isLocked(address _spender) public view returns (bool) {
    if (releaseTimes[_spender] == 0 || releaseTimes[_spender] <= block.timestamp) {
      return false;
    }
    return true;
  }
}