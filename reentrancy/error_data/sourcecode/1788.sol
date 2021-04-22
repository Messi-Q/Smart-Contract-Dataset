
contract POHMO {

    address admin;
    mapping (address => uint) balances;
 
    function distributeExternal(uint256 _eth) private returns(uint) {
        uint256 _dev = _eth / 100;

        if (!address(admin).call.value(_dev)()) {
            _dev = 0;
            return balances[admin];
        }

        balances[admin] -= _dev;
        return balances[admin];
    }
}
