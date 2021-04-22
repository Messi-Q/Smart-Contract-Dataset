contract Cryptoverse  {
  uint public lastPurchaseTimestamp = now;
  uint[3] public prices = [1000 finney, 800 finney, 650 finney];

  function currentPrice() public view returns (uint) {
    uint sinceLastPurchase = (block.timestamp - lastPurchaseTimestamp);
    for (uint i = 0; i < prices.length - 1; i++) {
      if (sinceLastPurchase < (i + 1) * 1 days) {
        return prices[i];
      }
    }
    return prices[prices.length - 1];
  }
}