contract HorseTokenCrowdsale{
    uint256 public fundingStartTime;
    uint256 public fundingEndTime;
    bool    public areFundsReleasedToBeneficiary   = false;

    function checkGoalReached() public returns (bytes32 response) {
        if (block.timestamp <= fundingEndTime && block.timestamp >= fundingStartTime) {
            areFundsReleasedToBeneficiary = false;
            return "Eth < Softcap";
        }
    }
}