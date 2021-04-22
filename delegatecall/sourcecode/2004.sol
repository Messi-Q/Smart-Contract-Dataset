contract Proxy {

    function prox() external payable {
        address  _masterCopy;

        assembly {
            let success := delegatecall(not(0), _masterCopy, 0, calldatasize, 0, 0)
            switch success
            case 0 { revert(0, returndatasize) }
            default { return(0, returndatasize) }
        }
    }
}
