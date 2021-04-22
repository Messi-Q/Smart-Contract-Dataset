
contract Reentrance {
    mapping (address => uint) userBalance;

    function withdrawBalance_fixed() {
        uint amount = userBalance[msg.sender];
        userBalance[msg.sender] = 0;
        if(!(msg.sender.call.value(amount)())){ throw; }
    }
}
