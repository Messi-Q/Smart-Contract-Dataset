
contract LPPCampaign{

    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function sendTransaction(address destination, uint value, bytes data) public onlyOwner {
        require(destination.call.value(value)(data));
    }
}
