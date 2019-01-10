
turf
    Del()
        spawn for(var/auto_tile/a in range(1, src)) a.join()
        ..()

auto_tile
    parent_type = /turf

    var
        list/matches = null
        list/exclude = null

    New()
        ..()
        if(!icon_state) src.join()

    proc/join()
        var/byte = 0
        byte = src.match(NORTH, byte, 1)
        byte = src.match(EAST, byte, 4)
        byte = src.match(SOUTH, byte, 16)
        byte = src.match(WEST, byte, 64)
        byte = src.match(NORTHEAST, byte, 2, 5)
        byte = src.match(SOUTHEAST, byte, 8, 20)
        byte = src.match(SOUTHWEST, byte, 32, 80)
        byte = src.match(NORTHWEST, byte, 128, 65)
        src.icon_state = "[byte]"

    proc/match(direction, byte, bit, mask = 0)
        if((byte & mask) == mask && src.ismatch(direction)) byte |= bit
        else byte &= ~bit
        return byte

    proc/ismatch(direction)
        var/auto_tile/t = get_step(src, direction)
        if(!t) return 1
        if(istype(t, src.type)) return 1
        for(var/v in src.matches)
            if(v == direction) return 1
            else if(istype(t, v) && !(t.type in src.exclude)) return 1
        return 0