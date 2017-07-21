require("functions")

on_init_tiles = function()
  if global.motor_boats == nil then
    global.motor_boats = {}
  end
end

add_to_motor_boats = function(event)
  local entity = event.created_entity
  if (is_motor_boat(entity.name)) then
    table.insert(global.motor_boats, entity)
  end
end

remove_from_motor_boats = function(event)
  local entity = event.entity
  if (is_motor_boat(entity.name)) then
    local counter = 1
    for k, v in pairs(global.motor_boats) do
      if (v == entity) then
        table.remove(global.motor_boats, counter)
      end
      counter = counter + 1
    end
  end
end

--Check what tile each boat is on and if it's special, apply its effect
check_boat_tiles = function()
  for k, v in pairs(global.motor_boats) do --iterate through all boats
    local tile = v.surface.get_tile(v.position)
    --game.players[1].surface.print(tile.name)
    if (is_special_tile(tile.name)) then --if a boat is on a special tile
      for k_tile, v_tile in pairs(tiles) do --go through special tile effects
        if (v_tile.name == tile.name) then --find the relevant effect
          v_tile.effect(v)
        end
      end
    end

  end

end
