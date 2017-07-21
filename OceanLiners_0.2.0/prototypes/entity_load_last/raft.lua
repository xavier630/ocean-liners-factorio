data:extend({
      {
          type = "car",
          name = "raft",
          icon = "__base__/graphics/icons/car.png",
          flags = {"pushable", "placeable-neutral", "player-creation", "placeable-off-grid"},
          minable = {mining_time = 0.5, result = "raft"},
          max_health = 50,
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
              percent = 90,
              decrease = 40
            }
          },
          collision_mask = {"ground-tile", "object-layer"},
          collision_box = {{-0.2, -0.4}, {0.2, 0.4}},
          selection_box = {{-0.7, -1}, {0.7, 1}},
          effectivity = 0.8,
          braking_power = "200kW",
          burner =
          {
            effectivity = 0.15,
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
          consumption = "1kW",
          friction = 9e-3,
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
          rotation_speed = 0.035,
          weight = 1000,
          guns = {},
          inventory_size = 5
        },
})
