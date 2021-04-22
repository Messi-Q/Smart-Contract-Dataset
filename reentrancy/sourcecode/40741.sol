
contract ReentranceExploit {

    address public vulnerable_contract;

    function deposit(address _vulnerable_contract) public payable {
        vulnerable_contract = _vulnerable_contract ;
        require(vulnerable_contract.call.value(msg.value)());
    }
}
