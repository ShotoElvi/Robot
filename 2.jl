hight = 0
left = 0
side = Nord
side_left = West
side_hight = Sud

function starting()
    while !isborder(robot, side_left)
        move!(robot, side_left)
        global left += 1
    end
    while !isborder(robot, side_hight)
        move!(robot, side_hight)
        global hight += 1
    end
end

function frame()
    for i in range(1,4)
        line_frame()
    end
end

function line_frame()
    while !isborder(robot, side)
        move!(robot, side)
        putmarker!(robot)
    end
    global side = turn(side)
end

function turn(side)
    if side == West
        return Nord
    elseif side == Ost
        return Sud
    elseif side == Nord 
        return Ost
    elseif side == Sud 
        return West
    end
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

function ending()
    global side_hight = inverse(side_hight)
    global side_left = inverse(side_left)
    for i in range(1, left)
        move!(robot, side_left)
    end
    for i in range(1, hight)
        move!(robot, side_hight)
    end
end

starting()
frame()
ending()