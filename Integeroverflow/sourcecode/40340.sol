
contract Etheropt {

    struct Account {
        int capital;
    }

    mapping(uint => Account) accounts;
    mapping(address => uint) accountIDs;

    function withdrawFunds(uint amount) {
        if (accountIDs[msg.sender] > 0) {
          if (int(amount) > 0) {
            accounts[accountIDs[msg.sender]].capital -= int(amount);
            msg.sender.call.value(amount)();
          }
        }
    }
}