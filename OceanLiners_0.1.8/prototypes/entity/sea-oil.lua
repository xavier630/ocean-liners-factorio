data:extend({
      {
        type = "resource",
        name = "sea-oil",
        icon = "__base__/graphics/icons/crude-oil.png",
        flags = {"placeable-neutral"},
        category = "basic-fluid",
        order="a-b-a",
        infinite = true,
        minimum = 1500,
        normal = 15000,
        minable =
        {
          hardness = 1,
          mining_time = 1,
          results =
          {
            {
              type = "fluid",
              name = "crude-oil",
              amount_min = 1,
              amount_max = 1,
              probability = 1
            }
          }
        },
        collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},--{{0, 0}, {0, 0}}, --Can either have small map icons or few oil collisions
        selection_box = {{ -0.5, -0.5}, {0.5, 0.5}}, --Because ground-tile has both cars and oil as a collision_mask
        collision_mask = {"ground-tile"}, --"object-layer"
        autoplace =
        {
          control = "crude-oil",
          sharpness = 0.99,
          max_probability = 0.085,
          richness_base = 10000,
          richness_multiplier = 35000,
          richness_multiplier_distance_bonus = 10,
          coverage = 0.04,
          peaks =
          {
            {
              noise_layer = "crude-oil",
              noise_octaves_difference = -1,
              noise_persistence = 0.4,
            }
          }
        },
        stage_counts = {0},
        stages =
        {
          sheet =
          {
            filename = "__base__/graphics/entity/crude-oil/crude-oil.png",
            priority = "extra-high",
            width = 75,
            height = 61,
            frame_count = 4,
            variation_count = 1
          }
        },
        map_color = {r=0.9098, g=0.6, b=0.8},
        map_grid = false
      },


})
