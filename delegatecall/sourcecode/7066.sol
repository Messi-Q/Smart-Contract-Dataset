contract Proxy{

    address master;

    modifier onlyOwner{
        require(master == msg.sender);
        _;
    }

    function masterCopy(address _master) external onlyOwner {

        assembly {
            calldatacopy(0, 0, calldatasize())
            let success := delegatecall(not(0), _master, 0, calldatasize, 0, 0)
            returndatacopy(0, 0, returndatasize)
        }
    }
}