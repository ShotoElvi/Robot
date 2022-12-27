side_LR = West
side_HD = Sud
LR = 0
HD = 0


function cross()
    for i in range(1, 2)
        line_cross()
        global LR = 0
        global HD = 0
    end
    global side_HD = inverse(side_HD)
    for i in range(1, 2)
        line_cross()
        global LR = 0
        global HD = 0
    end
    putmarker!(robot)
end

function line_cross()
    while !isborder(robot, side_HD) && !isborder(robot, side_LR)
        move!(robot, side_LR)
        move!(robot, side_HD)
        putmarker!(robot)
        global LR += 1
        global HD += 1
    end
    global side_HD = inverse(side_HD)
    global side_LR = inverse(side_LR)
    for i in range(1, HD)
        move!(robot, side_HD)
    end
    for i in range(1, LR)
        move!(robot, side_LR)
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

cross()