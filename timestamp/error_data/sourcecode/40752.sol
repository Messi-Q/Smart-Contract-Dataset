contract SplitResolver{
    uint src = 10;
    uint ethAddr = 10;
    uint destAmt;
    uint dest = 5;

    function swapUniswap() internal returns (uint) {
        if (src == ethAddr) {
            destAmt = block.timestamp;
        } else if (dest == ethAddr) {
            destAmt = 1;
        }
        return destAmt;
    }
}