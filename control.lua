require "util"
--require "defines"
--require "defines"
local last_boat
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

  orientation = math.atan2(dx, dy)
  orientation = math.deg(orientation) --convert to degrees
  orientation  = (orientation / 360)--convert so out of 1
  --player.surface.print("Px, Py, Cx, Cy: " .. Px .. Py .. Cx .. Cy)
  --player.surface.print("Deg: " ..orientation)
  if Px < Cx and Py > Cy then
    orientation = 0.5 + orientation
    --player.surface.print("Bottom left quad")

  end
  if Px < Cx and Py < Cy then
    orientation = 1 - orientation
  --  player.surface.print("Top left quad")
  end
  if Px > Cx and Py > Cy then
    orientation = 0.5 - orientation
  --  player.surface.print("Bottom right quad")
  end
  car.orientation = orientation
  return true

end

 script.on_event(defines.events.on_player_driving_changed_state, function(event)
   --game.players[event.player_index].color = {r=0.1, g=0.1, b=0.9, a=0.8}
   local player = game.players[event.player_index]
   --player.surface.print("test printing")
   --player.surface.print(player.name)
   --find closest ship, pull it towards player.
   --otherwise check if in vehicle. If not, find closest vehicle. Teleport player to closest land by vehicle
   if player.character.vehicle and (player.character.vehicle.name == "paddle-steamer" or player.character.vehicle.name == "ironclad" ) then
     last_boat = player.character.vehicle
    -- player.surface.print("last_boat set to: " .. last_boat.name)

   end
   if not player.character.vehicle  then
     if last_boat and (last_boat.name == "paddle-steamer" or last_boat.name == "ironclad") then
       --player.surface.print("not vehicle")

       local position = player.position;
       calc_orientation(player, last_boat)
       --last_boat.speed = 0.05
     end




   end

 end)
 script.on_event(defines.events.on_tick, function(event)
  --[[ player = game.players[1]
   if player.character.vehicle and player.character.vehicle.name == "paddle-steamer" then
     last_boat = player.character.vehicle
   end]]
 end)
 script.on_event(defines.events.on_entity_died, function(event) --Receive shells for killing fish
   if event.entity.name == "fish" then
     player = game.players[1] --TODO give to the right player
     player.character.insert{name="cannon-shell", count=8}
   end
 end)
--[[ script.on_event(defines.events.on_player_crafted_item, function(event) --Script to test for entities around the player
     local player = game.players[event.player_index]
     local surface = player.surface
     local position = player.position
     local pos1 = position.x - 5
     local pos2 = position.y - 5
     local pos3 = position.x + 5
     local pos4 = position.y + 5
     local entities = surface.find_entities({{pos1, pos2}, {pos3, pos4}})
     for _, entity in pairs(entities) do
      surface.print(entity.name)
     end

 end)]]
 script.on_event(defines.events.on_chunk_generated, function(event) --delete all resources on water except oil
   local box = event.area
   local surface = event.surface
   local entities = surface.find_entities_filtered{area = box, type = "resource"}
   for _, i in pairs(entities) do
     local pos = i.position
     local tile = surface.get_tile(pos.x, pos.y)
     if tile.name == "deepwater" then
       if (i.name ~= "crude-oil" and i.name ~= "sea-oil") then
        i.destroy()
       end
     end
   end
 end)
