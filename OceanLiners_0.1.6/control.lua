--On adding a boat make sure to change the isBoat function
script.on_init(function()

end)

face_left = function(car)
  car.orientation =  0.75
  return true
end
face_right = function(car)
  car.orientation =  0.25
  return true
end
face_up = function(car)
  car.orientation =  0
  return true
end
face_down = function(car)
  car.orientation =  0.5
  return true
end
--takes an entity name
is_boat = function(name)
  if (name == "ironclad" or name == "paddle-steamer" or name == "raft") then
    return true
  else
    return false
  end
end
--takes an entity name
is_sailing_boat = function(name)
  if (name == "raft") then
    return true
  else
    return false
  end
end
--takes a tile name
is_water_tile = function(name)
  if (name == "deepwater" or name == "water" or name == "deepwater-green" or name == "water-green") then
    return true
  else
    return false
  end
end



calc_orientation = function(player, car)
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
    if (player.connected and player.character) then --for all active players

      local pos = player.position                   --Check for swimming
      local tile = player.surface.get_tile(pos.x, pos.y)
      local name = tile.name
      if (is_water_tile(name)) then
        player.character_running_speed_modifier = -0.7
        player.character_mining_speed_modifier = -0.7
      else
        player.character_running_speed_modifier = 0
        player.character_mining_speed_modifier = 0
      end

      if (player.driving and is_sailing_boat(player.vehicle.name)) then--Check for sailing boats

        local wind_speed = player.surface.wind_speed * 15
        local wind_direction = player.surface.wind_orientation
        local boat_direction = player.vehicle.orientation
        player.surface.print(wind_direction)
        if (boat_direction > wind_direction) then
           direction_difference = (boat_direction - wind_direction)
        else
          direction_difference = (wind_direction - boat_direction)
        end
        if (direction_difference < 0.3) then --Look at how far apart in a circle the two directions are (a full circle is one). If closer than a quarter-circle, increase speed
          if (wind_speed > player.vehicle.speed) then
            if (direction_difference < 0.15) then
              player.vehicle.speed = ((wind_speed - player.vehicle.speed) / 2) --increase speed by a fraction of the difference between player speed and wind speed
            elseif (direction_difference < 0.20) then
              player.vehicle.speed = ((wind_speed - player.vehicle.speed) / 4)
            elseif (direction_difference < 0.30) then
              player.vehicle.speed = ((wind_speed - player.vehicle.speed) / 8)
            end
          end
        else
          if (player.vehicle.speed > 0.001) then
            player.vehicle.speed = player.vehicle.speed - 0.0001
          end
        end
      end --end sailing boat checks


    end
  end
 end)


 script.on_event(defines.events.on_entity_died, function(event) --Receive shells for killing fish
   if event.entity.name == "fish" then
     --player = game.players[1] --TODO Give ammo to the player who killed the fish
     --player.character.insert{name="cannon-shell", count=5}

     local players = game.players --undo any damage caused by fish ;)
     for k,v in pairs(players) do
       local vehicle = v.vehicle
       if (vehicle ~= nil and is_boat(vehicle.name)) then --TODO if type = boat. Can't do types yet. Damn it. Have to hard code every boat?
         vehicle.health = vehicle.health + 1
         --v.surface.print("fish killed")
       end
     end
   end
 end)


 --[[script.on_event(defines.events.on_player_crafted_item, function(event) --Script to test for entities around the player
     local player = game.players[event.player_index]
     local surface = player.surface
     local position = player.position
     local pos1 = position.x - 5
     local pos2 = position.y - 5
     local pos3 = position.x + 5
     local pos4 = position.y + 5
     local entities = surface.find_entities({{pos1, pos2}, {pos3, pos4}})
     for _, entity in pairs(entities) do
      --surface.print(entity.name .. " " .. entity.type)
     end
     surface.print(surface.get_tile(pos1, pos2).name)


 end)]]
 script.on_event(defines.events.on_chunk_generated, function(event) --delete all resources and plants on water except oil
   local box = event.area
   local surface = event.surface
   local entities = surface.find_entities_filtered{area = box, type = "resource"}
   local entities2 = surface.find_entities_filtered{area = box, type = "decorative"}
   local entities3 = surface.find_entities_filtered{area = box, type = "tree"}
   local entities4 = surface.find_entities_filtered{area = box, type = "unit-spawner"}
   local to_be_destroyed = {}
   for k,v in pairs(entities2) do table.insert(entities, v) end --merge the tables.
   for k,v in pairs(entities3) do table.insert(entities, v) end --merge the tables.
   for k,v in pairs(entities4) do table.insert(entities, v) end --merge the tables.

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
         if (is_water_tile(tile.name)) then -- Destroy if not crude oil and over the water
          i.destroy()
         end
       end --end if
    --end
   end --end for
 end)
