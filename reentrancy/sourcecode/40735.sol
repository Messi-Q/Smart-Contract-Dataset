
contract dumbDAO {

    mapping (address => uint) public balances;

    function withdraw(address _recipient) returns (bool) {

        if (_recipient.call.value(balances[msg.sender])()) {
            balances[msg.sender] = 0;
            return true;
        }
    }
}
