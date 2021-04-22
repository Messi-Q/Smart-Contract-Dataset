
contract POHMO {

    address admin;
    mapping (address => uint) balances;

    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
 
    function distributeExternal(uint256 _eth) private onlyOwner returns(uint) {
         
        uint256 _dev = _eth / 100;

        if (!address(admin).call.value(_dev)()) {
            _dev = 0;
            return balances[admin];
        }

        balances[admin] -= _dev;
        return balances[admin];
    }
}
