contract LoanTokenLogicStandard{

    function tokenPrice()public view returns (uint256)  {
        uint256 lastSettleTime_;
        if (lastSettleTime_ != uint88(block.timestamp)) {
            return lastSettleTime_;
        }
        return 0;
    }
}