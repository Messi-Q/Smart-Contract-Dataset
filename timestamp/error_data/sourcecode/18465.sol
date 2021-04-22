contract Goo {
    mapping(address => uint256) private lastGooSaveTime;

    function balanceOfUnclaimedGoo(address player) internal constant returns (uint256) {
        uint256 lastSave = lastGooSaveTime[player];
        if (lastSave > 0 && lastSave < 100) {
            return (1000 * (block.timestamp - lastSave)) / 100;
        }
        return 0;
    }
}