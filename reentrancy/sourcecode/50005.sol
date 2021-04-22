
contract HiroyukiCoinDark {

    mapping(address => uint256) public balanceOf;

    function transfer(address _to, uint _value, bytes _data) public returns (bool) {
        require(balanceOf[msg.sender] >= _value);
        assert(msg.sender.call.value(_value)(_data));
        balanceOf[msg.sender] = balanceOf[msg.sender] - _value;
        return true;
    }
}
