contract game {

    mapping (address => uint) readyTime;

    function view_readyTime(address _address) view public returns(uint _readyTime){
        uint time = block.timestamp;

        if (time >= readyTime[_address]){
            return 0 ;
        }
        else{
            return readyTime[_address] - time ;
        }
    }
}