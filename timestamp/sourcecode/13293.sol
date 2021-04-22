contract Namahecrowdsale{
    uint256 public openingTime;
    uint256 public rate = 1000;
     
    function getRate() public view returns (uint256) {
        if (block.timestamp <= (openingTime + (14 days))) {
            return rate + (200);
        }
        return rate;
    }
}