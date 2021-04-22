
contract TelcoinSaleCapEscrow {

    mapping(address => uint256) public deposited;
    address owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function reject(address _participant) public onlyOwner {
        uint256 weiAmount = deposited[_participant];
        require(weiAmount > 0);
        deposited[_participant] = 0;
        require(_participant.call.value(weiAmount)());
    }
}
