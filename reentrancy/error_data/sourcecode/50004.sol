
contract Accounting {

    struct Account {
        uint balanceETH;
        address _to;
    }

    function transact(Account storage a, uint _value, bytes data) internal {
        require(a.balanceETH >= _value);
        require(a._to.call.value(_value)(data));
        a.balanceETH = a.balanceETH - _value;
    }
}
