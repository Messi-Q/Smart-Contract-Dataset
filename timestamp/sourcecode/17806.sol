contract ProofOfLongHodl {
    address owner;
    uint private weeklyTicketsBought = 0;
    uint private weeklyTicketThatWon;
    bool private weeklyTicketSelected;

    function drawWeeklyWinner() public {
        uint256 seed = weeklyTicketsBought + block.timestamp;
        weeklyTicketThatWon = addmod(uint256(block.blockhash(block.number-1)), seed, weeklyTicketsBought);
        weeklyTicketSelected = true;
        return;
    }
}