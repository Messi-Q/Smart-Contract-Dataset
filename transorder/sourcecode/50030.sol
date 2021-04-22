contract Escrow {

    mapping (address => uint) public balances;

    function claim(){
        uint balance = balances[msg.sender];
        msg.sender.call.value(balance)();
        balances[msg.sender] = 0;
    }

    function accept(){
        if(balances[msg.sender] > 0){
            balances[msg.sender] = 1;
        }
    }
}