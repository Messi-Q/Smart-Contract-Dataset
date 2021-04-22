contract TANDER {
     uint256 public pre_startdate;
     uint bonusCalculationFactor;

     function bonuscalpre() private returns (uint256 cp) {
          uint bon = 8;
          bonusCalculationFactor = (block.timestamp - (pre_startdate)) / (604800);
          if(bonusCalculationFactor == 0) {
                bon = 8;
          }
          else{
                bon -= bonusCalculationFactor * 8;
          }
          return bon;
      }
}