contract Standard {

  function tokenFallback(bytes _data) external returns (bool ok) {
    if (!address(this).delegatecall(_data)) {
        return false;
    }
    return true;
  }
}