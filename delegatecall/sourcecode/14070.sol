contract Ownable {
  address public owner;
  address public currentVersion;

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  function update(address newAddress) public onlyOwner {
     currentVersion = newAddress;
  }

  function delegate() public payable {
     if(!currentVersion.delegatecall(msg.data)) revert();
  }
}
