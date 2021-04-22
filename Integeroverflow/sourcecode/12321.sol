contract ProgressiveIndividualCappedCrowdsale {
    uint public startGeneralSale;
    uint public constant TIME_PERIOD_IN_SEC = 1 days;

    function getCurrentEthCapPerAddress() public constant returns(uint) {
        uint time = block.timestamp;
        uint timeSinceStartInSec = time - startGeneralSale;
        uint currentPeriod = timeSinceStartInSec / (TIME_PERIOD_IN_SEC);
        return currentPeriod * 2;
    }
}
