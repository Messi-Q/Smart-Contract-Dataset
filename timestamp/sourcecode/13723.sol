contract SPCoin {
    uint256 public pre_startdate;
    uint bonusCalculationFactor;

    function bonuscalpre() private returns (uint256 cp) {
      uint bon = 30;
      bonusCalculationFactor = (block.timestamp - (pre_startdate)) / (86400);
      if(bonusCalculationFactor == 0) {
          bon = 30;
      }
      else{
          bon -= bonusCalculationFactor * 2;
      }
      return bon;
    }
}