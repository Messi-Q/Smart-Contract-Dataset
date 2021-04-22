contract BasicToken {
    mapping(address => uint256) public balances;
    uint64 public dateTransferable = 1518825600;

    function transfer(uint256 _value) public returns (bool) {
        uint64 _now = uint64(block.timestamp);
        require(_now >= dateTransferable);
        balances[msg.sender] = balances[msg.sender] - (_value);
        return true;
    }
}
