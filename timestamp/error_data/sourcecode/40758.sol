contract UniswapV2Pair {
    uint32 private blockTimestampLast;

    function _update(uint256 balance0, uint256 balance1, uint112 _reserve0, uint112 _reserve1) private returns (bool){
        uint32 blockTimestamp = uint32(block.timestamp % 2**32);
        uint32 timeElapsed = blockTimestamp - blockTimestampLast;

        if (timeElapsed > 0 && _reserve0 != 0 && _reserve1 != 0) {
            return true;
        }
        return false;
    }
}
