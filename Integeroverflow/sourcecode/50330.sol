
contract TransactionOrdering {
    uint256 price = 100;
    address owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function buy() returns (uint256) {
        return price;
    }

    function setPrice(uint256 _price) onlyOwner {
        price = _price;
    }
}