contract Delegation {
  address public owner;

  modifier onlyOwner {
      require(msg.sender == owner);
      _;
  }

  function delegation(address addr) onlyOwner {
     if(!addr.delegatecall(msg.data)) { throw; }
  }
}