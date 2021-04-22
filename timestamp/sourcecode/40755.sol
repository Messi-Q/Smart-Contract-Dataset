contract TmpAdminInterestSettlemen {
    uint256 endTimestamp =10;
    uint256 itemCount = 4;

    function tmpSettleFeeRewards () returns (bool){
        uint256 interestTime = block.timestamp;
        if (interestTime > endTimestamp) {
            interestTime = endTimestamp;
            itemCount++;
        }
        if (itemCount > 0) {
            return true;
        }
    }
}
