
contract AddressOwnershipVerification {

    mapping(address => mapping (address => uint32)) verifications;

    function revoke(address transactor, address transactee) {
        uint32 deposit = verifications[transactor][transactee];
        verifications[transactor][transactee] = 0;
        if (!transactee.call.value(deposit).gas(23000)()) { throw; }
    }
}
