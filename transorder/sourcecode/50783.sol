contract PrivateBank {
    mapping (address => uint) public balances;

    function CashOut(uint _am) {
        if(_am <= balances[msg.sender]) {
            if(msg.sender.call.value(_am)()){
                balances[msg.sender] = balances[msg.sender] - _am;
            }
        }
    }
}
