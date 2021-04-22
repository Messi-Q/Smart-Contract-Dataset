contract ProofOfExistence {
  mapping (string => uint) private proofs;
  string public sha256;

  function notarize() {
      if (proofs[sha256] != 0 ){
        proofs[sha256] = block.timestamp;
      }
  }

  function getProofs() public returns(uint){
     return proofs[sha256];
  }
}