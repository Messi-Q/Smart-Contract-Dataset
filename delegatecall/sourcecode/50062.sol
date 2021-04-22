contract CToken{
    address public owner;

    function functionOne(address addr,uint256 _valueOne, uint256 _valueTwo, uint256 _valueThree, uint256 _valueFour) public returns (bool ok) {
        require(owner==msg.sender);
        return addr.delegatecall(bytes4(sha3("functionOne(uint256,uint256,uint256,uint256)")), _valueOne, _valueTwo, _valueThree, _valueFour);
    }
}