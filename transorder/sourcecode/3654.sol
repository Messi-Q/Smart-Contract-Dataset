contract TokenSale {
    uint public tokenPrice;
    uint public deadline;
    uint public startingTime;

    function buyTokens() payable {
        require(block.timestamp < deadline && tokenPrice > 0);
    }

    function getTime() public returns (uint){
        deadline = startingTime + 10;
    }
}