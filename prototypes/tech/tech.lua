--[[data:extend(
  {
    {
      type = "technology",
      name = "rail-tanker",
      icon = "__RailTanker__/graphics/rail-tanker-tech.png",
      icon_size = 128,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "rail-tanker"
        },
      },
      prerequisites = { "fluid-handling", "automated-rail-transportation"},
      unit = {
        count = 70,
        ingredients = {
          {"science-pack-1", 1},
          {"science-pack-2", 1}
        },
        time = 20
      },
      order = "c-g-b-z",
    },
  })]]
