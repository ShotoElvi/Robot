hight_frame = 0
width_frame = 0
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

function squre()
    putmarker!(robot)
    if isborder(robot, Ost)
        side_on_squre = Nord
        boord = Ost
    elseif isborder(robot, West)
        side_on_squre = Sud
        boord = West
    end
    for i in range(1,4)
        while isborder(robot, boord)
            putmarker!(robot)
            move!(robot, side_on_squre)
        end
        global side_on_squre = turn(side_on_squre)
        global boord = turn(boord)
        putmarker!(robot)
        move!(robot, side_on_squre)
    end
    if !ismarker(robot)
        putmarker!(robot)
    end
end

function line_space()
    point = 0
    while !isborder(robot, side)
        move!(robot, side)
        point += 1
    end
    if point == width_frame
        move!(robot, Nord)
        global side = inverse(side)
    end
end
function space()
    for i in range(1,hight_frame)
        line_space()
    end
end
function per()
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
end

starting()
per()
frame()

move!(robot, Nord)

side = Ost

for i in range(1, width_frame)
    space()
end
squre()
while !isboder(robot, side_left)
    move!(robot, side_left)
end
while !isboder(robot, side_hight)
    move!(robot, side_hight)
end
ending()