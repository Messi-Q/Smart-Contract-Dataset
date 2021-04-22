contract CopaDelCrypto {
  address public owner;
  modifier onlyOwner {
    require(msg.sender == owner);
    _;
  }

  uint256 public prizeValue;
  uint256 public resultsPublishedTime;
  address[] public players;

  function CancelGame() public onlyOwner {
    resultsPublishedTime = block.timestamp;
    prizeValue = address(this).balance / players.length;
    return;
  }
}