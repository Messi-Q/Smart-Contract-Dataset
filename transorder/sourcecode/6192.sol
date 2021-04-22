contract Forwarder {
    address public parentAddress;
    address public owner;

    function flush() {
        if (!parentAddress.call.value(this.balance)()) throw;
    }

    function isAuth(address src) public view returns (bool) {
        if (src == owner) {
            return true;
        } else if (src == address(this)) {
            return true;
        }
        return false;
    }
}