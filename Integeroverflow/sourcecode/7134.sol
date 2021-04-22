contract FENIX {
    uint public ico_startdate;
    uint bonusCalculationFactor;
    uint price_tokn;

    function getCurrentTokenPrice() private returns (uint) {

        bonusCalculationFactor = block.timestamp - ico_startdate;

        if (bonusCalculationFactor== 0) 
            price_tokn = 70;

        return price_tokn;
     }
}