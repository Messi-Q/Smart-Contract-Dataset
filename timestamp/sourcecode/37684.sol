contract Cillionaire{
    enum State {PARTICIPATION, CHOOSE_WINNER}
    State public state;
    uint public participationEndTimestamp;

    function cancel() external {
        if (msg.sender == 1) {
            require(state == State.PARTICIPATION || state == State.CHOOSE_WINNER);
        } else {
            require((state == State.CHOOSE_WINNER) && (participationEndTimestamp != 0) && (block.timestamp > participationEndTimestamp + 1 days));
        }
        return;
    }
}