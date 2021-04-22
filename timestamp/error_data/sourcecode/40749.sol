contract OVM_CanonicalTransactionChain {

    function _validateFirstBatchContext() internal view {
        uint256 forceInclusionPeriodSeconds = 10;
        uint256  _firstContext = 20;
        require(_firstContext + forceInclusionPeriodSeconds >= block.timestamp);
    }
}
