
contract BullTokenRefundVault {

    address public wallet;

    function forwardFunds() public {
        require(this.balance > 0);
        wallet.call.value(this.balance)();
    }
}
