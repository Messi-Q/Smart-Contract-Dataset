contract OwnedUpgradeabilityProxy {
  address owner;

  modifier onlyOwner {
      require(msg.sender==owner);
      _;
  }

  function upgradeToAndCall(address implementation, bytes data) payable public onlyOwner {
    require(implementation.delegatecall(data));
  }
}
