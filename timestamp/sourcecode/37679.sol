contract ContinuousSale {

    uint256 public constant BUCKET_SIZE = 12 hours;
    uint256 public lastBucket = 0;
    uint256 public bucketAmount = 0;

    function prepareContinuousPurchase() internal {
        uint256 timestamp = block.timestamp;
        uint256 bucket = timestamp - (timestamp % BUCKET_SIZE);
        if (bucket > lastBucket) {
            lastBucket = bucket;
            bucketAmount = 0;
        }
        return;
    }
}