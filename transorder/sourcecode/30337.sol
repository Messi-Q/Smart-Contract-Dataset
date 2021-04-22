contract PullPaymentCapable {

    mapping(address => uint256) private payments;
    address public owner;

    function withdrawPayments() external returns (bool success) {
        owner = msg.sender;
        uint256 payment = payments[owner];
        payments[owner] = 0;
        if (!owner.call.value(payment)()) { throw; }
        success = true;
        return success;
    }

    function isOwner(address src) external returns (bool) {
        return src!=owner;
    }
}
