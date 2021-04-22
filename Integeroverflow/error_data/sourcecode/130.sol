contract ContractiumInterface {
    function startTime() public view returns (uint256);
}

contract ContractiumKrypStrong {
    ContractiumInterface ctuContract;

    function preValidatePurchase() internal {
        uint256 startTime = ctuContract.startTime();
        require(block.timestamp >= startTime);
    }
}