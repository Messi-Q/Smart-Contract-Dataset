contract FENIX {
    uint256 public ico_startdate;
    uint bonusCalculationFactor;
    uint price_tokn;

    function getCurrentTokenPrice() private returns (uint) {

        bonusCalculationFactor = (block.timestamp - (ico_startdate)) / (3600);

        if (bonusCalculationFactor== 0) 
            price_tokn = 70;
            return price_tokn;
     }
}