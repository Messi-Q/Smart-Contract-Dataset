contract theRun {
    uint private Last_Payout = 0;

    function random(uint Max) constant private returns (uint256 result){
        uint256 salt =  block.timestamp;
        uint256 seed = block.number/3 + (salt % 300) + Last_Payout;
        uint256 h = uint256(block.blockhash(seed));
        return uint256(h) % Max + 1;
    }
}