--The place where vanilla entities are overridden -- define boats here because cars get overridden in this file.
require("functions.functions")
data.raw["tile"]["deepwater"].collision_mask={ "item-layer", "layer-14"} --layer 15 used for when swimming is disabled so the player can't walk on deepwater
data.raw["tile"]["water"].collision_mask={ "item-layer", "water-tile", "layer-14"}
data.raw["tile"]["deepwater-green"].collision_mask={"item-layer", "layer-14"}
data.raw["tile"]["water-green"].collision_mask={"item-layer", "water-tile", "layer-14"}
data.raw["curved-rail"]["curved-rail"].collision_mask={"object-layer", "not-colliding-with-itself"}
data.raw["straight-rail"]["straight-rail"].collision_mask={"object-layer", "not-colliding-with-itself"}
data.raw["fish"]["fish"] = nil

local car = data.raw["car"]
local biter_lair = data.raw["unit-spawner"]

for k,v in pairs(car) do
  if (not is_plane(v.name)) then
    v.collision_mask={"player-layer", "layer-14"} --Can't do water-tile because then can't pass through gates.
  end
end
for k,v in pairs(biter_lair) do
  v.collision_mask={"water-tile", "player-layer"} --only the spawners, not the bugs. -- make sure biter lairs don't spawn on shallow water.
end

--KEEP ALL BOATS HERE - it's important that the boats are loaded after the changes to cars above
require("prototypes.entity_load_last.fish")
require("prototypes.entity_load_last.ironclad")
require("prototypes.entity_load_last.paddle-steamer")
require("prototypes.entity_load_last.raft")
require("prototypes.entity_load_last.amphibious-car")
require("prototypes.entity_load_last.container-ship")
