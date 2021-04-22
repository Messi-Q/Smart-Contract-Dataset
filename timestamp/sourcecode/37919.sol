contract BlocklancerToken {

    uint public fundingStart;
    uint256 soldAfterPowerHour;

    function getExchangeRate() constant returns(uint){
        if(fundingStart + 1 * 1 days > block.timestamp){
            return 15000;
        } else {
            uint256 decrease = 100 - (soldAfterPowerHour/10000000/1000000000000000000);
            if(decrease < 70) {
                decrease = 70;
            }
            return 10000 * decrease / 100;
        }
    }
}