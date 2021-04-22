contract Consulting {
    address public engineer;
    uint public updatedTime;
     
    function payout() returns (bool _success) {
        if(msg.sender == engineer ) {
             engineer.send(this.balance / 2);
             updatedTime = block.timestamp;
             _success = true;
        }
    }
}