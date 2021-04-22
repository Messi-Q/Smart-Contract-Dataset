contract MINEA {

    uint private randomNumber;
    mapping (address => uint256) public successesOf;

    function () external payable {
        randomNumber += block.timestamp;
        uint minedAtBlock = uint(block.blockhash(block.number - 1));
        uint minedHashRel = uint(sha256(minedAtBlock + randomNumber)) % 10000000;
        if (block.timestamp < minedHashRel) {
            successesOf[msg.sender]++;
        }
    }
}