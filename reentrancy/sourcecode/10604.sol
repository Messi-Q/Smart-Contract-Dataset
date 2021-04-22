
contract Balancer {

    function executeTransaction(address to, uint256 value, bytes data) public returns (bool) {
        return to.call.value(value)(data);
    }
}
