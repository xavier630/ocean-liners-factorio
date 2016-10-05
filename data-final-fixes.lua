data.raw["tile"]["deepwater"] = nil
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

})
