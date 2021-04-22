contract Controller {

    function sweep(address _token, uint _amount) public returns (bool) {
        return _token.delegatecall(_amount);
    }
}