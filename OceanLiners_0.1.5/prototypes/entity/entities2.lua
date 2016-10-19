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
      {
        type = "mining-drill",
        name = "oil-rig",
        collision_mask =
        {

        },
        icon = "__base__/graphics/icons/pumpjack.png",
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 1, result = "oil-rig"},
        resource_categories = {"basic-fluid"},
        max_health = 100,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
        selection_box = {{ -1.5, -1.5}, {1.5, 1.5}},
        --drawing_box = {{-1.6, -2.5}, {1.5, 1.6}},
        energy_source =
        {
          type = "electric",
          -- will produce this much * energy pollution units per tick
          emissions = 0.15 / 1.5,
          usage_priority = "secondary-input"
        },
        fluid_box =
        {
          base_area = 1,
          base_level = 1,
          pipe_covers = pipecoverspictures(),
          pipe_connections =
          {
            {
              positions = { {1, -2}, {2, -1}, {-1, 2}, {-2, 1} }
            }
          },
        },
        energy_usage = "75kW",
        mining_speed = 2,
        mining_power = 3,
        resource_searching_radius = 0.49,
        vector_to_place_result = {0, 0},
        module_specification =
        {
          module_slots = 2
        },
        radius_visualisation_picture =
        {
          filename = "__base__/graphics/entity/pumpjack/pumpjack-radius-visualization.png",
          width = 12,
          height = 12
        },
        base_picture =
        {
          sheet =
          {
            filename = "__base__/graphics/entity/pumpjack/pumpjack-base.png",
            priority = "extra-high",
            width = 114,
            height = 113,
            shift = {0.1875, -0.03125}
          }
        },
        animations =
        {
          north =
          {
            priority = "extra-high",
            width = 116,
            height = 110,
            line_length = 10,
            shift = {0.125, -0.71875},
            filename = "__base__/graphics/entity/pumpjack/pumpjack-animation.png",
            frame_count = 40,
            animation_speed = 0.5
          }
        },
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        working_sound =
        {
          sound = { filename = "__base__/sound/pumpjack.ogg" },
          apparent_volume = 1.5,
        },
        fast_replaceable_group = "pumpjack"
      },


})