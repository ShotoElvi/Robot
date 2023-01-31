while !isborder(robot, Nord)
    move!(robot, Nord)
end

while isborder(robot, Nord) && !isborder(robot, West)
    move!(robot, West)
    if !isborder(robot, Nord)
        break
    end
    if isborder(robot, West)
        while isborder(robot, Nord) && !isborder(robot, Ost)
            move!(robot, Ost)
            if !isborder(robot, Nord)
                break
            end
        end 
    end
end

get_coord(robot)