
contract PullPaymentCapable {

    mapping(address => uint256) private payments;

    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function withdrawPayments() external onlyOwner returns (bool success) {
        uint256 payment = payments[msg.sender];
        payments[msg.sender] = 0;
        if (!msg.sender.call.value(payment)()) { throw; }
        success = true;
    }
}
