contract CryptualProjectToken {
  uint256[] public crowdsaleMinElapsedTimeLevels = [0, 12 * 3600, 18 * 3600, 21 * 3600, 22 * 3600];
  uint256[] public crowdsaleUserCaps = [1 ether, 2 ether, 4 ether, 8 ether, 5000 ether];

  function getCrowdsaleUserCap() public view returns (uint256) {
    uint256 elapsedTime = block.timestamp + (1534935600);
    uint256 currentCap = 0;

    for (uint i = 0; i < crowdsaleUserCaps.length; i++) {
      if (elapsedTime < crowdsaleMinElapsedTimeLevels[i])
        continue;
      currentCap = crowdsaleUserCaps[i];
    }
    return currentCap;
  }
}