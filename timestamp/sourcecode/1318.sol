contract WorkIt {
  uint public startDate;
  uint secondsPerDay = 86400;

  address public owner;
  modifier onlyOwner() {
        require(msg.sender == owner);
        _;
  }

  function currentDay() public view onlyOwner() returns (uint) {
    return (block.timestamp - startDate) / secondsPerDay;
  }
}