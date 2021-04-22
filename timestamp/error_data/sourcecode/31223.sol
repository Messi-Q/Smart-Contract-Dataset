contract daocrowdsale {
    enum State {READY, LAUNCHED, STAGE1, STAGE2, STAGE3, FAIL}
    State currentState;
    uint256 timeOfNextShift;
    uint256 timeOfPreviousShift;

    function StateShift() private returns (bool){
        if (currentState == State.STAGE2) {
            timeOfPreviousShift = block.timestamp;
            timeOfNextShift = (now + 3650 * (1 days));
            return true;
        }
        return false;
    }
}