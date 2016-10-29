--require "tiles-effects"

local default_enabled = true

--CREDIT
--Code for tiles by Diphtherial for Autocar with some changes by Xavier Downs


data:extend({
  {
    type = "tile",
    name = "tile-face-north",
    needs_correction = false,
    minable = {hardness = 0.2, mining_time = 0.5, result = "tile-face-north"},
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    collision_mask = {"item-layer"},
    layer = 5,
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

--
-- create all the other types of tiles as variants of rotright
--

--[[for k, v in pairs(tiletypes) do
  if k ~= "rotright" then
    -- define the lefthanded one as a copy of the right-handed one
    local entity = util.table.deepcopy(data.raw["tile"]["autocar-rotright"])
    local item = util.table.deepcopy(data.raw["item"]["autocar-rotright"])
    local recipe = util.table.deepcopy(data.raw["recipe"]["autocar-rotright"])

    -- ...specify entity, item, and recipe differences...
    entity.name = "autocar-"..k
    entity.minable.result = "autocar-"..k
    entity.variants.main[1].picture = "__autocar__/graphics/directives/"..k..".png"
    -- item
    item.name = "autocar-"..k
    item.icon = "__autocar__/graphics/directives/"..k..".png"
    item.subgroup = v.subgroup
    item.place_as_tile.result = "autocar-"..k
    -- recipe
    recipe.name = "autocar-"..k
    recipe.result = "autocar-"..k

    -- ...and insert them all
    data.raw[entity.type][entity.name] = entity
    data.raw[item.type][item.name] = item
    data.raw[recipe.type][recipe.name] = recipe
  end
end

-- correct the idle recipe to take less resources
data.raw["recipe"]["autocar-idle"].ingredients = {
  {"stone", 1}
}]]
