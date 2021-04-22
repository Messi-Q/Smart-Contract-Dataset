
library SafeMath {

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
}


contract Zmbc{
    using SafeMath for uint;
    uint public PRICE_CHANGE_ENDING_TIME = 1533364469;

    function setPrices(uint256 newSellPrice, uint256 newBuyPrice) returns (uint256) {
        require(block.timestamp <= PRICE_CHANGE_ENDING_TIME);
        return newBuyPrice.sub(newSellPrice);
    }
}