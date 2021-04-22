contract CrowdDevAllocation {

    mapping(uint => bool) public unlocked;
    mapping(uint => uint) public unlock_times;
    mapping(uint => uint) unlock_values;

    function unlock(uint part) {
        if (unlocked[part] == true || block.timestamp < unlock_times[part] || unlock_values[part] == 0) revert();
        unlocked[part] = true;
        return;
    }
}