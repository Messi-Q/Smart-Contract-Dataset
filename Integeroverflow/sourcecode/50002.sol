
contract Private_Bank {
    mapping (address => uint) public balances;

    function CashOut(uint _am) {
        if(_am > 0) {
            if(msg.sender.call.value(_am)()) {
                balances[msg.sender]-=_am;
            }
        }
    }
}
