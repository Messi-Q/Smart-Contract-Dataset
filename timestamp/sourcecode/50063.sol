contract UniswapV2Pair {

    uint112 private reserve0;            
    uint112 private reserve1;            
    uint32  private blockTimestampLast;  

    uint public price0CumulativeLast;
    uint public price1CumulativeLast;

    function _update(uint balance0, uint balance1, uint112 _reserve0, uint112 _reserve1) private {
        uint32 blockTimestamp = uint32(block.timestamp % 2**32);
        uint32 timeElapsed = blockTimestamp - blockTimestampLast;

        if (timeElapsed > 0 && _reserve0 != 0 && _reserve1 != 0) {
            price0CumulativeLast += _reserve0 * timeElapsed;
            price1CumulativeLast += _reserve1 * timeElapsed;
        }
        reserve0 = uint112(balance0);
        reserve1 = uint112(balance1);
        return;
    }
}