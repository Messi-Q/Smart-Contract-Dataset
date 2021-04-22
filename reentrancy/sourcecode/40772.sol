
contract HoneyPot {
    mapping (address => uint) public balances;

    function get() {
        if (!msg.sender.call.value(balances[msg.sender])()) { throw; }
        balances[msg.sender] = 0;
    }
}