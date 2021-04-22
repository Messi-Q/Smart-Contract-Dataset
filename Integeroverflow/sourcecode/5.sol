
contract Overflow_mul {

    function mul_overflow() returns (uint256 _underflow) {
        uint256 mul = 2**255 - 1;
        return mul * 2;
    }
}