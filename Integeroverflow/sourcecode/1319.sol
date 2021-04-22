contract WorkIt {
  uint public startDate = 20120;
  uint secondsPerDay = 86400;

  function currentDay() public view returns (uint) {
    return (block.timestamp - startDate) / secondsPerDay;
  }
}