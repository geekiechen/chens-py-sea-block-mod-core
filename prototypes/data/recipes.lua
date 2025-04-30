-- Copyright (c) 2025 GeekieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
-- 修复模组的问题
-- 修复 chens-modpack-py-auxiliary-others 的问题
if mods["chens-modpack-py-auxiliary-others"] then
    -- 注册配方
    -- evaporator
    if data.raw["recipe-category"]["evaporator"] then
        data:extend({ -- 注册污泥和有机废料
            {
                type = "recipe",
                name = "sludge",
                order = "a",
                category = "evaporator",
                energy_required = 1.75,
                ingredients = {{type = "fluid", name = "water", amount = 200}},
                results = {
                    {
                        type = "item",
                        name = "sludge",
                        amount = 1,
                        probability = 0.9
                    }, {type = "item", name = "organic-waste", amount = 1},
                    {
                        type = "item",
                        name = "organic-waste",
                        amount = 1,
                        probability = 0.65
                    }
                },
                main_product = "sludge",
                enabled = true
            }
        })
    end

    -- hydroclassifier
    if data.raw["recipe-category"]["hydroclassifier"] then
        -- 修复模组的问题
        -- 修复 pyhardmode 的问题
        if mods["pyhardmode"] then
            -- 注册配方
            data:extend({ -- 注册干酪根
                {
                    type = "recipe",
                    name = "early-kerogen",
                    order = "a",
                    category = "hydroclassifier",
                    energy_required = 4,
                    ingredients = {
                        {type = "item", name = "sludge", amount = 1},
                        {type = "fluid", name = "carbolic-oil", amount = 15}
                    },
                    results = {{type = "item", name = "kerogen", amount = 1}},
                    main_product = "kerogen",
                    enabled = false
                }
            })
        else
            -- 注册配方
            data:extend({ -- 注册干酪根
                {
                    type = "recipe",
                    name = "early-kerogen",
                    order = "a",
                    category = "hydroclassifier",
                    energy_required = 4,
                    ingredients = {
                        {type = "item", name = "sludge", amount = 1},
                        {type = "fluid", name = "water", amount = 50}
                    },
                    results = {{type = "item", name = "kerogen", amount = 1}},
                    main_product = "kerogen",
                    enabled = false
                }
            })
        end

        data:extend({ -- 注册铁矿
            {
                type = "recipe",
                name = "early-iron-ore",
                order = "a",
                category = "hydroclassifier",
                energy_required = 4,
                ingredients = {
                    {type = "item", name = "sludge", amount = 1},
                    {type = "fluid", name = "water", amount = 50}
                },
                results = {{type = "item", name = "iron-ore", amount = 1}},
                main_product = "iron-ore",
                enabled = false
            }, -- 注册铜矿
            {
                type = "recipe",
                name = "early-copper-ore",
                order = "a",
                category = "hydroclassifier",
                energy_required = 4,
                ingredients = {
                    {type = "item", name = "sludge", amount = 1},
                    {type = "fluid", name = "water", amount = 50}
                },
                results = {{type = "item", name = "copper-ore", amount = 1}},
                main_product = "copper-ore",
                enabled = false
            }, -- 注册原煤
            {
                type = "recipe",
                name = "early-raw-coal",
                order = "a",
                category = "hydroclassifier",
                energy_required = 4,
                ingredients = {
                    {type = "item", name = "sludge", amount = 1},
                    {type = "fluid", name = "water", amount = 50}
                },
                results = {{type = "item", name = "raw-coal", amount = 1}},
                main_product = "raw-coal",
                enabled = false
            }, -- 注册石矿
            {
                type = "recipe",
                name = "early-stone",
                order = "a",
                category = "hydroclassifier",
                energy_required = 4,
                ingredients = {
                    {type = "item", name = "sludge", amount = 1},
                    {type = "fluid", name = "water", amount = 50}
                },
                results = {{type = "item", name = "stone", amount = 1}},
                main_product = "stone",
                enabled = false
            }
        })
    end

    -- flotation
    if data.raw["recipe-category"]["flotation"] then
        data:extend({ -- 注册铝矿
            {
                type = "recipe",
                name = "early-aluminium-ore",
                order = "a",
                category = "flotation",
                energy_required = 6,
                ingredients = {
                    {type = "item", name = "sludge", amount = 1},
                    {type = "fluid", name = "coal-gas", amount = 50}
                },
                results = {{type = "item", name = "ore-aluminium", amount = 1}},
                main_product = "ore-aluminium",
                enabled = false
            }, -- 注册锡矿
            {
                type = "recipe",
                name = "early-tin-ore",
                order = "a",
                category = "flotation",
                energy_required = 6,
                ingredients = {
                    {type = "item", name = "sludge", amount = 1},
                    {type = "fluid", name = "steam", amount = 50}
                },
                results = {{type = "item", name = "ore-tin", amount = 1}},
                main_product = "ore-tin",
                enabled = false
            }, -- 注册锌矿
            {
                type = "recipe",
                name = "early-zinc-ore",
                order = "a",
                category = "flotation",
                energy_required = 6,
                ingredients = {
                    {type = "item", name = "sludge", amount = 1},
                    {type = "fluid", name = "aromatics", amount = 20}
                },
                results = {{type = "item", name = "ore-zinc", amount = 1}},
                main_product = "ore-zinc",
                enabled = false
            }, -- 注册铅矿
            {
                type = "recipe",
                name = "early-lead-ore",
                order = "a",
                category = "flotation",
                energy_required = 6,
                ingredients = {
                    {type = "item", name = "sludge", amount = 1},
                    {type = "fluid", name = "acetylene", amount = 50}
                },
                results = {{type = "item", name = "ore-lead", amount = 1}},
                main_product = "ore-lead",
                enabled = false
            }, -- 注册钛矿
            {
                type = "recipe",
                name = "early-titanium-ore",
                order = "a",
                category = "flotation",
                energy_required = 6,
                ingredients = {
                    {type = "item", name = "sludge", amount = 1},
                    {type = "fluid", name = "acetylene", amount = 20}
                },
                results = {{type = "item", name = "ore-titanium", amount = 1}},
                main_product = "ore-titanium",
                enabled = false
            }, -- 注册镍矿
            {
                type = "recipe",
                name = "early-nickel-ore",
                order = "a",
                category = "flotation",
                energy_required = 6,
                ingredients = {
                    {type = "item", name = "sludge", amount = 1},
                    {type = "fluid", name = "syngas", amount = 20}
                },
                results = {{type = "item", name = "ore-nickel", amount = 1}},
                main_product = "ore-nickel",
                enabled = false
            }, -- 注册铬矿
            {
                type = "recipe",
                name = "early-chromium-ore",
                order = "a",
                category = "flotation",
                energy_required = 6,
                ingredients = {
                    {type = "item", name = "sludge", amount = 1},
                    {type = "fluid", name = "syngas", amount = 20}
                },
                results = {{type = "item", name = "ore-chromium", amount = 1}},
                main_product = "ore-chromium",
                enabled = false
            }
        })
    end

    -- leaching
    if data.raw["recipe-category"]["leaching"] then
        data:extend({ -- 注册天然硼砂
            {
                type = "recipe",
                name = "early-raw-borax",
                order = "a",
                category = "leaching",
                energy_required = 8,
                ingredients = {
                    {type = "item", name = "sludge", amount = 1},
                    {type = "fluid", name = "syngas", amount = 15}
                },
                results = {{type = "item", name = "raw-borax", amount = 1}},
                main_product = "raw-borax",
                enabled = false
            }, -- 注册石英矿
            {
                type = "recipe",
                name = "early-quartz-ore",
                order = "a",
                category = "leaching",
                energy_required = 8,
                ingredients = {
                    {type = "item", name = "sludge", amount = 1},
                    {type = "fluid", name = "coal-gas", amount = 20}
                },
                results = {{type = "item", name = "ore-quartz", amount = 1}},
                main_product = "ore-quartz",
                enabled = false
            }, -- 注册稀土矿
            {
                type = "recipe",
                name = "early-rare-earth-ore",
                order = "a",
                category = "leaching",
                energy_required = 8,
                ingredients = {
                    {type = "item", name = "sludge", amount = 1},
                    {type = "fluid", name = "naphtha", amount = 50}
                },
                results = {{type = "item", name = "rare-earth-ore", amount = 1}},
                main_product = "rare-earth-ore",
                enabled = false
            }, -- 注册铀矿
            {
                type = "recipe",
                name = "early-uranium-ore",
                order = "a",
                category = "leaching",
                energy_required = 8,
                ingredients = {
                    {type = "item", name = "sludge", amount = 1},
                    {type = "fluid", name = "sulfuric-acid", amount = 40}
                },
                results = {{type = "item", name = "uranium-ore", amount = 1}},
                main_product = "uranium-ore",
                enabled = false
            }, -- 注册锑矿
            {
                type = "recipe",
                name = "early-antimonium-ore",
                order = "a",
                category = "leaching",
                energy_required = 8,
                ingredients = {
                    {type = "item", name = "sludge", amount = 1},
                    {type = "fluid", name = "syngas", amount = 35}
                },
                results = {{type = "item", name = "antimonium-ore", amount = 1}},
                main_product = "antimonium-ore",
                enabled = false
            }, -- 注册铌矿
            {
                type = "recipe",
                name = "early-niobium-ore",
                order = "a",
                category = "leaching",
                energy_required = 8,
                ingredients = {
                    {type = "item", name = "sludge", amount = 1},
                    {type = "fluid", name = "refsyngas", amount = 30}
                },
                results = {{type = "item", name = "niobium-ore", amount = 1}},
                main_product = "niobium-ore",
                enabled = false
            }, -- 注册钼矿
            {
                type = "recipe",
                name = "early-molybdenum-ore",
                order = "a",
                category = "leaching",
                energy_required = 8,
                ingredients = {
                    {type = "item", name = "sludge", amount = 1},
                    {type = "fluid", name = "gasoline", amount = 35}
                },
                results = {{type = "item", name = "molybdenum-ore", amount = 1}},
                main_product = "molybdenum-ore",
                enabled = false
            }
        })
    end

    -- distilator
    if data.raw["recipe-category"]["distilator"] then
        data:extend({ -- 注册有机燃料
            {
                type = "recipe",
                name = "organic-fuel",
                order = "a",
                category = "distilator",
                energy_required = 2,
                ingredients = {
                    {type = "item", name = "organic-waste", amount = 5}
                },
                results = {{type = "item", name = "organic-fuel", amount = 1}},
                main_product = "organic-fuel",
                enabled = false
            }
        })
    end

    -- biofactory
    if data.raw["recipe-category"]["biofactory"] then
        data:extend({ -- 注册原木
            {
                type = "recipe",
                name = "early-log",
                order = "a",
                category = "biofactory",
                energy_required = 20,
                ingredients = {{type = "fluid", name = "water", amount = 200}},
                results = {
                    {type = "item", name = "log", amount = 1},
                    {
                        type = "item",
                        name = "saps",
                        amount = 1,
                        probability = 0.1
                    }
                },
                main_product = "log",
                enabled = false
            }, -- 注册海藻和鱼
            {
                type = "recipe",
                name = "starting-seaweed",
                order = "a",
                category = "biofactory",
                energy_required = 20,
                ingredients = {{type = "fluid", name = "water", amount = 200}},
                results = {
                    {type = "item", name = "seaweed", amount = 1},
                    {
                        type = "item",
                        name = "fish",
                        amount = 1,
                        probability = 0.05
                    }
                },
                main_product = "seaweed",
                enabled = false
            }
        })
    end

    -- nursery
    if data.raw["recipe-category"]["nursery"] then
        data:extend({ -- 注册苔藓
            {
                type = "recipe",
                name = "starting-moss",
                order = "a",
                category = "nursery",
                energy_required = 20,
                ingredients = {
                    {type = "item", name = "seaweed", amount = 1},
                    {type = "item", name = "stone", amount = 5},
                    {type = "fluid", name = "water", amount = 400}
                },
                results = {{type = "item", name = "moss", amount = 3}},
                main_product = "moss",
                enabled = false
            }, -- 注册原生花卉
            {
                type = "recipe",
                name = "starting-native-flora",
                order = "a",
                category = "nursery",
                energy_required = 20,
                ingredients = {
                    {type = "item", name = "seaweed", amount = 1},
                    {type = "item", name = "soil", amount = 5},
                    {type = "fluid", name = "water", amount = 400}
                },
                results = {{type = "item", name = "native-flora", amount = 3}},
                main_product = "native-flora",
                enabled = false
            }
        })
    end
end
