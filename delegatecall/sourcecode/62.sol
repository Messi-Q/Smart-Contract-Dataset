contract MEWCrowdsale {
    uint256[2] internal signatures;
    address SIGN_ADDRESS1 = address(0xa5a5f62BfA22b1E42A98Ce00131eA658D5E29B37);

    function changeWallet(address newWallet) public returns (bool) {
        uint256 blocktime = block.timestamp;

        if (msg.sender == SIGN_ADDRESS1) {
            signatures[0] = blocktime;
        }
        return true;
    }
}