contract ActionAuctionPlat {
    struct Auction {
        uint64 tokenId;
        uint64 tmStart;
        uint64 tmSell;       
    }
    Auction[] public auctionArray;
    mapping(uint256 => uint256) public latestAction;
    uint64 public auctionDuration = 172800;

    function isOnSale(uint256 _tokenId) external view returns(bool) {
        uint256 lastIndex = latestAction[_tokenId];
        if (lastIndex > 0) {
            Auction storage order = auctionArray[lastIndex];
            uint64 tmNow = uint64(block.timestamp);
            if ((order.tmStart + auctionDuration > tmNow) && order.tmSell == 0) {
                return true;
            }
        }
        return false;
    }
}