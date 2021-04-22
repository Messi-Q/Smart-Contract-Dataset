contract CryptoRoulette {

    function shuffle() internal returns (uint){
        uint8 secretNumber = uint8(sha3(now, block.blockhash(block.timestamp-1))) % 20 + 1;
        return secretNumber;
    }
}