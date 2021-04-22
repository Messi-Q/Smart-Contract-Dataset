
contract Forwarder {
   
    address public parentAddress;

    function flush() {
        if (!parentAddress.call.value(this.balance)()) throw;
    }
}