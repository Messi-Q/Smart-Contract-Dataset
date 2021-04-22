contract Proxy {

  function forward(address callee, bytes _data) public {
    require(callee.delegatecall(_data));
  }
}
