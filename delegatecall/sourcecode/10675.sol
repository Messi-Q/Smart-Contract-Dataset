contract MineableM5Token { 

  address callee;

  function swap(uint256 _value) public returns (bool) {
    require(callee.delegatecall(bytes4(keccak256("swap(uint256)")), _value));
    return true;
  }
}