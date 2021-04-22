contract BitSongCrowdsale {
    address public owner;
    uint256 public openingTime;
    uint256 public closingTime;
    uint256 public duration;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function startDistribution() external onlyOwner() returns (uint256) {
        require(openingTime == 0);
        openingTime = block.timestamp;
        closingTime = openingTime + duration;
        return closingTime;
    }
}