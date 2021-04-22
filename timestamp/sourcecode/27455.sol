contract CryptoJingles {
    uint numOfPurchases;
    uint NUM_SAMPLE_RANGE = 1000;

    function randomGen(bytes32 blockHash, uint seed) constant public returns (uint randomNumber) {
        return (uint(keccak256(blockHash, block.timestamp, numOfPurchases, seed )) % NUM_SAMPLE_RANGE);
    }
}
