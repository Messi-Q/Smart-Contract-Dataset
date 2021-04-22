contract WorkIt {
  uint public startDate;
  uint secondsPerDay = 86400;

  function currentDay() public view returns (uint) {
    return (block.timestamp - startDate) / secondsPerDay;
  }
}