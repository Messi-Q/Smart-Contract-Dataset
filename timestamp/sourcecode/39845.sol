contract Omnipurse {
  struct Contribution {
    address sender;
    uint value;
    bool refunded;
    uint256 timestamp;
  }
  struct Purse {
    uint8 status;
    uint numContributions;
    mapping (uint => Contribution) contributions;
  }
  mapping (uint => Purse) purses;

  function contributeToPurse(uint purseId) payable {
    Purse p = purses[purseId];
    if (p.status != 1) { throw; }
    p.contributions[p.numContributions++] = Contribution(msg.sender, msg.value, false, block.timestamp);
    return;
  }
}