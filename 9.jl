hight = 0
weight = 0
N = 3
side = Ost
side_robot = Ost

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

function line_chess()
    for i in range(1, N)
        if side == West
            move!(robot, side)
            putmarker!(robot) 
        elseif side == Ost
            putmarker!(robot) 
            move!(robot, side)
        end
    end
    if !isborder(robot, Nord)
        move!(robot, Nord)
    end
    global side = inverse(side)
end
function chess_point()
    for i in range(1,N)
        line_chess()
    end
end



go_to_frame()

function chess()
    if !isborder(robot, side_robot)
        chess_point()
        if N % 2 == 0
            for i in range(1, N)
                move!(robot, side_robot)
                move!(robot, Sud)
            end
        else
            for i in range(1, N)
                move!(robot, Sud)
                move!(robot, side_robot)
            end
            global side = Ost
        end
    end
end

for i in range(1,3)
    chess()
end
