
contract Accounting {

    struct Account {
        uint balanceETH;
        address _to;
    }

    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function transact(Account storage a, uint _value, bytes data) internal onlyOwner {
        require(a.balanceETH >= _value);
        require(a._to.call.value(_value)(data));
        a.balanceETH = a.balanceETH - _value;
    }
}
