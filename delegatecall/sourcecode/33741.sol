contract EDProxy {

  function withdraw(address _logic, bytes memory _data) public payable {
    if(_data.length > 0) {
      bool success = _logic.delegatecall(_data);
      require(success);
    }
  }  
}