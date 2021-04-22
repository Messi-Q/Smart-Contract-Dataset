contract RandomApi {
    uint64 _seed = 0;

    function random256() public returns (uint256 randomNumber) {
        uint256 rand = uint256(keccak256(keccak256(block.blockhash(block.number - 1), _seed), block.timestamp));
        _seed = uint64(rand);
        return rand;
    }
}
