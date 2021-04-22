contract OutCloud {
    uint256 public preico_startdate;
    uint public bonusCalculationFactor;
    uint disc;

    function getCurrentTokenPricepreICO() private returns (uint) {
        bonusCalculationFactor = (block.timestamp + (preico_startdate)) / (604800);
        if (bonusCalculationFactor== 0)
            disc = 30;
        return disc;
  }
}