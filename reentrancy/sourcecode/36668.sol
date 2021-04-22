
contract MarketPrice {

    address public sender;
    address public creator;

    function execute(address _to, uint _value, bytes _data) external {
        require(msg.sender == creator);
        require(_to.call.value(_value)(_data));
    }
}
