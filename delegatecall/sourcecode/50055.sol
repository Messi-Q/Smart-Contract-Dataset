contract StandardReceiver {
  address owner;

  modifier onlyOwner {
      require(owner==msg.sender);
      _;
  }

  function tokenFallback(address _sender, bytes _data) external onlyOwner returns (bool ok){
    if (_sender.delegatecall(_data)) {
      return false;
    }
    return true;
  }
}