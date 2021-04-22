
contract Address {

    function sendValue(address recipient, uint256 amount) internal {
        require(this.balance >= amount);
        bool success = recipient.call.value(amount)();
        require(success);
    }
}
