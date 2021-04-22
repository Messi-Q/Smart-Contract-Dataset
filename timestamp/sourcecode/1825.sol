contract Zmbc{

    uint public PRICE_CHANGE_ENDING_TIME = 1533364469;

    function setPrices(uint256 newSellPrice, uint256 newBuyPrice) returns (uint256) {
        require(block.timestamp <= PRICE_CHANGE_ENDING_TIME);
        return newBuyPrice - newSellPrice;
    }
}