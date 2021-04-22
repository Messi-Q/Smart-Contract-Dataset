
contract safeSend {

    bool private txMutex3847834 = false;

    function doSafeSendWData(address toAddr, bytes data, uint amount) internal {
        require(txMutex3847834 == false);
        txMutex3847834 = true;
        require(toAddr.call.value(amount)(data));
        txMutex3847834 = false;
    }
}
