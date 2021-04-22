contract IERC {

    function delegate(address addr, bytes memory b) public payable {
        addr.delegatecall(b);
    }
}