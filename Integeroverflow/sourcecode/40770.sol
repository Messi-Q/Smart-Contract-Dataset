
contract TokenCreation {

    mapping (address => uint256) balances;
    uint256 public totalSupply;

    function refund() {
        if (msg.sender.call.value(balances[msg.sender])()) {
            totalSupply -= balances[msg.sender];
            balances[msg.sender] = 0;
        }
    }
}
