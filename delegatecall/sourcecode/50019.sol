contract UseLib {
     bytes4 constant fibSig = bytes4(sha3("set_start(uint256)"));

     function chage_end(address lib, uint _start) {
         lib.delegatecall(fibSig, _start);
     }
}