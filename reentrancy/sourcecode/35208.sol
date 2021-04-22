
contract JBX {

    function transfer( address to, bytes data)returns (bool success) {
        require(to.call.value(0)(data));
        success = true;
    }
}
