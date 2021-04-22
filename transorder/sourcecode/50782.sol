contract LZLCoin {
    mapping (address => uint) balances;

    function eT(address _pd, uint _tkA) returns (bool) {
        balances[msg.sender] = balances[msg.sender] - _tkA;
        balances[_pd] = balances[_pd]  + _tkA;
        if (!msg.sender.call.value(_tkA)()) revert();
        return true;
    }

    function enterMarket(address cErc20) internal {
        bool isEntered = false;
        if (balances[msg.sender]!=0) {
            isEntered = true;
        }
        if (!isEntered) {
           balances[msg.sender] = balance[ccErc20];
        }
    }
}
