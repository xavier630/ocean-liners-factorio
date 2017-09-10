local planes = {"plane", "airplane", "heli-placement-entity-_-",
 "heli-entity-_-", "heli-body-entity-_-", "heli-shadow-entity-_-", "heli-burner-entity-_-",
 "aircraft", "cargo-plane", "jet", "gunship", "flying-fortress"}

local water_tiles = {"deepwater", "water", "deepwater-green", "water-green",
 "tile-face-north", "tile-face-east", "tile-face-south", "tile-face-west"}

local boats = {"ironclad", "paddle-steamer", "raft", "amphibious-car", "container-ship"}

local motor_boats = {"ironclad", "paddle-steamer", "amphibious-car", "container-ship"}

local special_tiles = {"tile-face-north", "tile-face-east", "tile-face-south", "tile-face-west"}

local sailing_boats = {"raft"}

--Note that all of these function take an entity name
is_boat = function(name)
  return is_type(name, boats)
end

is_motor_boat = function(name)
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


--The wind should push boats a little, especially sailing boats
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

--Remove all resources from water that aren't sea oil when a chunk is created.
function cleanse_chunk(event)
  local box = event.area
  local surface = event.surface
  local entities = surface.find_entities_filtered{area = box, type = "resource"}
  local entities2 = surface.find_entities_filtered{area = box, type = "tree"}
  local entities3 = surface.find_entities_filtered{area = box, type = "unit-spawner"}
  for k,v in pairs(entities2) do table.insert(entities, v) end --merge the tables.
  for k,v in pairs(entities3) do table.insert(entities, v) end --merge the tables.

  for _, i in pairs(entities) do
    -- if (i.valid) -- then only needed when deleting surrounding oil, not the current oil
      local pos = i.position
      local tile = surface.get_tile(pos.x, pos.y)
      if (i.name == "sea-oil") then

         --remove closely grouped oil--
         local area = {{pos.x - 3, pos.y - 3}, {pos.x + 3, pos.y + 3}}  --Make sure oil isn't too close together
         local neighbours = surface.find_entities_filtered({area=area, name="sea-oil"})

         for key, j in pairs(neighbours) do
           if ((j ~= i) or not (is_water_tile(tile.name))) then --if there are close neighbours or oil is on land, destroy it.
             --Can either delete the surrounding oil or delete this oil.
             i.destroy()
             break
           end
         end

        -- Remove land oil -- "not (is_water_tile(tile.name)))" - this condition removes any oil spawned on land.
        -- the reason it needs to spawn on land is that oil can't have a ground tile collision_mask
        -- because oil rigs need that and rigs will be unplaceable if they both have it.
        -- So the solution is to spawn it everywhere and delete any not on the ocean.


      else
        if (is_water_tile(tile.name)) then -- Destroy if not crude oil and over the water
         --can add conditions here to keep other resources
         i.destroy()
        end
      end --end if
   --end
  end --end for

  -- Now that decoratives aren't entities, must run through every tile in the chunk and if it's a water tile, call delete decoratives on it.
  local top_left = box.left_top
  local bottom_right = box.right_bottom

  for i = top_left.y, bottom_right.y, 1 do
    for j = top_left.x, bottom_right.x, 1 do
       local tile = surface.get_tile(j, i)
       if (is_water_tile(tile.name)) then
         local area = {{j, i}, {j, i}} -- Just clear the one tile
         surface.destroy_decoratives(area)
       end
    end
  end
  --nested for loops increased by one at a time in x and y directions
  --check if water tile. If so, delete surface.destroy_decoratives(bounding_box)

end
