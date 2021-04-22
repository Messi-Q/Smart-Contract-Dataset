contract BlockchainDeposit {

  struct Deposit {
    address depositor;
    uint amount;
  }

  uint public lastDeposit;
  uint public numDeposits;
  mapping (uint => Deposit) public depositsStack;

  function deposit() payable {
    if(msg.value <= 0) throw;
    lastDeposit = block.timestamp;
    depositsStack[numDeposits] = Deposit(msg.sender, msg.value);
  }
}