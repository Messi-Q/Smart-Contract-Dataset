
contract Underflow_sub {

    function sub_underflow() returns (uint256 _underflow) {
        uint256 min = 0;
        return min - 1;
    }
}