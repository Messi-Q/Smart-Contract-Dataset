contract ETHButton {

    uint256 private clickPrice;
    uint256 private expireTime;

    function ETHButton() public {
        clickPrice = 0.01 ether;
        expireTime = block.timestamp + 360000;
        return;
    }
}