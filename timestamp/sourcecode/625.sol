contract VestingToken {

  struct Vesting {
    uint256 start;           
    uint256 cliff;
  }
  mapping(address => Vesting) public vestings;

  function vestedAmount(address _beneficiary) public view returns (uint256) {
    Vesting storage vesting = vestings[_beneficiary];

    if (block.timestamp < vesting.start + vesting.cliff) {
        return block.timestamp;
    }
  }
}