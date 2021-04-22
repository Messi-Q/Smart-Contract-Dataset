
contract MultiAccess{

    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    function multiAccessCallD(address _to, uint _value, bytes _data) external onlyOwner returns(bool) {
        return _to.call.value(_value)(_data);
    }
}