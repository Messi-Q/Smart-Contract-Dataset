 contract DividendPool {

    uint256 public totalDividents = 0;

    function startDividents(uint256 from, uint256 amount) external {
      require(from > block.timestamp);
      require(amount > 0);
      totalDividents = amount;
    }
}