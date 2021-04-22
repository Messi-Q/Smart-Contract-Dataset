
contract Order {

    function sendRobust(address to, uint value) internal {
        if (value > 0) {
            if (!to.call.value(value)()) throw;
        }
    }
}
