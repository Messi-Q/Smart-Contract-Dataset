
contract ValueTrader{

    function buyEther(uint256 amount) {
        assert(msg.sender.call.value(amount)());
    }
}