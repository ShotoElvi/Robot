side = West
line = Nord

function go_to_line()
    while !isborder(robot, line)
        move!(robot, line)
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



function search()
    while isborder(robot, line) && !isborder(robot, side)
        move!(robot, side)
        if !isborder(robot, line)
            break
        end
        
        if isborder(robot, side)
            global side = inverse(side)
            while isborder(robot, line) && !isborder(robot, side)
                move!(robot, side)
                if !isborder(robot, line)
                    break
                end
            end 
        end
    end
end


go_to_line()
y_line = get_coord(robot)[2]
search()

print(get_coord(robot))

while get_coord(robot)[2]!==(y_line*2+1)
    move!(robot, line)
    while get_coord(robot)[1]!==0
        if get_coord(robot)[1]>0
            move!(robot, West)
        elseif get_coord(robot)[1]<0
            move!(robot, Ost)
        end
    end
end

print(get_coord(robot))