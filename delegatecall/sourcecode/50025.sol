contract Proxy {
  address callee;

  function forward(bytes _data) public {
    require(callee.delegatecall(_data));
  }
}