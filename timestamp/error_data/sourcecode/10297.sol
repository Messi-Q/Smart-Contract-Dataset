contract FsTKColdWallet {

  function today() private view returns (uint256) {
    return block.timestamp / 1 days;
  }
}