data.raw["tile"]["deepwater"] = nil
data.raw["fish"]["fish"] = nil


data:extend({
  {
    type = "tile",
    name = "deepwater",
    collision_mask =
    {

      "player-layer",
      "doodad-layer"
    },
    autoplace = water_autoplace_settings(250),
    layer = 45,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/deepwater/deepwater1.png",
          count = 8,
          size = 1
        },
        {
          picture = "__base__/graphics/terrain/deepwater/deepwater2.png",
          count = 8,
          size = 2
        },
        {
          picture = "__base__/graphics/terrain/deepwater/deepwater4.png",
          count = 6,
          size = 4
        }
      },
      inner_corner =
      {
        picture = "__base__/graphics/terrain/deepwater/deepwater-inner-corner.png",
        count = 6
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/deepwater/deepwater-outer-corner.png",
        count = 6
      },
      side =
      {
        picture = "__base__/graphics/terrain/deepwater/deepwater-side.png",
        count = 8
      }
    },
    allowed_neighbors = { "water" },
    map_color={r=0.0941, g=0.2823, b=0.345},
    ageing=0.0006
  },
  {
    type = "fish",
    name = "fish",
    icon = "__base__/graphics/icons/fish.png",
    flags = {"placeable-neutral"},
    minable = {mining_time = 1, result = "raw-fish"},
    max_health = 20,
    subgroup = "creatures",
    order = "b-a",
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
