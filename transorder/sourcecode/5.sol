contract TransactionOrdering {
    uint256 price = 100;
    uint256 amount = price - 5;

    function buy() returns (uint256) {
        return amount;
    }

    function setPrice(uint256 _price) {
        amount = _price;
    }
}