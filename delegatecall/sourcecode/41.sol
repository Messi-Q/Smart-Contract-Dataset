
contract ERC20TokenInterface {
    function balanceOf (address tokenOwner) external constant returns (uint balance);
}

 
contract TwoYearDreamTokensVesting {

    uint256 public vestingStartUnixTimestamp;

    function initializeVestingFor (address account) external returns (uint256) {
        vestingStartUnixTimestamp = block.timestamp;
        return vestingStartUnixTimestamp;
    }
}