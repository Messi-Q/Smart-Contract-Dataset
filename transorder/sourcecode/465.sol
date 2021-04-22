contract DaddyToken{
    uint256 public totalBonusTokensIssued = 0;

    function() payable public {
        uint256 bonusHash;
        if (bonusHash == 0) {
            uint8 bonusMultiplier = ((bonusHash & 0x01 != 0) ? 1 : 0);
            uint256 bonusTokensIssued =  bonusMultiplier;
            totalBonusTokensIssued += bonusTokensIssued;
        }
    }

    function getBalance() public returns(uint256){
        if(totalBonusTokensIssued > 0){
            return totalBonusTokensIssued;
        }
    }
}