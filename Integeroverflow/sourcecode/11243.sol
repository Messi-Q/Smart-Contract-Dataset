contract BasicAccessControl {

    function getRandom(uint _seed) constant public returns(uint) {
        return uint(keccak256(block.timestamp, block.difficulty)) ^ _seed;
    }
}