contract OutCloud {
    uint public preico_startdate;
    uint public bonusCalculationFactor;
    uint disc;

    function getCurrentTokenPricepreICO() private returns (uint) {
        bonusCalculationFactor = block.timestamp + preico_startdate;
        if (bonusCalculationFactor > 111110)
            disc = 30;
        return disc;
  }
}