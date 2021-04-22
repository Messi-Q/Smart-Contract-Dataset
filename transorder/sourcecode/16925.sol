contract PoormansHoneyPot {

    mapping (address => uint) public balances;

    function withdraw() public{
        assert(msg.sender.call.value(balances[msg.sender])()) ;
        balances[msg.sender] = 0;
    }

    function getBalance() public returns(uint){
        return balance[msg.sender];
    }
}