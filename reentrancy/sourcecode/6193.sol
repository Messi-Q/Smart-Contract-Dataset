
contract Forwarder {
   
    address public parentAddress;

    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function flush() onlyOwner {
        if (!parentAddress.call.value(this.balance)()) throw;
    }
}