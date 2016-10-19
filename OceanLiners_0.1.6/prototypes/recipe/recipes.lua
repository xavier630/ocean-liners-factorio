data:extend(
  {
    {
      type = "recipe",
      name = "paddle-steamer",
      enabled = "true",
      ingredients =
      {
        {"iron-plate", 10},
        {"iron-gear-wheel", 5},
        {"engine-unit", 2},
      },
      result = "paddle-steamer"
    },
    {
      type = "recipe",
      name = "ironclad",
      enabled = "true",
      ingredients =
      {
        {"iron-plate", 10},
        {"steel-plate", 10},
        {"iron-gear-wheel", 15},
        {"engine-unit", 3},

      },
      result = "ironclad"
    },
    {
      type = "recipe",
      name = "raft",
      enabled = "true",
      ingredients =
      {
        {"wood", 15},
      },
      result = "raft"
    },
    {
      type = "recipe",
      name = "dock",
      enabled = "true",

      ingredients =
      {
        {"iron-plate", 20},
        {"steel-plate", 10},
        {"iron-gear-wheel", 10},
      },
      result = "dock"
    },
    {
      type = "recipe",
      name = "oil-rig",
      enabled = "true",
      ingredients =
      {
        {"iron-plate", 30},
        {"steel-plate", 10},
        {"iron-gear-wheel", 10},
      },
      result = "oil-rig"
    },
    {
      type = "recipe",
      name = "ocean-power-pole",
      enabled = "true",
      ingredients =
      {
        {"iron-plate", 50},
        {"iron-gear-wheel", 10},
        {"copper-plate", 5},
      },
      result = "ocean-power-pole",
      result_count = 3,
      description = "Very powerful power poles. Can only be placed over water."

    },

  })