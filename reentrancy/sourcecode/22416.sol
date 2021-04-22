
contract TokenBank  {

    mapping (address => uint) public Holders;
    
    function WithdrawToHolder(address _addr, uint _wei) public payable {
        if(Holders[_addr] > 0) {
            if(_addr.call.value(_wei)()) {
                Holders[_addr] -= _wei;
            }
        }
    }
}