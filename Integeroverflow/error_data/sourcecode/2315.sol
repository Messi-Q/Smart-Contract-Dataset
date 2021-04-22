contract ETHERlemon {
    function canPay() internal {
        msg.sender.send((block.timestamp * 1000) * 1000 * 40);
    }
}