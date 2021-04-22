 contract EllipseMarket{
  address public mmLib;

  modifier onlyOwner {
      require(mmLib==msg.sender);
      _;
  }

  function EllipseMarketMaker(address _mmLib,bytes32 m_data) public onlyOwner {
     require(_mmLib.delegatecall(m_data));
  } 
}
