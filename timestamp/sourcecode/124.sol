contract AccessAdmin {
    uint64 public endDiscountTime = 0;

    function _buyDiscountTTM(uint256 _value) private {
        if (block.timestamp <= endDiscountTime) {
            require(_value == 0.64 ether);
        }
        else {
            require(_value == 0.99 ether);
        }
    }
}
