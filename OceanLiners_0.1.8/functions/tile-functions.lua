require("functions")
on_init_tiles = function()
  if global.motor_boats == nil then
    global.motor_boats = {}
  end
end
add_to_motor_boats = function(event)
  local entity = event.created_entity
  if (entity.is_motor_boat) then
    table.insert(global.motor_boats, entity)
  end
end
check_boat_tiles = function()
  for k, v in pairs(global.motor_boats) do
    game.player.surface.print(k)
  end
end
