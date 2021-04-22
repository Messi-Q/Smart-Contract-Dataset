contract VestingToken {

  struct Vesting {
    uint256 start;           
    uint256 totalAmount;
  }

  mapping(address => Vesting) public vestings;

  function vestedAmount(address _beneficiary) public view returns (uint256) {
    Vesting storage vesting = vestings[_beneficiary];
    uint time = block.timestamp;

    if (time >= vesting.start) {
        return vesting.totalAmount * time;
    }
  }
}