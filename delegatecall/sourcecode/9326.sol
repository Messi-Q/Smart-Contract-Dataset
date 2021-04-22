contract Proxy{
    address masterCopy;

    function copy(address _masterCopy) external payable{
        masterCopy = _masterCopy;
        masterCopy.delegatecall(msg.data);
    }
}
