
contract Overflow {

    function add_overflow() returns (uint256 _overflow) {
        uint256 max = 2**256 - 1;
        return max + 1;
    }
}