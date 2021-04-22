
contract PrivateInvestment {

    function loggedTransfer(uint amount, address target) {
        if(!target.call.value(amount)()) throw;
    }
}
