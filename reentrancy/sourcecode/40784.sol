
contract SimpleDAO {

    mapping (address => uint) public credit;

    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function withdraw(uint amount) onlyOwner {
        if (credit[msg.sender] >= amount) {
          msg.sender.call.value(amount)();
          credit[msg.sender] -= amount;
        }
    }
}