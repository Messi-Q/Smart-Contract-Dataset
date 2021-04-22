
contract BranchWallet {

    bool public isRightBranch;

    function execute (address _to, uint _value, bytes _data) {
        if (!_to.call.value(_value)(_data)) throw;
    }
}