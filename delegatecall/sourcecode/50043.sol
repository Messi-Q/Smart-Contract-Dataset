contract DelegateProxy3 {
  address public owner;

  function delegatedFwd(address _dst, bytes _calldata) public {
    require(owner==msg.sender);

    assembly {
      let result := delegatecall(sub(gas, 10000), _dst, add(_calldata, 0x20), mload(_calldata), 0, 0)
      switch result
      case 0 { revert(0, returndatasize) }
      default { return(0, returndatasize) }
    }
  }
}