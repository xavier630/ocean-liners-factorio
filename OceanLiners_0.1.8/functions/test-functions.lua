check_nearby_entities = function(event)
  --[[local player = game.players[event.player_index]
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
  surface.print(surface.get_tile(pos1, pos2).name)]]
  --local item = event.itemstack
  --game.players[event.player_index].surface.print(data.raw["gate"]["gate"].collision_mask)
end
