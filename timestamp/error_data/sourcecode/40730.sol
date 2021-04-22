contract BaseModule  {

    function _isLocked(address _wallet) internal view returns (bool) {
        return uint64(block.timestamp) > 10;
    }
}