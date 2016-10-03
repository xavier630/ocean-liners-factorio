require "util"
--require "defines"
--require "defines"
local lastBoat
script.on_init(function()

end)

face_left=function(car)
  car.orientation =  0.75
  return true
end
face_right=function(car)
  car.orientation =  0.25
  return true
end
face_up=function(car)
  car.orientation =  0
  return true
end
face_down=function(car)
  car.orientation =  0.5
  return true
end
calc_orientation=function(player, car)
  Cx = car.position.x
  Cy = car.position.y
  Px = player.position.x
  Py = player.position.y
  dx = Cx - Px
  dy = Cy - Py

  --player.surface.print("Px, Py, Cx, Cy, Deg: " .. Px .. Py .. Cx .. Cy .. orientation)
  orientation = math.atan2(dx, dy)
  orientation = math.deg(orientation) --convert to degrees
  orientation  = (orientation / 360)--convert so out of 1
  player.surface.print("Px, Py, Cx, Cy: " .. Px .. Py .. Cx .. Cy)
  player.surface.print("Deg: " ..orientation)
  if Px < Cx and Py > Cy then
    orientation = 0.5 + orientation
  end
  if Px < Cx and Py < Cy then
    orientation = 1 - orientation
  end
  if Px > Cx and Py > Cy then
    orientation = 0.5 - orientation
  end
  car.orientation = orientation
  return true

end

 script.on_event(defines.events.on_player_driving_changed_state, function(event)
   game.players[event.player_index].color = {r=0.1, g=0.1, b=0.9, a=0.8}
   local player = game.players[event.player_index]
   --player.surface.print("test printing")
   --player.surface.print(player.name)
   --find closest ship, pull it towards player.
   --otherwise check if in vehicle. If not, find closest vehicle. Teleport player to closest land by vehicle
   if player.character.vehicle and player.character.vehicle.name == "paddle-steamer" then
     lastBoat = player.character.vehicle
    -- player.surface.print("lastBoat set to: " .. lastBoat.name)

   end
   if not player.character.vehicle  then
     if lastBoat and  lastBoat.name == "paddle-steamer" then
       --player.surface.print("not vehicle")

       local position = player.position;
       calc_orientation(player, lastBoat)
       lastBoat.speed = 0.05
     end




   end

 end)
 script.on_event(defines.events.on_tick, function(event)
   player = game.players[1]
   if player.character.vehicle and player.character.vehicle.name == "paddle-steamer" then
     lastBoat = player.character.vehicle
   end
 end)
