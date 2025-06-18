local item_sounds = require("__base__.prototypes.item_sounds")
require ("sound-util")
require ("circuit-connector-sprites")
require ("util")

local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local meld = require("meld")
local procession_graphic_catalogue_types = require("__base__/prototypes/planet/procession-graphic-catalogue-types")



data:extend({
  {
    type = "item",
    name = "simple-cottage",
    icon = "__simple-cottage__/graphics/icon.png",

    subgroup = "terrain",
    order = "e[simple-cottage]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "simple-cottage",
    stack_size = 10,
    default_import_location = "nauvis",
    weight = 100 * kg
  },
  {
    type = "recipe",
    name = "simple-cottage",
    energy_required = 1,
    category = "crafting",
    ingredients =
    {
      {type = "item", name = "stone", amount = 40},
      {type = "item", name = "wood", amount = 50},
      {type = "item", name = "concrete", amount = 60},
    },
    results = {{type = "item", name = "simple-cottage", amount = 1}},
    allow_productivity = false,
    enabled = true,
  },
  {
    type = "simple-entity",
    name = "simple-cottage",
    --flags = {"placeable-neutral"},
    icon = "__simple-cottage__/graphics/icon.png",
    subgroup = "grass",
    order = "e[simple-cottage]",
    collision_box = {{-3.0, -3.0}, {3.0, 3.0}},
    selection_box = {{-3.3, -3.3}, {3.3, 3.3}},
    drawing_box_vertical_extension = 1,
    --damaged_trigger_effect = hit_effects.rock(),
    --dying_trigger_effect = decorative_trigger_effects.huge_rock(),
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 1,
      results =
      {
        {type = "item", name = "simple-cottage", amount = 1},
      }
    },
    map_color = {169, 68, 46, 200},
    --count_as_rock_for_filtered_deconstruction = true,
    mined_sound = sounds.deconstruct_bricks(1.0),
    impact_category = "stone",
    render_layer = "object",
    max_health = 70,
    resistances =
    {
      { type = "poison",  percent = 100 },
    },
    picture = {
      layers =
      {
        {
          filename = "__simple-cottage__/graphics/entity.png",
          priority = "extra-high",
          width = 600,
          height = 634,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        },
        {
          filename = "__simple-cottage__/graphics/shadow.png",
          priority = "extra-high",
          width = 600,
          height = 634,
          shift = util.by_pixel(0, 0),
          draw_as_shadow = true,
          scale = 0.5
        },
        {
          filename = "__simple-cottage__/graphics/entity-glow.png",
          priority = "extra-high",
          width = 600,
          height = 634,
          shift = util.by_pixel(0, 0),
          draw_as_glow = true,
          blend_mode = "additive-soft",
          scale = 0.5
        },
        {
          filename = "__simple-cottage__/graphics/entity-light.png",
          priority = "extra-high",
          width = 600,
          height = 634,
          shift = util.by_pixel(0, 0),
          draw_as_light = true,
          --blend_mode = "additive",
          scale = 0.5
        },
      }
    },
  },
})