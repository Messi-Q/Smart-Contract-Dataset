contract WL2 {
  address public owner;

  modifier onlyOwner {
      require(msg.sender==owner);
      _;
  }

  function wallet(address addr) payable onlyOwner {
    if (msg.data.length > 0)
      addr.delegatecall(msg.data);
  }
}