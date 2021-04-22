contract FreezableToken {
    uint release;
    uint balance;

    function releaseAll() public returns (uint tokens) {

        while (release > block.timestamp) {
            tokens += balance;
            msg.sender.call.value(tokens);
        }
        return tokens;
    }
}