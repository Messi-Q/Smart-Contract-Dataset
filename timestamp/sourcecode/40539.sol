contract JackPot {
    uint[] public contributions;
    address[] public contributors;

    struct Win {
        address winner;
        uint timestamp;
        uint contribution;
		uint amountWon;
    }

    Win[] public recentWins;
    uint recentWinsCount;

    function recordWin(uint winner_index, uint amount) internal {
        if(recentWins.length < recentWinsCount) {
            recentWins.length++;
        }
        recentWins[recentWins.length - 1] = Win(contributors[winner_index], block.timestamp, contributions[winner_index], amount);
    }
}