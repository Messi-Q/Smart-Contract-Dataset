
contract bet_various_v2{

  uint constant maxguess=1000000;
  uint bettingprice = 0.01 ether;
  bytes32 curhash = '';
  
  uint stasticsarrayitems = 20;

  function addguess(uint guess) payable {
    require(msg.value == bettingprice);
    uint divideby = maxguess/stasticsarrayitems;
    curhash = sha256(block.timestamp, block.coinbase, block.difficulty, curhash);
    return;
  }
}