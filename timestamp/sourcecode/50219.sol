
contract DutchSwapAuction  {
    uint256 public startDate;
    uint256 public priceDrop;

    function _currentPrice() private view returns (uint256) {
        uint256 elapsed = block.timestamp - startDate;
        uint256 priceDiff = elapsed * priceDrop;
        return priceDiff;
    }
}