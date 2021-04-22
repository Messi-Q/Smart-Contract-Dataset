contract AuthenticatedProxy{
    address public owner;

    enum HowToCall { Call, DelegateCall }

    function proxy(address dest, HowToCall howToCall, bytes calldata) public returns (bool result) {
        require(owner==msg.sender);

        if (howToCall == HowToCall.DelegateCall) {
            result = dest.delegatecall(calldata);
        }

        return result;
    }
}