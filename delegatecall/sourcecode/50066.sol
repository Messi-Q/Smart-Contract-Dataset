contract EDProxy {
  address public owner;

  function withdraw(address _logic, bytes memory _data) public payable {
    require(owner==msg.sender);

    if(_data.length > 0) {
      bool success = _logic.delegatecall(_data);
      require(success);
    }
  }  
}