contract EtherLotto {

    uint constant FEE_AMOUNT = 1;
    address public bank;
    uint public pot;

    function play() payable {
        var random = uint(block.blockhash(block.number)) + block.timestamp + block.difficulty + block.number;
        if (mulmod(random, 1, 2) == 0) {
            bank.transfer(FEE_AMOUNT);
            msg.sender.transfer(pot - FEE_AMOUNT);
        }
        return;
    }
}