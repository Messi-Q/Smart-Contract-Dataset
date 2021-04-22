contract Eurufly {
      uint256 public prePreIcoStartAt;
      address public owner;

      modifier onlyOwner() {
        require(msg.sender == owner);
        _;
      }

    enum STATE{ PREPREICO }

    STATE public state;

    function startPrePreIco() public onlyOwner returns (STATE) {
        prePreIcoStartAt = block.timestamp;
        state = STATE.PREPREICO;
        return state;
    }
}