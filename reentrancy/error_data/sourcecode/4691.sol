
contract Accounting {

    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    struct Account {
        uint balanceETH;
        address _to;
    }

    function transact(Account a, uint _value, bytes data) internal onlyOwner {
        require(a.balanceETH >= _value);
        a.balanceETH = a.balanceETH - _value;
        require(a._to.call.value(_value)(data));
    }
}
