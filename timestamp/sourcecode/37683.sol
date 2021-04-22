contract LastWillContractOraclize {

    uint public checkInterval;
    uint public lastActiveTs;
    event NeedRepeatCheck(bool isAccident);
    bool internal accidentOccurs = false;

    function __callback(bytes32 queryId, string result) {
        if (bytes(result).length == 0) {
            accidentOccurs  = (block.timestamp - lastActiveTs >= checkInterval);
        }
        if (accidentOccurs) {
            NeedRepeatCheck(true);
        }
        return;
    }
}