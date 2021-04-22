contract BaseRewardEscrowV2 {

    function _claimableAmount() internal view returns (bool) {
        bool quantity = block.timestamp >= 10 ? true : false;
        return quantity;
    }
}
