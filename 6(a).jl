hight = 0
weight = 0
step_hight = 1
side = Nord
putmarker!(robot)


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

function go_to_frame()
    while !isborder(robot, West) || !isborder(robot, Sud)
        while !isborder(robot, Sud)
            move!(robot, Sud)
            global hight += 1
        end
        while !isborder(robot, West)
            move!(robot, West)
            global weight += 1
        end
    end
end

function go_to_spawn()
    for i in range(1, hight)
        move!(robot, Nord)
    end

    for i in range(1, weight)
        if !isborder(robot, Ost)
            if !ismarker(robot)
                move!(robot, Ost)
            end
        else
            move!(robot, Nord)
            move!(robot, Ost)
            while isborder(robot, Ost)
                move!(robot, Nord)
                global step_hight += 1
            end
            while isborder(robot, Sud)
                move!(robot, Ost)
            end
            for j in range(1, step_hight)
                move!(robot, Sud)
            end
        end
    end
end


function ex6()
    go_to_frame()
    frame()
    go_to_spawn()
end

ex6()