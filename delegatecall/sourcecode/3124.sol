contract Ico2 {


    function buy() public payable {
        address _trg;

        assembly {
            let m := mload(0x40)
            calldatacopy(m, 0, calldatasize)
            let success := delegatecall(gas, _trg, m, calldatasize, m, 0)
        }
    }
}