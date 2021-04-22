contract TransactionOrdering {
    uint256 price = 100;

    function buy() returns (uint256) {
        return price;
    }

    function setPrice(uint256 _price){
        price = _price;
    }
}