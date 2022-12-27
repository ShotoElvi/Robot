side = Nord

function cross()
    for i in range(1,4)
        line_cross()
    end
    putmarker!(robot)
end

function line_cross()
    while !isborder(robot, side)
        move!(robot, side)
        putmarker!(robot)
    end
    global side = inverse(side)
    while ismarker(robot)
        move!(robot, side)
    end
    global side = inverse_turn(side)
end

function inverse(side)
    if side == West
        return Ost
    elseif side == Ost
        return West
    elseif side == Nord 
        return Sud
    else return Nord
    end
end

function inverse_turn(side)
    if side == West
        return Sud
    elseif side == Ost
        return Nord
    elseif side == Nord 
        return West
    elseif side == Sud 
        return Ost
    end
end

cross()