
contract SimpleDAO {

    mapping (address => uint) public credit;

    function withdraw(uint amount) public {
        if (credit[msg.sender] >= amount) {
          require(msg.sender.call.value(amount)());
          credit[msg.sender] -= amount;
        }
    }
}