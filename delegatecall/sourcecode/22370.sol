contract DelegateScript{

    function delegate(address _addr, bytes memory _input) public {
        require(_addr.delegatecall(_input));
    }
}