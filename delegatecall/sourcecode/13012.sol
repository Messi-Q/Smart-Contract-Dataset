 contract EllipseMarketMaker{

  function EllipseMarketMaker(address _mmLib) public {
    uint256 argsSize = 3 * 32;
    uint256 dataSize = 4 + argsSize;

    bytes memory m_data = new bytes(dataSize);
    require(_mmLib.delegatecall(m_data));
  } 
}
