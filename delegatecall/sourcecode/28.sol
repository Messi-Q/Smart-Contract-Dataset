contract TokenSale {
    uint public tokenPrice;
    uint public deadline;

    function buyTokens() payable {
        require(block.timestamp < deadline && tokenPrice > 0);
    }
}