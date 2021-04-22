
contract OwnedUpgradeabilityProxy  {

    function upgradeToAndCall(bytes data) payable public {
        require(this.call.value(msg.value)(data));
    }
}