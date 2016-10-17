--The place where vanilla entities are overridden.
data.raw["tile"]["deepwater"].collision_mask={ "item-layer", "water-tile", "ground-tile"}
data.raw["tile"]["water"].collision_mask={ "item-layer", "water-tile", "ground-tile"}
--data.raw["tile"]["deepwater-green"].collision_mask={"object-layer"}
--data.raw["tile"]["water-green"].collision_mask={"object-layer"}
data.raw["curved-rail"]["curved-rail"].collision_mask={"object-layer", "not-colliding-with-itself"}
data.raw["straight-rail"]["straight-rail"].collision_mask={"object-layer", "not-colliding-with-itself"}
data.raw["fish"]["fish"] = nil
data.raw["player"]["player"].collision_mask={"player-layer"}
local pipe = data.raw["pipe"]
local pipe_to_ground = data.raw["pipe-to-ground"]

for k,v in pairs(pipe) do --collision changes apply to all pipes.
  v.collision_mask={"object-layer", "item-layer"}
end
for k,v in pairs(pipe_to_ground) do --collision changes apply to all pipes.
  v.collision_mask={"object-layer" , "item-layer"}
end


data:extend({

  {
    type = "fish",
    name = "fish",
    icon = "__base__/graphics/icons/fish.png",
    flags = {"placeable-neutral"},
    minable = {mining_time = 1, result = "raw-fish"},
    max_health = 20,
    subgroup = "creatures",
    order = "b-a",
    collision_mask = {"ground-tile"},
    collision_box = {{-10.4, -10.2}, {10.4, 10.2}},--{{-0.4, -0.2}, {0.4, 0.2}},
    selection_box = {{-0.5, -0.3}, {0.5, 0.3}},
    pictures =
    {
      {
        filename = "__base__/graphics/entity/fish/fish-1.png",
        priority = "extra-high",
        width = 22,
        height = 36
      },
      {
        filename = "__base__/graphics/entity/fish/fish-2.png",
        priority = "extra-high",
        width = 32,
        height = 32
      }
    },
    autoplace = {
      influence = 0.01
    }
  },



})
