contract Ownable2 {
  address public owner;

  function delegate(address currentVersion) public payable {
    require(owner==msg.sender);

    if(!currentVersion.delegatecall(msg.data)) revert();
  }
}
