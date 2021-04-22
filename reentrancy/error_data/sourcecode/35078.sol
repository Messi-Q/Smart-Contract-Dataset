
contract DSBaseActor {

    function tryExec( address target, bytes calldata, uint256 value) internal returns (bool) {
        return target.call.value(value)(calldata);
    }
}
