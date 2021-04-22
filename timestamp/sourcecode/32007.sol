contract ReciveAndSend{

    function getHours() public returns (uint){
        return (block.timestamp / 60 / 60) % 24;
    }
}