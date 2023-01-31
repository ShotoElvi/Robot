HSR = HorizonSideRobots
struct CoordsRobot
    robot::Robot
    coord::Coordinates
end

function HSR.move!(robot::CoordsRobot, side)
    move!(robot.robot, side)
    move!(robot.coord, side)
end
HSR.isborder(robot::CoordsRobot,side) = isborder(robot.robot,side)
HSR.putmarker!(robot::CoordsRobot) = putmarker!(robot.robot)
HSR.ismarker(robot::CoordsRobot) = ismarker(robot.robot)
HSR.temperature(robot::CoordsRobot) = temperature(robot.robot)
get_coord(robot::CoordsRobot) = get_coord(robot.coord)
