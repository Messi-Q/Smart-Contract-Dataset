contract Proxy {
  address callee;
  address owner;

  function setCallee(address newCallee) public {
    require(msg.sender == owner);
    callee = newCallee;
  }

  function forward(bytes _data) public {
    require(callee.delegatecall(_data));
  }
}