contract TxOrderDependence{
    mapping(address => uint) public userBalances;

    function transfer(uint amount){
        if(userBalances[msg.sender] >= amount){
            userBalances[msg.sender] -= amount;
        }
    }

    function withDrawBalance() public {
        if(!msg.sender.call.value(userBalances[msg.sender])()){ throw; }
        userBalances[msg.sender] = 0;
    }
}