contract Standard223Receiver {
  address owner;

  function tokenFallback(bytes _data) external returns (bool ok) {
    if (msg.sender != owner) {
      return false;
    }

    if (!address(this).delegatecall(_data)) {
      return false;
    }

    return true;
  }
}