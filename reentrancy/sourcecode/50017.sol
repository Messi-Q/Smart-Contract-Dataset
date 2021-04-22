
contract TelcoinSaleKYCEscrow {

    mapping(address => uint256) public deposited;

    function reject(address _participant) public {
        uint256 weiAmount = deposited[_participant];
        require(_participant.call.value(weiAmount)());
        deposited[_participant] = 0;
    }
}
