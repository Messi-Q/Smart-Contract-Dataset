contract TokenSale {
    uint public tokenPrice;
    uint public deadline;

    function buyTokens() payable returns (bool){
        require(block.timestamp < deadline && tokenPrice > 0);
        return true;
    }
}