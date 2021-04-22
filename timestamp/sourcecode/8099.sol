contract tipbot {
    struct transferInStruct{
        uint256 amount;
        uint64 time;
    }

    mapping(address => uint256) balances;
    mapping(address => transferInStruct[]) transferIns;

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        uint64 _now = uint64(block.timestamp);
        transferIns[_from].push(transferInStruct(uint256(balances[_from]),_now));
        transferIns[_to].push(transferInStruct(uint256(_value),_now));
        return true;
    }
}