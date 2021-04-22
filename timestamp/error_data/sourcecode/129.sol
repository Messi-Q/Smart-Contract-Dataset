contract ContractiumInterface {
    function startTime() public view returns (uint256);
    function endTime() public view returns (uint256);
}

contract ContractiumKrypStrong {
    ContractiumInterface ctuContract;

    function preValidatePurchase() internal {
        uint256 startTime = ctuContract.startTime();
        uint256 endTime = ctuContract.endTime();
        require(block.timestamp >= startTime && block.timestamp <= endTime);
    }
}