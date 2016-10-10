
data:extend(
  {
    {
      type = "item-group",
      name = "ocean-liners",
      icon = "__OceanLiners__/graphics/paddle-steamer-icon.jpg",
      order = "z"
    },

    {
      type = "item-subgroup",
      name = "ocean-liners-maritime",
      group = "ocean-liners",
      order = "z",
    },

    {
    type = "recipe-category",
    name = "ocean-liners-maritime"
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
