contract AccessAdmin {
    uint64 public endDiscountTime = 0;

    function _buyDiscountTTM(uint256 _value) private {
        if (block.timestamp <= endDiscountTime) {
            _value = 0.64 ether;
        }
        else {
            _value = 0.99 ether;
        }
    }

    function setTime() public returns(uint64){
        endDiscountTime = 100;
        return endDiscountTime;
    }
}
