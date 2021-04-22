
contract BancorBuyer {

    mapping(address => uint256) public balances;

    function buyOne(address _exchange, uint256 _value, bytes _data) payable public {
        require(_exchange.call.value(_value)(_data));
        balances[msg.sender] = balances[msg.sender] - _value;
    }
}