
contract Kleros {

    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
     
    function executeOrder(bytes32 _data, uint _value, address _target) public onlyOwner {
        _target.call.value(_value)(_data);
    }
}
