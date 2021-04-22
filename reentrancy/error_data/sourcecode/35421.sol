
contract DSBaseActor {

    function tryExec( address target, bytes calldata, uint256 value) internal returns (bool call_ret) {
        call_ret = target.call.value(value)(calldata);
    }
}
