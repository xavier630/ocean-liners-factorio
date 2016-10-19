require("config")
if not (biters_cross_water) then
  require("lib.biters-cross-water")
end
if (player_swimming) then
  data.raw["player"]["player"].collision_mask={"player-layer"}
else
  data.raw["player"]["player"].collision_mask={"player-layer", "water-tile"}
end
