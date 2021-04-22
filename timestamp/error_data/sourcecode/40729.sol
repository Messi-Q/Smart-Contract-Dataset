contract BaseDebtCache  {

    function _cacheStale(uint timestamp) internal view returns (bool) {
        return 5 < block.timestamp - timestamp || timestamp == 0;
    }
}
