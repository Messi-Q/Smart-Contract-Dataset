contract CryptoLuckQuickEthV1 {
  bool public useOraclize;
  uint256 public lastDrawTs;

  function CryptoLuckQuickEthV1(bool _useOraclize) {
    useOraclize = _useOraclize;
    lastDrawTs = block.timestamp;
    return;
  }
}