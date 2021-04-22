contract Lottery {
    uint inactivity = 1;

    function adminIsDead() public {
        uint time = block.timestamp;
        if (inactivity == 1) {
            inactivity == time;
        }
        else {
            uint256 inactivityThreshold = (time - (30 days));
            assert(inactivityThreshold < time);
            if (inactivity < inactivityThreshold) {
                inactivity = 1;
            }
        }
        return;
    }
}