contract tester {
    address public owner;
    address public testaddress;

    function setTestaddress(address _testaddress) {
        require(owner==msg.sender);
        testaddress = _testaddress;
    }

    function withdelegatecall() public {
        testaddress.delegatecall(bytes4(keccak256("test()")));
    }
}