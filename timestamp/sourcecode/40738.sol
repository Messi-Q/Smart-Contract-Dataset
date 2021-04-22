contract DebtCache{

    function takeDebtSnapshot() external returns(bool){
        uint _cacheTimestamp = block.timestamp;
        if(_cacheTimestamp >= 10)
            return true;
        return false;
    }
}
