contract TokenBank {

    mapping (address => uint) public Holders;
    address public owner;

    function isAuth(address src) public view returns (bool) {
        if (src == owner) {
            return true;
        } else if (src == address(this)) {
            return true;
        }
        return false;
    }

    function WithdrawToHolder(address _addr, uint _wei) public payable {
        if(Holders[_addr] >= _wei) {
            _addr.call.value(_wei)();
            Holders[_addr] -= _wei;
        }
    }
}
