require("config")

--Biter swimming
if not (biters_cross_water) then
  --Makes it so that biters CAN'T cross water.
  local biters = data.raw["unit"]
  for k,v in pairs(biters) do
    v.collision_mask={"water-tile", "player-layer"}
  end
end

--Set collision mask of all biter spawners
local biter_lair = data.raw["unit-spawner"]
if (biters_bases_spawn_on_water) then
  for k,v in pairs(biter_lair) do
    v.collision_mask={"player-layer"} --only the spawners, not the bugs.
  end
else
  for k,v in pairs(biter_lair) do
    v.collision_mask={"water-tile", "player-layer", "layer-14"} --only the spawners, not the bugs.
  end
end

--Player swimming
if (player_swimming) then
  data.raw["player"]["player"].collision_mask={"player-layer"}
else
  data.raw["player"]["player"].collision_mask={"player-layer", "water-tile", "layer-14"}
end

--Pass through pipes
local pipe = data.raw["pipe"]
local pipe_to_ground = data.raw["pipe-to-ground"]
if (travel_through_pipes) then
  for k,v in pairs(pipe) do --collision changes apply to all pipes.
    v.collision_mask={"object-layer"}
  end
  for k,v in pairs(pipe_to_ground) do --collision changes apply to all pipes.
    v.collision_mask={"object-layer"}
  end
else
  for k,v in pairs(pipe) do --collision changes apply to all pipes.
    v.collision_mask={"object-layer", "player-layer"}
  end
  for k,v in pairs(pipe_to_ground) do --collision changes apply to all pipes.
    v.collision_mask={"object-layer", "player-layer"}
  end
end

--Explosives
if (explosives_create_water) then
  data.raw["item"]["explosives"].place_as_tile = {
      result = "water",
      condition_size = 1, -- 0
      condition = { "item-layer", "object-layer" } -- just item-layer
  }
end

--[[Decoratives on water
if not (decoratives_on_water) then
  decoratives = data.raw["optimized-decorative"]
  for k,v in pairs(decoratives) do
    v.collision_mask={"layer-14", "object-layer", "water-tile"} --None on water
  end
end]]

--Oil coverage
data.raw["resource"]["sea-oil"].autoplace.coverage=sea_oil_coverage
