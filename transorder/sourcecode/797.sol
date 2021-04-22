contract MLBNFT {
    uint public isAttached = 10;

    function requestDetachment(uint256 _tokenId) public returns (uint) {
        if(isAttached > 1) {
            require(isAttached == 1);
        }
        return isAttached;
    }
}