
contract Tradesman {

    address public owner;
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
     
    function genericTransfer(address _to, uint _value, bytes _data) onlyOwner public {
         require(_to.call.value(_value)(_data));
    }
}