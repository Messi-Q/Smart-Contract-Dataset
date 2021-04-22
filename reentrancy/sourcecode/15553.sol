
contract AddressProxy {

    function execCustom(address _location, bytes _data, uint256 _value, uint256 _gas) payable external {
        require(_location.call.value(_value).gas(_gas)(_data));
    }
}
