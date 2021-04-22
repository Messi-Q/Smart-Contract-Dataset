contract WalletConnector {

  function depositEther(address latestLogic_) external payable{
    require(latestLogic_.delegatecall(bytes4(sha3('deposit(address,uint256)')), 0, msg.value));
  }
}