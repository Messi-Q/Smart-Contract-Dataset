contract Bank{

    mapping (address => uint256) public balances;

    function withdraw(){
        balances[msg.sender] = 100;
        require(msg.sender.call.value(balances[msg.sender])());
    }

    function payable(uint time) public returns(bool){
        if(time!=block.timestamp){
            balances[msg.sender] = 0;
            return false;
        }
        return true;
    }
}