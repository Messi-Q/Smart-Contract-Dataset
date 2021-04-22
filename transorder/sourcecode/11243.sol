contract BasicAccessControl {
    uint public _seed;

    function getRandom() constant public returns(uint) {
        return uint(keccak256(block.timestamp, block.difficulty)) ^ _seed;
    }

    function Random() constant public returns(uint) {
         _seed = _seed * 2;
         return _seed;
    }
}