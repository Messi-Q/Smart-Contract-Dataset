
contract FsTKerWallet {

  address owner;
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  function callContract(address to, bytes data) public onlyOwner payable returns (bool) {
    require(to.call.value(msg.value)(data));
    return true;
  }
}
