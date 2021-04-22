contract RootInBlocks {
  address public owner;
  mapping(string => uint) map;

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  function put(string hash) public onlyOwner {
    require(map[hash] == 0);
    map[hash] = block.timestamp;
    return;
  }
}