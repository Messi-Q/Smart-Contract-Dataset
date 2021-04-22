contract MultiSigWallet {

    mapping (address => bool) public isOwner;
    uint public required;
    uint public lastTransactionTime;
    uint public recoveryModeTriggerTime;

    modifier onlyOwner(address owner) {
        if (!isOwner[owner])
            revert();
        _;
    }

    function enterRecoveryMode() public onlyOwner(msg.sender) {
        require(block.timestamp - lastTransactionTime >= recoveryModeTriggerTime);
        required = 1;
        return;
    }
}