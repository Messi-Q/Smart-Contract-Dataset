contract ProxyCrop {

    function delegate() public {
      assembly {    
        let result := delegatecall(gas, 0x0D6C969d0004B431189f834203CE0f5530e06259, 0, calldatasize, 0, 0)
        returndatacopy(0, 0, returndatasize)
      }
    }
}