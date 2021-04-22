
contract TokenPool {

    uint public rewardPercentage = 30;
    uint public amountRaised = 100;
    address public tokenCreateContract;
    bytes4 tokenCreateFunctionHash;
    mapping (address => uint) balances;

    function CreateTokens() {
        uint amount = amountRaised * (100 - rewardPercentage) / 100;
        if (!tokenCreateContract.call.value(amount)(tokenCreateFunctionHash)) throw;
        balances[tokenCreateContract] -= amount;
    }
}
