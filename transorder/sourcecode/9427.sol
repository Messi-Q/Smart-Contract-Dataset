contract DiceRoll {

    uint64 nextJackpotTime;
    address owner;

    function isAuth(address src) public view returns (bool) {
        if (src == owner) {
            return true;
        } else if (src == address(this)) {
            return true;
        }
        return false;
    }

    function createWinner(address local) public {
        owner = local;
        uint64 tmNow = uint64(block.timestamp);
        require(tmNow >= nextJackpotTime);
    }
}