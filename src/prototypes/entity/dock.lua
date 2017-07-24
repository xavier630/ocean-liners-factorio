data:extend({
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
            fluid = "water",
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




})
--[[
]]
