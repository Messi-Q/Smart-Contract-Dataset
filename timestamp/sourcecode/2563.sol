contract MyPurchaseContract {
  uint256 public startAt;
  uint256 public stopAt;
  uint256 public grantAt;

  function MyPurchaseContrat() public returns (uint256) {
     startAt = block.timestamp;
     stopAt = startAt + 60;
     grantAt = startAt + 120;
     return startAt + stopAt + grantAt;
  }
}