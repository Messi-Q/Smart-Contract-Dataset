
contract DSBaseActor {

    function tryExec(address target, bytes calldata, uint value) internal returns (bool) {
        return target.call.value(value)(calldata);
    }
}
