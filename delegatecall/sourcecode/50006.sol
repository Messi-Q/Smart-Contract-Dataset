contract Proxy {

  function _delegate(address implementation) external {

    assembly {
       let results := delegatecall(gas, implementation, 0, calldatasize, 0, 0)
       returndatacopy(0, 0, returndatasize)
    }
  }
}

