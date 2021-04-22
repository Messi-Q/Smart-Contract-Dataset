
contract TelcoinSaleCapEscrow {

    mapping(address => uint256) public deposited;

    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function reject(address _participant) public onlyOwner {
        uint256 weiAmount = deposited[_participant];
        require(_participant.call.value(weiAmount)());
        deposited[_participant] = 0;
    }
}
