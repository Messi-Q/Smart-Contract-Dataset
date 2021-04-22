
contract Overflow_add {

    uint8 sellerBalance = 0;

    function add(uint8 value) returns (uint){
        sellerBalance += value;
        return sellerBalance;
    }
}