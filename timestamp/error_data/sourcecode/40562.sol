contract ParallelGambling {

    uint[3] private Balance;
    uint[3] private id;
    uint[3] private cursor;
    uint[3] private nb_player ;
    uint[3] private last_time ;

    function ParallelGambling() {
        uint i;
        for(i = 0; i < 3; i++){
            Balance[i]=0;
            last_time[i] = block.timestamp;
            nb_player[i] = 0;
            id[i] = 0;
			cursor[i] = 0;
        }
        return;
    }
}