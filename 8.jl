side = Nord
step = 1

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

function go_to_marker()
    for i in range(1, step)
        if !ismarker(robot)
            move!(robot, side)
        end
    end
end

function find_marker()
    while !ismarker(robot)
        for i in range(1,2)
            go_to_marker()
            global side = turn(side)
        end
        global step += 1
    end
end

find_marker()