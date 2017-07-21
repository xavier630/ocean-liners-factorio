require("config")

--biter swimming
if not (biters_cross_water) then
  require("functions.biters-cross-water")
end

--player swimming
if (player_swimming) then
  data.raw["player"]["player"].collision_mask={"player-layer"}
else
  data.raw["player"]["player"].collision_mask={"player-layer", "water-tile", "layer-14"}
end

--pass through pipes
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

--explosives
if (explosives_create_water) then
  data.raw["item"]["explosives"].place_as_tile = {
      result = "water",
      condition_size = 1,
      condition = { "item-layer", "object-layer" }
  }
end

--oil coverage
data.raw["resource"]["sea-oil"].autoplace.coverage=sea_oil_coverage
