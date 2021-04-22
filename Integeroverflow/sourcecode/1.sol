
contract Overflow_fixed_assert {

    uint8 sellerBalance = 0;

    function add(uint8 value) returns (uint){
        sellerBalance += value;
        assert(sellerBalance >= value);
        return sellerBalance;
    }
}