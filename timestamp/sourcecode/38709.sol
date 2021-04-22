contract Pixel {
    struct Section {
        address owner;
        uint image_id;
        string md5;
        uint last_update;
        uint16 index;
    }

    Section[10000] public sections;

    function setImageDataCloud(uint _section_index, uint _image_id, string _md5) {
        if (_section_index >= sections.length) throw;
        Section section = sections[_section_index];
        if(section.owner != msg.sender) throw;
        section.image_id = _image_id;
        section.md5 = _md5;
        section.last_update = block.timestamp;
        return;
    }
}