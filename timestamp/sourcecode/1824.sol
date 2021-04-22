contract Zmbc{

    uint public PRICE_CHANGE_ENDING_TIME = 1533364469;
    address public owner;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function setPrices(uint256 newSellPrice, uint256 newBuyPrice) onlyOwner returns (uint256) {
        require(block.timestamp <= PRICE_CHANGE_ENDING_TIME);
        return newBuyPrice - newSellPrice;
    }
}