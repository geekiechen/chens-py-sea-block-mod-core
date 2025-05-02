-- Copyright (c) 2025 GeekieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
-- 注册科技
data:extend({
    -- 注册 basic-resources
    {
        type = "technology",
        name = "basic-resources",
        icon = "__chens-py-sea-block-mod-core__/graphics/icons/sludge.png",
        prerequisites = {},
        research_trigger = {type = "craft-item", item = "sludge", count = 50},
        effects = {},
        order = "a",
        localised_description = {"technology-description.basic-resources"}
    }, -- 注册 moss-processing
    {
        type = "technology",
        name = "moss-processing",
        icon = "__pyalienlifegraphics__/graphics/icons/moss.png",
        prerequisites = {},
        research_trigger = {type = "craft-item", item = "seaweed", count = 50},
        effects = {},
        order = "a"
    }, -- 注册 log-processing
    {
        type = "technology",
        name = "log-processing",
        icon = "__pycoalprocessinggraphics__/graphics/icons/mip/log-01.png",
        prerequisites = {},
        research_trigger = {type = "craft-item", item = "moss", count = 50},
        effects = {},
        order = "a"
    }
})
