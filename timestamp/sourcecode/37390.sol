contract RaffleStrangeLoop {

    uint public chooseWinnerDeadline;
    bytes32 public serverSeedHash;

    function RaffleStrangeLoop(bytes32 secretHash) {
        serverSeedHash = secretHash;
        chooseWinnerDeadline = block.timestamp + 15 days;
        return;
    }
}