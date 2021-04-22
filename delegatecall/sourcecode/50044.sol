contract DelegateProxy4 {
  address public owner;

  modifier onlyOwner {
      require(owner==msg.sender);
      _;
  }

  function delegatedFwd(address _dst, bytes _calldata) public onlyOwner {
    assembly {
      let result := delegatecall(sub(gas, 10000), _dst, add(_calldata, 0x20), mload(_calldata), 0, 0)
    }
  }
}