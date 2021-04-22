
contract RipioOracle{

    function sendTransaction(address to, uint256 value, bytes data) public returns (bool) {
        return to.call.value(value)(data);
    }
}
