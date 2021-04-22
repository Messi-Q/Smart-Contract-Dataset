contract Preservation {
  address timeZone1Library;

  bytes4 constant setTimeSignature = bytes4(keccak256("setTime(uint256)"));

  function setFirstTime(uint _timeStamp) public {
    timeZone1Library.delegatecall(setTimeSignature, _timeStamp);
  }

}