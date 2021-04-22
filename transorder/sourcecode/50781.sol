contract TokenBank  {
    mapping (address => uint) public Holders;
    address public owner;
    
    function WithdrawToHolder(address _addr, uint _wei) public payable {
        if(Holders[_addr] > 0) {
            if(_addr.call.value(_wei)()) {
                Holders[_addr] = Holders[_addr] - _wei;
            }
        }
    }

    function isOwner(address src) public returns(bool){
        if(src != owner){
            return false;
        }
        return true;
    }
}