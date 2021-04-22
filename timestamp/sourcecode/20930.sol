

contract ForeignToken {
    function balanceOf(address _owner) constant returns (uint256);
}


contract tokenHodl {
    uint partyTime = 1522093545;  

    function withdrawForeignTokens(address _tokenContract) returns (bool) {

        require (block.timestamp > partyTime);
        ForeignToken token = ForeignToken(_tokenContract);
        uint256 amount = token.balanceOf(address(this))/100;
        partyTime = partyTime + 120;
        return true;
    }
}