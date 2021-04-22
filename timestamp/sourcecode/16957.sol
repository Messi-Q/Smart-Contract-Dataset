contract RigIdle {
    struct MinerData {
        uint      money;
        uint      lastUpdateTime;
    }
    
    mapping(address => MinerData) private miners;

    function UpdateMoney() public {
        MinerData storage m = miners[msg.sender];
        uint diff = block.timestamp - m.lastUpdateTime;
        uint revenue = 1123456;
        if(revenue > 0) {
            revenue *= diff;
        }
        return;
    }
}