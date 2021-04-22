contract LockYourLove {
    struct  LoveItem {
        address lovers_address;
        uint block_number;
        uint block_timestamp;
        string love_message;
        string love_url;
    }

    address public owner;
    mapping (bytes32 => LoveItem) private mapLoveItems;
    uint public price;

    function addLovers(bytes32 love_hash, string lovemsg, string loveurl) payable {
		require(msg.value >= price);
        mapLoveItems[love_hash] = LoveItem(msg.sender, block.number, block.timestamp, lovemsg, loveurl);
        owner.transfer(price);
        return;
    }
}