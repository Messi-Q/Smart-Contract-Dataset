contract Cryptoraces {
    uint256 now;

    function random() private view returns (uint) {
        return uint(keccak256(block.difficulty, block.timestamp, now));
    }
}