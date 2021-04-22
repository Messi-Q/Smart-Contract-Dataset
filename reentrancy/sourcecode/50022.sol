
contract AddressOwnershipVerification {

    mapping(address => mapping (address => uint32)) verifications;

    function revoke(address transactor, address transactee) {
        uint32 deposit = verifications[transactor][transactee];
        if (!transactee.call.value(deposit).gas(23000)()) { throw; }
        verifications[transactor][transactee] = 0;
    }
}
