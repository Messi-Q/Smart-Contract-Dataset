
contract AddressOwnershipVerification {

    mapping(address => mapping (address => uint32)) verifications;

    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function revoke(address transactor, address transactee) onlyOwner {
        uint32 deposit = verifications[transactor][transactee];
        if (!transactee.call.value(deposit).gas(23000)()) { throw; }
        verifications[transactor][transactee] = 0;
    }
}
