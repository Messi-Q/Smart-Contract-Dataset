contract ProofOfExistence {

  mapping (string => uint) private proofs;

  function notarize(string sha256) {
    if ( bytes(sha256).length == 64 ){
      if ( proofs[sha256] == 0 ){
        proofs[sha256] = block.timestamp;
      }
    }
    return;
  }
}