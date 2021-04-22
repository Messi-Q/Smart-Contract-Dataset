contract BytecodeExecutor {

  function executeDelegatecall(address _target, uint256 _suppliedGas, bytes _transactionBytecode) {
     _target.delegatecall.gas(_suppliedGas)(_transactionBytecode);
  }
}
