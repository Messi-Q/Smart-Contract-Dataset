contract SMARTRealty {
    struct ICOPhase {
        uint fromTimestamp;  
        uint toTimestamp;
        uint bonus;  
    }
    mapping(uint => ICOPhase) phases;
    uint icoPhaseCounter = 100;

    function getCurrentICOPhaseBonus() public view returns (uint _bonus, uint icoPhaseId) {
        uint currentTimestamp = block.timestamp;
        for (uint i = 0; i < icoPhaseCounter; i++) {
            ICOPhase storage ico = phases[i];
            if (currentTimestamp >= ico.fromTimestamp && currentTimestamp <= ico.toTimestamp) {
                return (ico.bonus, i);
            }
        }
    }
}