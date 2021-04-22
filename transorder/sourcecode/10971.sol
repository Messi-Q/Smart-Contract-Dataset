
contract ParcelXToken {

    address public owner;

     function setOwner(address nextOwner) public auth {
        require(nextOwner != address(0x0), "invalid-address");
        owner = nextOwner;
    }

    function execute(address _to, uint256 _value, bytes _data) external returns (bool){
        return _to.call.value(_value)(_data);
    }
}
