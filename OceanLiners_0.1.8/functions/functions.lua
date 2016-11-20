local planes = {"plane", "airplane", "aircraft", "cargo-plane", "jet", "gunship", "flying-fortress"}
local water_tiles = {"deepwater", "water", "deepwater-green", "water-green", "tile-face-north", "tile-face-east", "tile-face-south", "tile-face-west"}
local boats = {"ironclad", "paddle-steamer", "raft"}
local motor_boats = {"ironclad", "paddle-steamer"}
local special_tiles = {"tile-face-north", "tile-face-east", "tile-face-south", "tile-face-west"}
local sailing_boats = {"raft"}

--Note that all of these function take an entity name
is_motor_boat = function(name)
  return is_type(name, boats)
end

is_boat = function(name)
  return is_type(name, motor_boats)
end

is_sailing_boat = function(name)
  return is_type(name, sailing_boats)
end

is_special_tile = function(name)
  return is_type(name, special_tiles)
end

is_water_tile = function(name)
  return is_type(name, water_tiles)
end

is_plane = function(name)
  return is_type(name, planes)
end

is_type = function(name, array)
  for k, v in pairs(array) do
    if (name == v) then
      return true
    end
  end
  return false
end



calculate_wind_impact = function()
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
end

function cleanse_chunk(event)
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
end
