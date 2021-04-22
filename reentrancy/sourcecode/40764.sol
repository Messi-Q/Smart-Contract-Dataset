
contract SimpleDAO {

    mapping (address => uint) public credit;

    function withdraw(uint amount) {
        if (credit[msg.sender] >= amount) {
          msg.sender.call.value(amount)();
          credit[msg.sender] -= amount;
        }
    }
}