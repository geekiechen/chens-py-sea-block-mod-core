-- Copyright (c) 2025 GeekieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
-- 注册科技
data:extend({
    -- 注册基本资源
    {
        type = "technology",
        name = "basic-resources",
        icon = "__chens-py-sea-block-mod-core__/graphics/icons/sludge.png",
        prerequisites = {},
        research_trigger = {type = "craft-item", item = "sludge", count = 10},
        effects = {
            {type = "unlock-recipe", recipe = "early-stone"},
            {type = "unlock-recipe", recipe = "early-iron-ore"},
            {type = "unlock-recipe", recipe = "early-copper-ore"}
        },
        order = "a",
        localised_description = {"technology-description.basic-resources"}
    }
})
