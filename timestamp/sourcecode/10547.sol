contract ATTRToken  {
    uint256 public releaseTime = uint256(1536278399);

    function setReleaseTime(uint256 _time) public returns (bool){
        require(_time > block.timestamp);
        releaseTime = _time;
        return true;
    }
}