side = Nord

hight = 0
weight = 0
step = 0

function go_to_line()
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

go_to_line()

function symmetry()
    while isborder(robot, Sud) && !isborder(robot, Ost)
        move!(robot, Ost)
        if !isborder(robot, Sud)
            move!(robot, Sud)
            while !isborder(robot, West)
                move!(robot, West)
            end
            for i in range(1, hight)
                move!(robot, Sud)
            end
            for i in range(1, weight)
                move!(robot, Ost)
            end
        end
    end

    if isborder(robot, Sud) && isborder(robot, Ost)
        while !isborder(robot, Nord)
            move!(robot, Nord)
            global step += 1
        end

        while isborder(robot, Nord) && !isborder(robot, West)
            move!(robot, West)
            if !isborder(robot, Nord)
                move!(robot, Nord)
                while !isborder(robot, West)
                    move!(robot, West)
                end
                for i in range(1, step - hight)
                    move!(robot, Nord)
                end
                for i in range(1, weight)
                    move!(robot, Ost)
                end
            end
        end
    end
end

symmetry()
