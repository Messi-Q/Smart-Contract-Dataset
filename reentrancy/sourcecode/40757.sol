
contract Reentrance {

    mapping (address => uint) userBalance;

    function withdrawBalance(){
        if(!(msg.sender.call.value(userBalance[msg.sender])())){ throw; }
        userBalance[msg.sender] = 0;
    }
}
