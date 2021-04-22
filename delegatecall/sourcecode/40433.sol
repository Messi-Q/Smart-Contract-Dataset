contract StackDepth {

    function dig(uint n) public {
        if (!address(this).delegatecall(0x21835af6, n - 1)) throw;
    }
}