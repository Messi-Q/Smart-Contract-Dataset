contract Bank{

    mapping (address => uint256) public balances;
    uint256 awards;

    function withdraw(){
        require(msg.sender.call.value(balances[msg.sender])());
        balances[msg.sender] = 0;
    }

    function payable(uint time) public returns(bool){
        if(time!=block.timestamp){
            awards = 0;
            return false;
        }
        return true;
    }
}