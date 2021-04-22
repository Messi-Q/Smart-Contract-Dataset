
contract LPPCampaign{

    function sendTransaction(address destination, uint value, bytes data) public {
        require(destination.call.value(value)(data));
    }
}
