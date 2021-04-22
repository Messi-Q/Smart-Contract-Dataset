contract LightContract {
    address owner;

    modifier onlyOwner {
      require(msg.sender==owner);
      _;
    }

    function delegate(address addr) public onlyOwner {
        require(addr.delegatecall(msg.data));
    }
}
