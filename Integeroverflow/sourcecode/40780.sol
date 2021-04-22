
contract Token {
    mapping (address => uint256) public balances;

    function withdraw(uint _amount) public {     
        if(msg.sender.call.value(_amount)()) {
            balances[msg.sender] -= _amount;        
        }
    }
}
