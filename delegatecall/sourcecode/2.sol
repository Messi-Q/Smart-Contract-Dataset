contract TokenLock {
    mapping (address => bool) owners;
    mapping (address => uint256) public lockAmounts;
    mapping (address => uint256) public releaseTimestamps;

    function release(address _addr) external returns (bool){
        require(block.timestamp >= releaseTimestamps[_addr]);
        lockAmounts[_addr] = 0;
        releaseTimestamps[_addr] = 0;
        return true;
    }
}