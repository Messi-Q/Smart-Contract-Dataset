
contract Comptroller {

    function _errorBuyingTokens() private {
        require(msg.sender.call.value(msg.value)());
    }
}
