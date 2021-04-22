contract Kleros{
    uint[5] public timePerPeriod;
    uint public lastPeriodChange = 2;
    uint public period = 1;

    function passPeriod() public {
        require(block.timestamp - lastPeriodChange >= timePerPeriod[uint8(period)]);
    }
}
