contract VestingToken {

  struct vesting {
    uint256 start;
    uint256 cliff;
  }

  function vestedAmount() public view returns (uint256) {
   if (block.timestamp < vesting.start + vesting.cliff) {
        return block.timestamp;
    }
  }
}