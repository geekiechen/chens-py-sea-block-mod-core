-- Copyright (c) 2025 GeekieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
-- 注册物品
data:extend({ -- 注册污泥
    {
        type = "item",
        name = "sludge",
        icon = "__chens-py-sea-block-mod-core__/graphics/icons/sludge.png",
        subgroup = "raw-resource",
        order = "a",
        stack_size = 100
    }, -- 注册有机废料
    {
        type = "item",
        name = "organic-waste",
        icon = "__chens-py-sea-block-mod-core__/graphics/icons/organic-waste.png",
        subgroup = "raw-resource",
        order = "a",
        stack_size = 100,
        fuel_category = "chemical",
        fuel_value = "1.25MJ"
    }, -- 注册有机燃料
    {
        type = "item",
        name = "organic-fuel",
        icon = "__chens-py-sea-block-mod-core__/graphics/icons/organic-fuel.png",
        subgroup = "raw-resource",
        order = "a",
        stack_size = 100,
        fuel_category = "chemical",
        fuel_value = "5MJ"
    }
})

