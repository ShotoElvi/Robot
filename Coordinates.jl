mutable struct Coordinates
    x::Int
    y::Int
end

using HorizonSideRobots
coord = Coordinates(0, 0)
function HorizonSideRobots.move!(coord::Coordinates,
    side::HorizonSide)
    if side==Nord
        coord.y += 1
    elseif side==Sud
        coord.y -= 1
    elseif side==Ost
        coord.x += 1
    elseif side==West
        coord.x -= 1
    end
end
HorizonSideRobots.move!(coord, Nord)
get_coord(coord::Coordinates) = (coord.x, coord.y)
print(get_coord(coord::Coordinates))