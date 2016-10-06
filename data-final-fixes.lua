data.raw["tile"]["deepwater"] = nil
data.raw["fish"]["fish"] = nil
data.raw["pipe"]["pipe"] = nil



data:extend({
  {
    type = "tile",
    name = "deepwater",
    collision_mask =
    {

      "player-layer",
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
  {
    type = "pipe",
    name = "pipe",
    icon = "__base__/graphics/icons/pipe.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "pipe"},
    max_health = 50,
    corpse = "small-remnants",
    collision_mask =
    {


    },
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    fast_replaceable_group = "pipe",
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_connections =
      {
        { position = {0, -1} },
        { position = {1, 0} },
        { position = {0, 1} },
        { position = {-1, 0} }
      },
    },
    pictures = pipepictures(),
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/pipe.ogg",
          volume = 0.85
        },
      },
      match_volume_to_activity = true,
      max_sounds_per_type = 3
    },
    horizontal_window_bounding_box = {{-0.25, -0.25}, {0.25, 0.15625}},
    vertical_window_bounding_box = {{-0.28125, -0.40625}, {0.03125, 0.125}}
  },


})
