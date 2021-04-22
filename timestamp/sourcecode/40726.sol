contract CoinLock {
    uint public expiration;

    function lock(uint _expiration) returns (bool) {
        if (_expiration > block.timestamp && expiration == 0) {
            expiration = _expiration;
            return true;
        }
        return false;
    }
}