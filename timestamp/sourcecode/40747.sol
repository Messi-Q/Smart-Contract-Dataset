contract mockOVM_CrossDomainMessenger{
    struct ReceivedMessage {
        uint256 timestamp;
        address sender;
    }
    ReceivedMessage[] internal fullReceivedMessages;
    uint256 internal lastRelayedMessage;
    uint256 internal delay;
    address  public xDomainMessageSender;

    function relayNextMessage() public {
        ReceivedMessage memory nextMessage = fullReceivedMessages[lastRelayedMessage];
        require(nextMessage.timestamp + delay < block.timestamp);
        xDomainMessageSender = nextMessage.sender;
        lastRelayedMessage += 1;
    }
}
