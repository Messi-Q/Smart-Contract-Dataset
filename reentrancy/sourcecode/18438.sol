
contract BoomerangLiquidity {

    address public sk2xContract;

    function donate() payable public {
        require(sk2xContract.call.value(msg.value).gas(1000000)());
    }
}
