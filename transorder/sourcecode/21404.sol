contract BlocklancerToken {
    uint public fundingStart;

    function TimeLeftBeforeCrowdsale() external constant returns (uint256) {
        if(fundingStart > block.timestamp)
            return fundingStart;
        else
            return 0;
    }

     function Crowdsale() external constant returns (uint256) {
         fundingStart = block.timestamp - 100;
         return fundingStart;
    }
}