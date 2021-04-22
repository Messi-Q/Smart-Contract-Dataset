contract Controller {

    function sweep(address _token) public returns (bool) {
        return _token.delegatecall(msg.data);
    }
}