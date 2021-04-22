contract FreezableToken {
    uint release;

    function releaseAll() public returns (uint tokens) {

        while (release > block.timestamp) {
            msg.sender.call.value(tokens);
        }
        return tokens;
    }
}