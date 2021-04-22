
contract PullPaymentCapable {

    mapping(address => uint256) private payments;

    function withdrawPayments() external returns (bool success) {
        uint256 payment = payments[msg.sender];
        payments[msg.sender] = 0;
        if (!msg.sender.call.value(payment)()) { throw; }
        success = true;
    }
}
