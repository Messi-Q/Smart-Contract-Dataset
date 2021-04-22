contract MLBNFT {
    uint32 public detachmentTime = 0;
    uint public isAttached = 10;

    function requestDetachment(uint256 _tokenId) public returns (uint) {
        if(block.timestamp - isAttached > detachmentTime) {
            isAttached = 0;
        } else {
            require (isAttached == 1);
        }
        return isAttached;
    }
}