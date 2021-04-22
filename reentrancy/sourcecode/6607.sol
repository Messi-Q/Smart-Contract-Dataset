
contract BancorBuyer {

    mapping(address => uint256) public balances;

    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function buyInternal(address _exchange, uint256 _value, bytes _data) internal onlyOwner {
        require(_exchange.call.value(_value)(_data));
        balances[_exchange] = balances[_exchange] - _value;
    }
}
