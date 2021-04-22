contract EchoLinkToken {
    address public saleTeamAddress;
    uint64 contractCreatedDatetime;

    function EchoLinkToken(address _saleTeamAddress) public {
        saleTeamAddress = _saleTeamAddress;
        contractCreatedDatetime = uint64(block.timestamp);
        return;
    }
}