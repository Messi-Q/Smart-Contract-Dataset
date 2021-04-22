contract CardboardUnicornAssembler {

  address public owner = msg.sender;
  uint public pricePerUnicorn = 1 finney;
  uint public lastPriceSetDate = 0;

  modifier onlyOwner {
    require(msg.sender == owner);
    _;
  }

  function setPrice(uint _newPrice) onlyOwner {
    pricePerUnicorn = _newPrice;
    lastPriceSetDate = block.timestamp;
    return;
  }
}