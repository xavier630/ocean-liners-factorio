require "util"
--require "defines"
--require "defines"
script.on_init(function()
  local lastBoat = game.players[1]

end)
rot_left=function(car)
  car.orientation = car.orientation - 0.25
  return true
end
calc_orientation=function(player, car)
  Cx = car.position.x
  Cy = car.position.y
  Px = player.position.x
  Py = player.position.y
  dx = Cx - Px
  dy = Cy - Py
  orientation = math.atan(dx / dy)
  orientation = math.deg(orientation) --convert to degrees
  player.surface.print("Px, Py, Cx, Cy, Deg: " .. Px .. Py .. Cx .. Cy .. orientation)

  orientation  = (orientation / 360)--convert so out of 1
  if Px > Cx and Py > Cy then
    -- +0 (do nothing)
  end
  if Px > Cx and Py < Cy then
    orientation = 0.5 - orientation
  end
  if Px < Cx and Py < Cy then
    orientation = 0.5 + orientation
  end
  if Px > Cx and Py > Cy then
    orientation = 1 - orientation
  end

  return orientation
end

 script.on_event(defines.events.on_player_driving_changed_state, function(event)
   game.players[1].color = {r=0.1, g=0.1, b=0.9, a=0.8}
   local player = game.players[event.player_index]
   player.surface.print("test printing")
   player.surface.print(player.name)
   --find closest ship, pull it towards player.
   --otherwise check if in vehicle. If not, find closest vehicle. Teleport player to closest land by vehicle
   if player.character.vehicle and player.character.vehicle.name == "paddle-steamer" then
     lastBoat = player.character.vehicle
     player.surface.print("lastBoat set to: " .. lastBoat.name)

   end
   if not player.character.vehicle  then
       player.surface.print("not vehicle")

       local position = player.position;
       player.surface.print("Last boat is:" .. lastBoat.name)
       --search for nearest land to lastBoat.position
       --player.teleport({position.x, position.y})
       --lastBoat.orientation = lastBoat.orientation + 0.5;
       --rot_left(lastBoat)
       lastBoat.orientation = calc_orientation(player, lastBoat)
       --lastBoat.speed = lastBoat.speed + 0.1 disabled until calc_orientation works





   end

 end)
 script.on_event(defines.events.on_tick, function(event)
   player = game.players[1]
   if player.character.vehicle and player.character.vehicle.name == "paddle-steamer" then
     lastBoat = player.character.vehicle
   end
 end)
