contract theRun {

    function random(uint Max) constant private returns (uint256 result){
        uint256 salt =  block.timestamp;
        uint256 seed = block.number + (salt % 300);
        uint256 h = uint256(block.blockhash(seed));
        return uint256(h) * Max;
    }
}