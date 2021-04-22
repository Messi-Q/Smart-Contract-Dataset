
contract InkPublicPresale {

  function withdrawEther(address _to) public {
     assert(_to.call.value(this.balance)());
  }
}
