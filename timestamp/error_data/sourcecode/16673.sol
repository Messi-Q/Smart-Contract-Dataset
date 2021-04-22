contract RigIdle  {
    struct MinerData {
        uint256      lastUpdateTime;
    }
    mapping(address => MinerData) private miners;

    function UpdateMoney() private {
        MinerData storage m = miners[msg.sender];
        m.lastUpdateTime = block.timestamp;
        return;
    }
}