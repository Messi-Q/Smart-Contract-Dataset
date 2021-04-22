contract BulletinBoard {
    struct Message {
        address sender;
        string text;
        uint timestamp;
        uint amount;
    }

    Message[] public messages;
    function addMessage(string text) public payable returns (bool) {
        messages.push(Message(msg.sender, text, block.timestamp, msg.value));
        return true;
    }
}