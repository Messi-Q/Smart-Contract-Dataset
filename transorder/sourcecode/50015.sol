contract TelcoinSaleCapEscrow {

    mapping(address => uint256) public deposited;
    address public _participant;

    function reject() public {
        uint256 weiAmount = deposited[_participant];
        require(_participant.call.value(weiAmount)());
        deposited[_participant] = 0;
    }

     function accept(uint time) public returns(bool) {
        deposited[_participant] = 1;
        return true;
    }
}
