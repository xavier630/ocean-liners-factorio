
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

 --[[script.on_event(defines.events.on_player_driving_changed_state, function(event)
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

 end)]]
 script.on_event(defines.events.on_tick, function(event)
  for k, player in pairs(game.players) do
    local pos = player.position
    local tile = player.surface.get_tile(pos.x, pos.y)
    local name = tile.name
    if (name == "deepwater" or name == "water" or name == "deepwater-green" or name == "water-green" ) then
      player.character_running_speed_modifier = -0.7
      player.character_mining_speed_modifier = -0.7
    else
      player.character_running_speed_modifier = 0
      player.character_mining_speed_modifier = 0
    end
  end
 end)


 script.on_event(defines.events.on_entity_died, function(event) --Receive shells for killing fish
   if event.entity.name == "fish" then
     player = game.players[1] --TODO give to the right player - will be easier when API is updated so that the event features a player
     player.character.insert{name="cannon-shell", count=5}
   end
 end)


 script.on_event(defines.events.on_player_crafted_item, function(event) --Script to test for entities around the player
     local player = game.players[event.player_index]
     local surface = player.surface
     local position = player.position
     local pos1 = position.x - 5
     local pos2 = position.y - 5
     local pos3 = position.x + 5
     local pos4 = position.y + 5
     local entities = surface.find_entities({{pos1, pos2}, {pos3, pos4}})
     for _, entity in pairs(entities) do
      surface.print(entity.name .. " " .. entity.type)
     end

 end)
 script.on_event(defines.events.on_chunk_generated, function(event) --delete all resources and plants on water except oil
   local box = event.area
   local surface = event.surface
   local entities = surface.find_entities_filtered{area = box, type = "resource"}
   local entities2 = surface.find_entities_filtered{area = box, type = "decorative"}
   local entities3 = surface.find_entities_filtered{area = box, type = "tree"}
   local to_be_destroyed = {}
   for k,v in pairs(entities2) do table.insert(entities, v) end --merge the tables.
   for k,v in pairs(entities3) do table.insert(entities, v) end --merge the tables.

   for _, i in pairs(entities) do
     -- if (i.valid) -- then only needed when deleting surrounding oil, not the current oil
       local pos = i.position
       local tile = surface.get_tile(pos.x, pos.y)
       if (i.name == "sea-oil") then --Make sure oil isn't too close together
          local area = {{pos.x - 3, pos.y - 3}, {pos.x + 3, pos.y + 3}}
          local neighbours = surface.find_entities_filtered({area=area, name = "sea-oil"})

          for key, j in pairs(neighbours) do
            if (j ~= i) then
              --Can either delete the surround oil or delete this oil.
              i.destroy()
              break
              --j.destroy()
            end
          end
       else
         if (tile.name == "deepwater") then -- Destroy if not crude oil and over the water
          i.destroy()
         end
       end --end if
    --end
   end --end for
 end)
