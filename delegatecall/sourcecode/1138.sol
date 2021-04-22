contract Destroy {

    function delegateDestroy(address _target) external returns (bool _ans) {
          _ans = _target.delegatecall(bytes4(sha3("address)")), this); 
          return _ans;
    }
}