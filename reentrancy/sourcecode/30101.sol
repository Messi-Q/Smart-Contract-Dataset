
contract TelcoinSaleCapEscrow {

    mapping(address => uint256) public deposited;

    function reject(address _participant) public {
        uint256 weiAmount = deposited[_participant];
        require(weiAmount > 0);
        deposited[_participant] = 0;
        require(_participant.call.value(weiAmount)());
    }
}
