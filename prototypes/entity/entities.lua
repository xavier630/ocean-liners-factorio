data:extend({
  {
        type = "car",
        name = "ironclad",
        icon = "__base__/graphics/icons/car.png",
        flags = {"pushable", "placeable-neutral", "player-creation", "placeable-off-grid"},
        minable = {mining_time = 0.5, result = "ironclad"},
        max_health = 200,
        corpse = "medium-remnants",
        dying_explosion = "medium-explosion",
        energy_per_hit_point = 1,
        crash_trigger = crash_trigger(),
        resistances =
        {
          {
            type = "fire",
            percent = 70
          },
          {
            type = "impact",
            percent = 80,
            decrease = 30
          }
        },
        collision_mask = {"ground-tile"},
        collision_box = {{-0.2, -0.4}, {0.2, 0.4}},
        selection_box = {{-0.7, -1}, {0.7, 1}},
        effectivity = 0.5,
        braking_power = "200kW",
        burner =
        {
          effectivity = 0.85,
          fuel_inventory_size = 4,
          smoke =
          {
            {
              name = "car-smoke",
              deviation = {0.45, 0.45},
              frequency = 300,
              position = {0, 0.35},
              starting_frame = 1,
              starting_frame_deviation = 60
            }
          }
        },
        consumption = "100kW",
        friction = 2e-3,
        light =
        {
          {
            type = "oriented",
            minimum_darkness = 0.3,
            picture =
            {
              filename = "__core__/graphics/light-cone.png",
              priority = "medium",
              scale = 2,
              width = 200,
              height = 200
            },
            shift = {-0.6, -14},
            size = 2,
            intensity = 0.6
          },
          {
            type = "oriented",
            minimum_darkness = 0.3,
            picture =
            {
              filename = "__core__/graphics/light-cone.png",
              priority = "medium",
              scale = 2,
              width = 200,
              height = 200
            },
            shift = {0.6, -14},
            size = 2,
            intensity = 0.6
          }
        },
        animation =
        {
          layers =
          {
            {
              width = 102,
              height = 86,
              frame_count = 2,
              direction_count = 64,
              shift = {0, -0.1875},
              animation_speed = 8,
              max_advance = 0.2,
              stripes =
              {
                {
                 filename = "__base__/graphics/entity/car/car-1.png",
                 width_in_frames = 2,
                 height_in_frames = 22,
                },
                {
                 filename = "__base__/graphics/entity/car/car-2.png",
                 width_in_frames = 2,
                 height_in_frames = 22,
                },
                {
                 filename = "__base__/graphics/entity/car/car-3.png",
                 width_in_frames = 2,
                 height_in_frames = 20,
                },
              }
            },
            {
              width = 100,
              height = 75,
              frame_count = 2,
              apply_runtime_tint = true,
              direction_count = 64,
              max_advance = 0.2,
              line_length = 2,
              shift = {0, -0.171875},
              stripes = util.multiplystripes(2,
              {
                {
                  filename = "__base__/graphics/entity/car/car-mask-1.png",
                  width_in_frames = 1,
                  height_in_frames = 22,
                },
                {
                  filename = "__base__/graphics/entity/car/car-mask-2.png",
                  width_in_frames = 1,
                  height_in_frames = 22,
                },
                {
                  filename = "__base__/graphics/entity/car/car-mask-3.png",
                  width_in_frames = 1,
                  height_in_frames = 20,
                },
              })
            },
            {
              width = 114,
              height = 76,
              frame_count = 2,
              draw_as_shadow = true,
              direction_count = 64,
              shift = {0.28125, 0.25},
              max_advance = 0.2,
              stripes = util.multiplystripes(2,
              {
               {
                filename = "__base__/graphics/entity/car/car-shadow-1.png",
                width_in_frames = 1,
                height_in_frames = 22,
               },
               {
                filename = "__base__/graphics/entity/car/car-shadow-2.png",
                width_in_frames = 1,
                height_in_frames = 22,
               },
               {
                filename = "__base__/graphics/entity/car/car-shadow-3.png",
                width_in_frames = 1,
                height_in_frames = 20,
               },
              })
            }
          }
        },
        turret_animation =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/car/car-turret.png",
              line_length = 8,
              width = 36,
              height = 29,
              frame_count = 1,
              direction_count = 64,
              shift = {0.03125, -0.890625},
              animation_speed = 8,
            },
            {
              filename = "__base__/graphics/entity/car/car-turret-shadow.png",
              line_length = 8,
              width = 46,
              height = 31,
              frame_count = 1,
              draw_as_shadow = true,
              direction_count = 64,
              shift = {0.875, 0.359375},
            }
          }
        },
        turret_rotation_speed = 0.45 / 60,
        sound_no_fuel =
        {
          {
            filename = "__base__/sound/fight/car-no-fuel-1.ogg",
            volume = 0.6
          },
        },
        stop_trigger_speed = 0.2,
        stop_trigger =
        {
          {
            type = "play-sound",
            sound =
            {
              {
                filename = "__base__/sound/car-breaks.ogg",
                volume = 0.6
              },
            }
          },
        },
        sound_minimum_speed = 0.2;
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },

        open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
        close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
        rotation_speed = 0.010,
        weight = 1200,
        guns = { "tank-cannon", "tank-machine-gun" },
        turret_rotation_speed = 0.95 / 60,
        turret_return_timeout = 200,
        turret_animation =
        {
          layers =
          {
              {
                filename = "__base__/graphics/entity/tank/turret.png",
                line_length = 8,
                width = 92,
                height = 69,
                frame_count = 1,
                direction_count = 64,
                shift = {-0.15625, -1.07812},
                animation_speed = 8,
              },
              {
                filename = "__base__/graphics/entity/tank/turret-mask.png",
                line_length = 8,
                width = 38,
                height = 29,
                frame_count = 1,
                apply_runtime_tint = true,
                direction_count = 64,
                shift = {-0.15625, -1.23438},
              },
              {
                filename = "__base__/graphics/entity/tank/turret-shadow.png",
                line_length = 8,
                width = 95,
                height = 67,
                frame_count = 1,
                draw_as_shadow = true,
                direction_count = 64,
                shift = {1.70312, 0.640625},
              }
            }
      },
      inventory_size = 135
    },
    {
        type = "car",
        name = "paddle-steamer",
        icon = "__base__/graphics/icons/car.png",
        flags = {"pushable", "placeable-neutral", "player-creation", "placeable-off-grid"},
        minable = {mining_time = 0.5, result = "paddle-steamer"},
        max_health = 200,
        corpse = "medium-remnants",
        dying_explosion = "medium-explosion",
        energy_per_hit_point = 1,
        crash_trigger = crash_trigger(),
        resistances =
        {
          {
            type = "fire",
            percent = 70
          },
          {
            type = "impact",
            percent = 80,
            decrease = 30
          }
        },
        collision_mask = {"ground-tile"},
        collision_box = {{-0.2, -0.4}, {0.2, 0.4}},
        selection_box = {{-0.7, -1}, {0.7, 1}},
        effectivity = 0.5,
        braking_power = "200kW",
        burner =
        {
          effectivity = 0.85,
          fuel_inventory_size = 4,
          smoke =
          {
            {
              name = "car-smoke",
              deviation = {0.45, 0.45},
              frequency = 300,
              position = {0, 0.35},
              starting_frame = 1,
              starting_frame_deviation = 60
            }
          }
        },
        consumption = "100kW",
        friction = 2e-3,
        light =
        {
          {
            type = "oriented",
            minimum_darkness = 0.3,
            picture =
            {
              filename = "__core__/graphics/light-cone.png",
              priority = "medium",
              scale = 2,
              width = 200,
              height = 200
            },
            shift = {-0.6, -14},
            size = 2,
            intensity = 0.6
          },
          {
            type = "oriented",
            minimum_darkness = 0.3,
            picture =
            {
              filename = "__core__/graphics/light-cone.png",
              priority = "medium",
              scale = 2,
              width = 200,
              height = 200
            },
            shift = {0.6, -14},
            size = 2,
            intensity = 0.6
          }
        },
        animation =
        {
          layers =
          {
            {
              width = 102,
              height = 86,
              frame_count = 2,
              direction_count = 64,
              shift = {0, -0.1875},
              animation_speed = 8,
              max_advance = 0.2,
              stripes =
              {
                {
                 filename = "__base__/graphics/entity/car/car-1.png",
                 width_in_frames = 2,
                 height_in_frames = 22,
                },
                {
                 filename = "__base__/graphics/entity/car/car-2.png",
                 width_in_frames = 2,
                 height_in_frames = 22,
                },
                {
                 filename = "__base__/graphics/entity/car/car-3.png",
                 width_in_frames = 2,
                 height_in_frames = 20,
                },
              }
            },
            {
              width = 100,
              height = 75,
              frame_count = 2,
              apply_runtime_tint = true,
              direction_count = 64,
              max_advance = 0.2,
              line_length = 2,
              shift = {0, -0.171875},
              stripes = util.multiplystripes(2,
              {
                {
                  filename = "__base__/graphics/entity/car/car-mask-1.png",
                  width_in_frames = 1,
                  height_in_frames = 22,
                },
                {
                  filename = "__base__/graphics/entity/car/car-mask-2.png",
                  width_in_frames = 1,
                  height_in_frames = 22,
                },
                {
                  filename = "__base__/graphics/entity/car/car-mask-3.png",
                  width_in_frames = 1,
                  height_in_frames = 20,
                },
              })
            },
            {
              width = 114,
              height = 76,
              frame_count = 2,
              draw_as_shadow = true,
              direction_count = 64,
              shift = {0.28125, 0.25},
              max_advance = 0.2,
              stripes = util.multiplystripes(2,
              {
               {
                filename = "__base__/graphics/entity/car/car-shadow-1.png",
                width_in_frames = 1,
                height_in_frames = 22,
               },
               {
                filename = "__base__/graphics/entity/car/car-shadow-2.png",
                width_in_frames = 1,
                height_in_frames = 22,
               },
               {
                filename = "__base__/graphics/entity/car/car-shadow-3.png",
                width_in_frames = 1,
                height_in_frames = 20,
               },
              })
            }
          }
        },
        turret_animation =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/car/car-turret.png",
              line_length = 8,
              width = 36,
              height = 29,
              frame_count = 1,
              direction_count = 64,
              shift = {0.03125, -0.890625},
              animation_speed = 8,
            },
            {
              filename = "__base__/graphics/entity/car/car-turret-shadow.png",
              line_length = 8,
              width = 46,
              height = 31,
              frame_count = 1,
              draw_as_shadow = true,
              direction_count = 64,
              shift = {0.875, 0.359375},
            }
          }
        },
        turret_rotation_speed = 0.35 / 60,
        sound_no_fuel =
        {
          {
            filename = "__base__/sound/fight/car-no-fuel-1.ogg",
            volume = 0.6
          },
        },
        stop_trigger_speed = 0.2,
        stop_trigger =
        {
          {
            type = "play-sound",
            sound =
            {
              {
                filename = "__base__/sound/car-breaks.ogg",
                volume = 0.6
              },
            }
          },
        },
        sound_minimum_speed = 0.2;
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        working_sound =
        {
          sound =
          {
            filename = "__base__/sound/car-engine.ogg",
            volume = 0.6
          },
          activate_sound =
          {
            filename = "__base__/sound/car-engine-start.ogg",
            volume = 0.6
          },
          deactivate_sound =
          {
            filename = "__base__/sound/car-engine-stop.ogg",
            volume = 0.6
          },
          match_speed_to_activity = true,
        },
        open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
        close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
        rotation_speed = 0.010,
        weight = 1200,
        guns = { "vehicle-machine-gun" },
        inventory_size = 115
      },
      {
            type = "offshore-pump",
            name = "dock",
            icon = "__base__/graphics/icons/offshore-pump.png",
            flags = {"placeable-neutral", "player-creation", "filter-directions"},
            minable = {mining_time = 0.5, result = "dock"},
            max_health = 200,
            corpse = "medium-remnants",
            dying_explosion = "medium-explosion",
            energy_per_hit_point = 1,
            collision_box = {{-0.6, -0.3}, {0.6, 0.3}},
            selection_box = {{-1, -1.49}, {1, 0.49}},
            pumping_speed = 1,
            fluid = "crude-oil",
            fluid_box =
              {
                base_area = 5,
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                  { position = {0, 1} },
                },
              },
              picture =
               {
                 north =
                 {
                   filename = "__base__/graphics/entity/offshore-pump/offshore-pump.png",
                   priority = "high",
                   shift = {0.9, 0.05},
                   width = 160,
                   height = 102
                 },
                 east =
                 {
                   filename = "__base__/graphics/entity/offshore-pump/offshore-pump.png",
                   priority = "high",
                   shift = {0.9, 0.05},
                   x = 160,
                   width = 160,
                   height = 102
                 },
                 south =
                 {
                   filename = "__base__/graphics/entity/offshore-pump/offshore-pump.png",
                   priority = "high",
                   shift = {0.9, 0.65},
                   x = 320,
                   width = 160,
                   height = 102
                 },
                 west =
                 {
                   filename = "__base__/graphics/entity/offshore-pump/offshore-pump.png",
                   priority = "high",
                   shift = {1.0, 0.05},
                   x = 480,
                   width = 160,
                   height = 102
                 }
               },
      },
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
        collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
        selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
        collision_mask = {"ground-tile"},
        autoplace =
        {
          control = "crude-oil",
          sharpness = 0.99,
          max_probability = 0.035,
          richness_base = 6000,
          richness_multiplier = 30000,
          richness_multiplier_distance_bonus = 10,
          coverage = 0.80, -- Cover on average 2% of surface area.
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
        map_color = {r=0.8, g=0.1, b=0.8},
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
        energy_usage = "0kW",
        mining_speed = 1,
        mining_power = 2,
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
--[[
]]
