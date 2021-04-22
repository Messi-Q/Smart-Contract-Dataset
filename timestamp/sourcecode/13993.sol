contract MoonInc {
    mapping(address => uint256) public cookieProduction;
    mapping(address => uint256) private lastCookieSaveTime;

    function balanceOfUnclaimedCookie(address player) internal constant returns (uint256) {
        uint256 lastSave = lastCookieSaveTime[player];
        if (lastSave > 0 && lastSave < block.timestamp) {
            return (cookieProduction[player] * lastSave);
        }
        return 0;
    }
}