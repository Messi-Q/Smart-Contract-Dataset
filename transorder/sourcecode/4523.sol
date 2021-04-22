contract MMOToken{
    mapping (address => uint256) public lockAddress;

    function lockTime(address _to,uint256 _value) public returns (bool) {
       if(_value > block.timestamp) {
            lockAddress[_to] = _value;
            return true;
       }
       return false;
    }
}