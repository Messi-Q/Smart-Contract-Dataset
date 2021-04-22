contract Overflow_add {
    uint sellerBalance = 0;

    function add(uint value) returns (uint){
        sellerBalance = sellerBalanc + value;
        return sellerBalance;
    }

     function sub(uint value) returns (uint){
        sellerBalance = sellerBalance - value;
        return sellerBalance;
    }
}