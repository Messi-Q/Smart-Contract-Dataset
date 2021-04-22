
contract FDC {

    address public foundationWallet;

    function empty() returns (bool) {
        return foundationWallet.call.value(this.balance)();
    }
}

