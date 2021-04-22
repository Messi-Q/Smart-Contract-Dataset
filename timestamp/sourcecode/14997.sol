contract VideoPoker {
    struct Settings {
        uint32 lastDayAdded;
    }

    Settings settings;

    function addPayTable() public {
        uint32 _today = uint32(block.timestamp / 1 days);
        settings.lastDayAdded = _today;
        return;
    }
}