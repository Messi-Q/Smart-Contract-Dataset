contract ExampleSlidingWindowOracle {

    uint public  windowSize;
    uint public  periodSize;

    function consult(address tokenIn, uint amountIn, address tokenOut) external view returns (uint amountOut) {
        uint timeElapsed = block.timestamp - 10;
        require(timeElapsed <= windowSize);
        require(timeElapsed >= windowSize - periodSize * 2);
    }
}
