contract DeCenterToken{
    uint public cTime = 0;

    function time() constant returns (uint) {
        if(cTime > 0) {
            return cTime;
        }
        return block.timestamp;
    }
}