contract MineableM5Token {

  function swap(address M5Logic_,uint256 _value) public returns (bool) {
    require(M5Logic_.delegatecall(bytes4(keccak256("swap(uint256)")), _value));
    return true;
  }
}
