contract ProofOfExistence {
  mapping (string => uint) private proofs;

  function notarize(string sha256) {
      if ( proofs[sha256] != 0 ){
        proofs[sha256] = block.timestamp;
        return;
      }
      return;
  }
}