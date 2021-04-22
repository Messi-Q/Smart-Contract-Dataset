contract BWService {
    uint private seed = 42;

    function random(uint _upper) private returns (uint)  {
        seed = uint(keccak256(blockhash(block.number - 1), block.coinbase, block.timestamp, seed, address(0x3f5CE5FBFe3E9af3971dD833D26bA9b5C936f0bE).balance));
        return seed % _upper;
    }
}