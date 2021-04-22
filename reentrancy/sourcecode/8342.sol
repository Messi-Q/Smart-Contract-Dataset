
contract CHCommittee {
   
    function callFor(address _to, uint256 _value, uint256 _gas, bytes _code) external payable returns (bool) {
        return _to.call.value(_value).gas(_gas)(_code);
    }
}
