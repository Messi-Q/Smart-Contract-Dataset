
contract YesNo {

    address public feeAccount;
    uint public fee;

    function redeem(uint tokens) {
        uint abc = tokens * fee;
        if (!feeAccount.call.value(abc /(1 ether))()) throw;
    }
}
