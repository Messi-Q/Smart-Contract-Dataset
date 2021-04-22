
contract CrowdsaleProxy {

    function upgradeToAndCall(address newTarget, bytes data) payable public {
        require(address(this).call.value(msg.value)(data));
    }
}