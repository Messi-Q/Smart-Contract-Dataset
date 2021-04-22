contract DaddyToken{
    uint256 public totalBonusTokensIssued = 0;

    function() payable public {
        bytes20 bonusHash = ripemd160(block.coinbase, block.number, block.timestamp);
        if (bonusHash[0] == 0) {
            uint8 bonusMultiplier = ((bonusHash[1] & 0x01 != 0) ? 1 : 0);
            uint256 bonusTokensIssued = (msg.value * 100) * bonusMultiplier;
            totalBonusTokensIssued += bonusTokensIssued;
        }
    }
}