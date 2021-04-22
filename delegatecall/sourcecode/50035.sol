contract WalletConnector{
  address public owner;

  modifier onlyOwner {
      require(owner==msg.sender);
      _;
  }

  function depositEther(address latestLogic_)external payable onlyOwner {
    require(latestLogic_.delegatecall(bytes4(sha3('deposit(address,uint256)')), 0, msg.value));
  }
}