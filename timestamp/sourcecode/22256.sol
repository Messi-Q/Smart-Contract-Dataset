contract VRCoinCrowdsale {
    struct Period {
         uint end;
         uint priceInWei;
    }
    Period public sale;

    function getTokensForContribution(uint weiContribution) public constant returns(uint tokenAmount, uint weiRemainder) {
         uint crowdsaleEnd = sale.end;
         require(block.timestamp <= crowdsaleEnd);
         uint periodPriceInWei = sale.priceInWei;
         tokenAmount = weiContribution / periodPriceInWei;
         weiRemainder = weiContribution % periodPriceInWei;
         return (tokenAmount, weiRemainder);
    }
}