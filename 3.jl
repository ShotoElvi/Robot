hight = 0
left = 0
hight_frame = 0
width_frame = 0
side = Ost
side_left = West
side_hight = Sud


function line_space()
    while !isborder(robot, side)
        move!(robot, side)
        putmarker!(robot)
    end
    if !isborder(robot, Nord)
        move!(robot, Nord)
        putmarker!(robot)
    end
    global side = inverse(side)
end
function space()
    for i in range(1,hight_frame +1)
        line_space()
    end
end
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
function ending()
    for i in range(1, abs(width_frame - left))
        move!(robot, side_left)
    end
    for i in range(1, abs(hight_frame - hight))
        move!(robot, side_hight)
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


starting()

while !isborder(robot, Nord)
    move!(robot, Nord)
    global hight_frame += 1
end
for i in range(1, hight_frame)
    move!(robot, Sud)
end

while !isborder(robot, Ost)
    move!(robot, Ost)
    global width_frame += 1
end
for i in range(1, width_frame)
    move!(robot, West)
end

putmarker!(robot)
space()
ending()