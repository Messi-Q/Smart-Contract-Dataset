contract LoanOpenings {

    function _finalizeOpen(){
        uint256 startTimestamp = now;
        uint256 isTorqueLoan = 4;
        uint256 collateralToLoanRate = 5;
        uint256 startRate;

        if (startTimestamp == block.timestamp) {
            if (isTorqueLoan != 0) {
               startRate = collateralToLoanRate;
            } else {
               startRate = 0;
            }
        }
    }
}
