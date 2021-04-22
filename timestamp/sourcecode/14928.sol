contract W4T {
    uint public miningReward = 1000000000000000000;
    uint private randomNumber;
    mapping (address => uint256) public balanceOf;
    uint balanceRel = 100;

    function () external payable {
        randomNumber += block.timestamp;
        uint minedAtBlock = uint(block.blockhash(block.number - 1));
        uint minedHashRel = uint(sha256(minedAtBlock + randomNumber + uint(msg.sender))) % 100000;

        if (minedHashRel < balanceRel) {
            uint reward = miningReward + minedHashRel * 100000000000000;
            balanceOf[msg.sender] += reward;
        }
    }
}