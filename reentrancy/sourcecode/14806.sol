
contract ERC827Token {

    function approveAndCall(address _spender, uint256 _value, bytes _data) public payable returns (bool) {
        require(_spender != address(this));
        require(_spender.call.value(msg.value)(_data));
        return true;
    }
}
