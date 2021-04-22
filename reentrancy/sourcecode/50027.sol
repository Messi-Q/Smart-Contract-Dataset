
contract generic_holder {

    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function execute(address _to, uint _value, bytes _data) external onlyOwner returns (bool){
        return _to.call.value(_value)(_data);
    }
}
