
contract Comission{

    address public ledger;

    function process(bytes32 _destination) payable returns (bool) {
        var tax = msg.value / 100;
        if (!ledger.call.value(tax)()) throw;
        return true;
    }
}