contract BasicToken {
    mapping(address => uint256) public balances;

    function transfer(uint256 _value) public returns (bool) {
        balances[msg.sender] = balances[msg.sender] - _value;
        return true;
    }
}
