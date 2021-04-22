
contract UniswapV2OracleLibrary {

    function currentBlockTimestamp() internal view returns (uint32) {
        return uint32(block.timestamp % 2 ** 32);
    }
}