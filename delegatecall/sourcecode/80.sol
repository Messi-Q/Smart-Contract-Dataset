contract VestingToken {

  struct Vesting {
    uint256 cliff;
  }
  mapping(address => Vesting) public vestings;

  function vestedAmount(address _beneficiary) public view returns (uint256) {
    Vesting storage vesting = vestings[_beneficiary];

    if (block.timestamp < vesting.cliff) {
        return block.timestamp;
    }
  }
}