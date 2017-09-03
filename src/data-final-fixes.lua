--The place where vanilla entities are overridden -- define boats here because cars get overridden in this file.
require("functions.functions")
data.raw["tile"]["deepwater"].collision_mask = {"item-layer", "layer-14"} --layer 14 used for when swimming is disabled so the player can't walk on deepwater
data.raw["tile"]["water"].collision_mask = {"item-layer", "water-tile", "layer-14"}
data.raw["tile"]["deepwater-green"].collision_mask = {"item-layer", "layer-14"}
data.raw["tile"]["water-green"].collision_mask = {"item-layer", "water-tile", "layer-14"}
data.raw["curved-rail"]["curved-rail"].collision_mask = {"object-layer", "not-colliding-with-itself"}
data.raw["straight-rail"]["straight-rail"].collision_mask = {"object-layer", "not-colliding-with-itself"}

local_fish = data.raw["fish"]["fish"]
local_fish.collision_mask = {"ground-tile"}
local_fish.collision_box = {{-0.1, -0.1}, {0.1, 0.1}}
local_fish.max_health = 1

local car = data.raw["car"]
-- Change collision mask of all cars
for k,v in pairs(car) do
  if (not is_plane(v.name)) then
    v.collision_mask={"player-layer", "layer-14"} --Can't do water-tile because then can't pass through gates.
  end
end

--KEEP ALL BOATS HERE - it's important that the boats are loaded after the changes to cars above
require("prototypes.entity.load-last-entities.load-last-entities")

--Load config last to ensure compatibility with other mods that change cars, biters, etc
require("config-impl")
