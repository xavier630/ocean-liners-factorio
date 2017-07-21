require "command-tile-logic"

local default_enabled = true

--CREDIT
--Code for tiles by Diphtherial for Autocar with some changes by Xavier Downs


data:extend({
  {
    type = "tile",
    name = "tile-face-north",
    needs_correction = false,
    minable = {hardness = 0.2, mining_time = 0.01, result = "tile-face-north"},
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    collision_mask = {"item-layer"},
    layer = 101,
    variants =
    {
      main =
      {
        {
          picture = "__OceanLiners__/graphics/tiles/tile-face-north.png",
          count = 1,
          size = 1
        }
      },
      inner_corner = --All set to zero so that there will be no sides
      {
        picture = "__base__/graphics/terrain/deepwater/deepwater-inner-corner.png",
        count = 0
      },
      outer_corner =
      {
        picture = "__base__/graphics/terrain/deepwater/deepwater-outer-corner.png",
        count = 0
      },
      side =
      {
        picture = "__base__/graphics/terrain/deepwater/deepwater-side.png",
        count = 0
      }
    },
    map_color={r=100, g=100, b=100},
    ageing=0
  },

  --item
  {
    type = "item",
    name = "tile-face-north",
    icon = "__OceanLiners__/graphics/tiles/tile-face-north.png",
    flags = {"goes-to-quickbar"},
    subgroup = "ocean-liners-tiles",
    order = "a",
    stack_size = 100,
    place_as_tile =
    {
      result = "tile-face-north",
      condition_size = 1,
      condition = { "ground-tile" }
    }
  },

  -- recipe
  {
    type = "recipe",
    name = "tile-face-north",
    enabled = default_enabled,
    ingredients =
    {
      {"electronic-circuit", 3},
      {"iron-plate", 1}
    },
    result = "tile-face-north"
  }
})

--create other tiles based on the north facing tiles.

for k, v in pairs(tiles) do --tiles is from command-tile-logic

  if k ~= "tile-face-north" then --Don't do anything for north since it was already created above.
    -- copy the tile above to make all of the other tiles.
    local entity = util.table.deepcopy(data.raw["tile"]["tile-face-north"])
    local item = util.table.deepcopy(data.raw["item"]["tile-face-north"])
    local recipe = util.table.deepcopy(data.raw["recipe"]["tile-face-north"])

    --entity
    entity.name = v.name
    entity.minable.result = v.name
    entity.variants.main[1].picture = "__OceanLiners__/graphics/tiles/"..v.name..".png"

    -- item
    item.name = v.name
    item.icon = "__OceanLiners__/graphics/tiles/"..v.name..".png"
    item.subgroup = v.subgroup
    item.place_as_tile.result = v.name

    -- recipe
    recipe.name = v.name
    recipe.result = v.name
    recipe.order = v.order

    --Add the new data to the game
    data.raw[entity.type][entity.name] = entity
    data.raw[item.type][item.name] = item
    data.raw[recipe.type][recipe.name] = recipe
  end
end
