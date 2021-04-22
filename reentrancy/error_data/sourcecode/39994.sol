
contract Base {

    function safeSend(address _recipient, uint _ether) internal returns (bool success_){
        if(!_recipient.call.value(_ether)()) throw;
        success_ = true;
    }
}