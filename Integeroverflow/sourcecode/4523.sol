contract MMOToken{
    mapping (address => uint256) public lockAddress;
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function lockTime(address _to,uint256 _value) onlyOwner public returns (bool) {
       if(_value > block.timestamp) {
            lockAddress[_to] = _value;
            return true;
       }
       return false;
    }
}