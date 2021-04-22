
contract ParcelXToken {

    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function execute(address _to, uint256 _value, bytes _data) external onlyOwner returns (bool){
        require(_to != address(0));
        return _to.call.value(_value)(_data);
    }
}
