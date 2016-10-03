
data:extend(
  {
    { type = "item-group",
      name = "oceanliner",
      icon = "__OceanLiner__/graphics/rail-tanker-icon.png",
      order = "z"
    },

    {
      type = "item-subgroup",
      name = "contents",
      group = "oceanliner",
      order = "a",
    },
  }
)

--entity
require("prototypes.entity.entities")

--items
require("prototypes.item.items")

--recipies
require("prototypes.recipe.recipes")

--tech
require("prototypes.tech.tech")
