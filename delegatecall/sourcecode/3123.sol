contract Ico1 {

    function buy() public payable {
        address _trg;

        assembly {
            let m := mload(0x40)
            let success := delegatecall(gas, _trg, m, calldatasize, m, 0)
            switch success
            case 0 { revert(0, 0) }
            default { return(m, 0) }
        }
    }
}