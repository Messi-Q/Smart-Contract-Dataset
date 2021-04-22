contract UniswapV2Pair {

    uint32  private blockTimestampLast;  

    uint public price0CumulativeLast;
    uint public price1CumulativeLast;

    function _update(uint balance0, uint balance1, uint112 _reserve0, uint112 _reserve1) private {
        uint32 blockTimestamp = uint32(block.timestamp % 2**32);
        uint32 timeElapsed = blockTimestamp - blockTimestampLast;

        if (timeElapsed > 0 ) {
            price0CumulativeLast += _reserve0 * timeElapsed;
            price1CumulativeLast += _reserve1 * timeElapsed;
        }
    }
}