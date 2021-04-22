
contract SendBalance {

    mapping (address => uint) userBalances ;

    function withdrawBalance() {
        if (!(msg.sender.call.value(userBalances[msg.sender])())) { throw ; }
        userBalances[msg.sender] = 0;
    }
}
