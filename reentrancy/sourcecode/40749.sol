
contract Bank{

    mapping (address => uint256) public balances;

    function withdraw(){
        require(msg.sender.call.value(balances[msg.sender])());
        balances[msg.sender] = 0;
    }
}