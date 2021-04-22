contract TMTG {
    uint256 public openingTime;

    function setOpeningTime() public returns (bool) {
        openingTime = block.timestamp;
        return true;
    }
}