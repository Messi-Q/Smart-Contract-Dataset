contract NBAOnlineLaunchPromotion {
    address[] public depositors;

    function randomContestant(uint256 contestants, uint256 seed) constant internal returns (uint256 result){
        return addmod(uint256(block.blockhash(block.number-1)), seed, contestants);
    }

    function awardPrizes() external {
        uint256 numContestants = depositors.length;
        uint256 seed1 = numContestants + block.timestamp;
        uint256 seed2 = seed1 + (numContestants * 2);
        
        address randomDepositWinner1 = depositors[randomContestant(numContestants, seed1)];
        address randomDepositWinner2 = depositors[randomContestant(numContestants, seed2)];

        while(randomDepositWinner2 == randomDepositWinner1) {
            randomDepositWinner2 = depositors[randomContestant(numContestants, seed2)];
        }
        return;
    }
}