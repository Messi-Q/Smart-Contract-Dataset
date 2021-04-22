
contract TokenTimelock {

    uint256 public cliffPeriod;
    uint256 public chunksAlreadyVested;

   function release() public returns (uint256){
    uint256 chunksNeeded = (block.timestamp - (cliffPeriod));
    if (chunksNeeded > 10) {
        chunksNeeded = 10;
    }
    chunksAlreadyVested = chunksNeeded;
    return chunksAlreadyVested;
  }
}