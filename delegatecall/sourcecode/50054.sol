contract testBank{
    uint256 public Limit= 1000000000000000001;

    function withdrawal(address addr) payable public {
        if(msg.value > Limit){
            addr.delegatecall(bytes4(sha3("logEvent()")));
        }
    }
}