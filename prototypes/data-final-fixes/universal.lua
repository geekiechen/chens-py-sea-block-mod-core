-- Copyright (c) 2025 GeekieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
-- 修复设置的问题
if settings.startup["enable-hard-mode"].value then
    -- 修复模组的问题
    -- 修复 pycoalprocessing 的问题
    if mods["pycoalprocessing"] then
        -- 修复科技的问题
        -- 修复 crusher 的问题
        if data.raw.technology["crusher"] then
            for i = #data.raw.technology["crusher"].effects, 1, -1 do
                local effect = data.raw.technology["crusher"].effects[i]
                if effect.type == "unlock-recipe" and effect.recipe ==
                    "gravel-saline-water" then
                    table.remove(data.raw.technology["crusher"].effects, i)
                    break
                end
            end
        end

        -- 修复 steam-power 的问题
        if data.raw.technology["steam-power"] then
            if data.raw.recipe["washer"] then
                table.insert(data.raw.technology["steam-power"].effects,
                             {type = "unlock-recipe", recipe = "washer"})
            end
        end

        -- 修复 coal-processing-1 的问题
        if data.raw.technology["coal-processing-1"] then
            if data.raw.recipe["early-stone"] then
                table.insert(data.raw.technology["coal-processing-1"].effects,
                             {type = "unlock-recipe", recipe = "early-stone"})
            end

            if data.raw.recipe["pressured-water"] then
                table.insert(data.raw.technology["coal-processing-1"].effects, {
                    type = "unlock-recipe",
                    recipe = "pressured-water"
                })
            end

            if data.raw.recipe["vacuum-pump-mk01"] then
                table.insert(data.raw.technology["coal-processing-1"].effects, {
                    type = "unlock-recipe",
                    recipe = "vacuum-pump-mk01"
                })
            end
        end

        -- 修复配方的问题
        -- 修复 washer 的问题
        if data.raw.recipe["washer"] then
            data.raw.recipe["washer"].ingredients = {
                {type = "item", name = "pipe", amount = 10},
                {type = "item", name = "stone-brick", amount = 10},
                {type = "item", name = "steam-engine", amount = 1},
                {type = "item", name = "iron-plate", amount = 5}
            }
        end
    end

    -- 修复 pyfusionenergy 的问题
    if mods["pyfusionenergy"] then
        -- 修复科技的问题
        -- 修复 fluid-pressurization 的问题
        if data.raw.technology["fluid-pressurization"] then
            for i = #data.raw.technology["fluid-pressurization"].effects, 1, -1 do
                local effect = data.raw.technology["fluid-pressurization"]
                                   .effects[i]
                if effect.type == "unlock-recipe" and
                    (effect.recipe == "vacuum-pump-mk01" or effect.recipe ==
                        "pressured-water") then
                    table.remove(data.raw.technology["fluid-pressurization"]
                                     .effects, i)
                end
            end
        end

        -- 修复配方的问题
        -- 修复 vacuum-pump-mk01 的问题
        if data.raw.recipe["vacuum-pump-mk01"] then
            for i = #data.raw.recipe["vacuum-pump-mk01"].ingredients, 1, -1 do
                local ingredient = data.raw.recipe["vacuum-pump-mk01"]
                                       .ingredients[i]
                if ingredient.name == "steel-plate" then
                    table.remove(
                        data.raw.recipe["vacuum-pump-mk01"].ingredients, i)
                    break
                end
            end
        end
    end

    -- 修复 pyhightech 的问题
    if mods["pyhightech"] then
        -- 修复配方的问题
        -- 修复 gravel-saline-water 的问题
        if data.raw.recipe["gravel-saline-water"] then
            data.raw.recipe["gravel-saline-water"].energy_required = 10
            data.raw.recipe["gravel-saline-water"].ingredients = {
                {type = "item", name = "gravel", amount = 5},
                {type = "fluid", name = "water", amount = 100}
            }
            data.raw.recipe["gravel-saline-water"].results = {
                {type = "fluid", name = "water-saline", amount = 50}
            }
        end
    end

    -- 修复科技的问题
    -- 修复 basic-resources 的问题
    if data.raw.technology["basic-resources"] then
        if data.raw.recipe["gravel-saline-water"] then
            table.insert(data.raw.technology["basic-resources"].effects, {
                type = "unlock-recipe",
                recipe = "gravel-saline-water"
            })
        end

        if data.raw.recipe["gravel-to-stone"] then
            table.insert(data.raw.technology["basic-resources"].effects,
                         {type = "unlock-recipe", recipe = "gravel-to-stone"})
        end

        data.raw.technology["basic-resources"].localised_description = {
            "technology-description.basic-resources-hard-mode"
        }
    end

    -- 修复配方的问题
    -- 修复 early-copper-ore 的问题
    if data.raw.recipe["early-copper-ore"] then
        if data.raw.item["gravel"] then
            table.insert(data.raw.recipe["early-copper-ore"].results, {
                type = "item",
                name = "gravel",
                amount = 1,
                probability = 0.3
            })
        end

        data.raw.recipe["early-copper-ore"].ingredients = {
            {type = "item", name = "sludge", amount = 1},
            {type = "fluid", name = "water-saline", amount = 15}
        }
    end

    -- 修复 early-iron-ore 的问题
    if data.raw.recipe["early-iron-ore"] then
        if data.raw.item["gravel"] then
            table.insert(data.raw.recipe["early-iron-ore"].results, {
                type = "item",
                name = "gravel",
                amount = 1,
                probability = 0.3
            })
        end
    end

    -- 修复 early-stone 的问题
    if data.raw.recipe["early-stone"] then
        data.raw.recipe["early-stone"].ingredients = {
            {type = "item", name = "sludge", amount = 1},
            {type = "fluid", name = "carbolic-oil", amount = 15}
        }
    end

    -- 修复 early-raw-coal 的问题
    if data.raw.recipe["early-raw-coal"] then
        for i = #data.raw.recipe["early-raw-coal"].ingredients, 1, -1 do
            local ingredient = data.raw.recipe["early-raw-coal"].ingredients[i]
            if ingredient.name == "water" then
                ingredient.name = "pressured-water"
            end
        end
    end
else
    -- 修复科技的问题
    -- 修复 basic-resources 的问题
    if data.raw.technology["basic-resources"] then
        if data.raw.recipe["early-stone"] then
            table.insert(data.raw.technology["basic-resources"].effects,
                         {type = "unlock-recipe", recipe = "early-stone"})
        end
    end

    -- 修复 moss-processing 的问题
    if data.raw.technology["moss-processing"] then
        if data.raw.recipe["washer"] then
            table.insert(data.raw.technology["moss-processing"].effects,
                         {type = "unlock-recipe", recipe = "washer"})
        end
    end
end

-- 修复模组的问题
-- 修复 pyalienlife 的问题
if mods["pyalienlife"] then
    -- 修复实体的问题
    -- 修复 fwf-mk01 的问题
    if data.raw["assembling-machine"]["fwf-mk01"] then
        data.raw["assembling-machine"]["fwf-mk01"].energy_source = {
            type = "burner",
            fuel_categories = {"chemical"},
            fuel_inventory_size = 1,
            burnt_inventory_size = 1,
            burnt_result = "ash"
        }
    end

    -- 修复 moss-farm-mk01 的问题
    if data.raw["assembling-machine"]["moss-farm-mk01"] then
        data.raw["assembling-machine"]["moss-farm-mk01"].energy_source = {
            type = "burner",
            fuel_categories = {"chemical"},
            fuel_inventory_size = 1,
            burnt_inventory_size = 1,
            burnt_result = "ash"
        }
    end

    -- 修复 botanical-nursery 的问题
    if data.raw["assembling-machine"]["botanical-nursery"] then
        data.raw["assembling-machine"]["botanical-nursery"].energy_source = {
            type = "burner",
            fuel_categories = {"chemical"},
            fuel_inventory_size = 1,
            burnt_inventory_size = 1,
            burnt_result = "ash"
        }
    end

    -- 修复 biofactory-mk01 的问题
    if data.raw["assembling-machine"]["biofactory-mk01"] then
        data.raw["assembling-machine"]["biofactory-mk01"].crafting_speed = 2
    end

    -- 修复 biofactory-mk02 的问题
    if data.raw["assembling-machine"]["biofactory-mk02"] then
        data.raw["assembling-machine"]["biofactory-mk02"].crafting_speed = 3
    end

    -- 修复 biofactory-mk03 的问题
    if data.raw["assembling-machine"]["biofactory-mk03"] then
        data.raw["assembling-machine"]["biofactory-mk03"].crafting_speed = 4
    end

    -- 修复 biofactory-mk04 的问题
    if data.raw["assembling-machine"]["biofactory-mk04"] then
        data.raw["assembling-machine"]["biofactory-mk04"].crafting_speed = 5
    end

    -- 修复科技的问题
    -- 修复 botany-mk01 的问题
    if data.raw.technology["botany-mk01"] then
        for i = #data.raw.technology["botany-mk01"].effects, 1, -1 do
            local effect = data.raw.technology["botany-mk01"].effects[i]
            if effect.type == "unlock-recipe" and effect.recipe ==
                "botanical-nursery" then
                table.remove(data.raw.technology["botany-mk01"].effects, i)
                break
            end
        end
    end

    -- 修复 wood-processing 的问题
    if data.raw.technology["wood-processing"] then
        for i = #data.raw.technology["wood-processing"].effects, 1, -1 do
            local effect = data.raw.technology["wood-processing"].effects[i]
            if effect.type == "unlock-recipe" and
                (effect.recipe == "fwf-mk01" or effect.recipe == "log1" or
                    effect.recipe == "wood-seeds" or effect.recipe ==
                    "wood-seedling" or effect.recipe == "tree") then
                table.remove(data.raw.technology["wood-processing"].effects, i)
            end
        end
    end

    -- 修复 mining-with-fluid 的问题
    if data.raw.technology["mining-with-fluid"] then
        if data.raw.recipe["early-aluminium-ore"] then
            table.insert(data.raw.technology["mining-with-fluid"].effects, {
                type = "unlock-recipe",
                recipe = "early-aluminium-ore"
            })
        end

        if data.raw.recipe["early-tin-ore"] then
            table.insert(data.raw.technology["mining-with-fluid"].effects,
                         {type = "unlock-recipe", recipe = "early-tin-ore"})
        end

        if data.raw.recipe["flotation-cell-mk00"] then
            table.insert(data.raw.technology["mining-with-fluid"].effects, {
                type = "unlock-recipe",
                recipe = "flotation-cell-mk00"
            })
        end
    end

    -- 修复 glass 的问题
    if data.raw.technology["glass"] then
        if data.raw.recipe["leaching-station-mk00"] then
            table.insert(data.raw.technology["glass"].effects, {
                type = "unlock-recipe",
                recipe = "leaching-station-mk00"
            })
        end

        if data.raw.recipe["early-quartz-ore"] then
            table.insert(data.raw.technology["glass"].effects,
                         {type = "unlock-recipe", recipe = "early-quartz-ore"})
        end
    end

    -- 修复 log-processing 的问题
    if data.raw.technology["log-processing"] then
        if data.raw.recipe["empty-planter-box"] then
            table.insert(data.raw.technology["log-processing"].effects,
                         {type = "unlock-recipe", recipe = "empty-planter-box"})
        end

        if data.raw.recipe["planter-box"] then
            table.insert(data.raw.technology["log-processing"].effects,
                         {type = "unlock-recipe", recipe = "planter-box"})
        end

        if data.raw.recipe["fwf-mk01"] then
            table.insert(data.raw.technology["log-processing"].effects,
                         {type = "unlock-recipe", recipe = "fwf-mk01"})
        end

        if data.raw.recipe["tree"] then
            table.insert(data.raw.technology["log-processing"].effects,
                         {type = "unlock-recipe", recipe = "tree"})
        end

        if data.raw.recipe["wood-seeds"] then
            table.insert(data.raw.technology["log-processing"].effects,
                         {type = "unlock-recipe", recipe = "wood-seeds"})
        end

        if data.raw.recipe["wood-seedling"] then
            table.insert(data.raw.technology["log-processing"].effects,
                         {type = "unlock-recipe", recipe = "wood-seedling"})
        end

        if data.raw.recipe["log1"] then
            table.insert(data.raw.technology["log-processing"].effects,
                         {type = "unlock-recipe", recipe = "log1"})
        end
    end

    -- 修复 seaweed-mk01 的问题
    if data.raw.technology["seaweed-mk01"] then
        if data.raw.recipe["early-seaweed"] then
            table.insert(data.raw.technology["seaweed-mk01"].effects,
                         {type = "unlock-recipe", recipe = "early-seaweed"})
        end
    end

    -- 修复 moss-mk01 的问题
    if data.raw.technology["moss-mk01"] then
        for i = #data.raw.technology["moss-mk01"].effects, 1, -1 do
            local effect = data.raw.technology["moss-mk01"].effects[i]
            if effect.type == "unlock-recipe" and
                (effect.recipe == "Moss-1" or effect.recipe == "moss-farm-mk01") then
                table.remove(data.raw.technology["moss-mk01"].effects, i)
            end
        end
    end

    -- 修复 sap-mk01 的问题
    if data.raw.technology["sap-mk01"] then
        if data.raw.recipe["early-saps"] then
            table.insert(data.raw.technology["sap-mk01"].effects,
                         {type = "unlock-recipe", recipe = "early-saps"})
        end
    end

    -- 修复 soil-washing 的问题
    if data.raw.technology["soil-washing"] then
        for i = #data.raw.technology["soil-washing"].effects, 1, -1 do
            local effect = data.raw.technology["soil-washing"].effects[i]
            if effect.type == "unlock-recipe" and
                (effect.recipe == "muddy-sludge" or effect.recipe == "washer") then
                table.remove(data.raw.technology["soil-washing"].effects, i)
            end
        end
    end

    -- 修复配方的问题
    -- 修复 biofactory-mk01 的问题
    if data.raw.recipe["biofactory-mk01"] then
        if data.raw.item["biofactory-mk00"] then
            table.insert(data.raw.recipe["biofactory-mk01"].ingredients,
                         {type = "item", name = "biofactory-mk00", amount = 1})
        end
    end

    -- 修复 fwf-mk01 的问题
    if data.raw.recipe["fwf-mk01"] then
        for i = #data.raw.recipe["fwf-mk01"].ingredients, 1, -1 do
            local ingredient = data.raw.recipe["fwf-mk01"].ingredients[i]
            if ingredient.name == "steel-plate" then
                table.remove(data.raw.recipe["fwf-mk01"].ingredients, i)
                break
            end
        end
    end

    -- 修复 moss-farm-mk01 的问题
    if data.raw.recipe["moss-farm-mk01"] then
        for i = #data.raw.recipe["moss-farm-mk01"].ingredients, 1, -1 do
            local ingredient = data.raw.recipe["moss-farm-mk01"].ingredients[i]
            if ingredient.name == "aluminium-plate" then
                table.remove(data.raw.recipe["moss-farm-mk01"].ingredients, i)
                break
            end
        end
    end
end

-- 修复 pyalternativeenergy 的问题
if mods["pyalternativeenergy"] then
    -- 修复科技的问题
    -- 修复 uranium-processing 的问题
    if data.raw.technology["uranium-processing"] then
        if data.raw.recipe["early-uranium-ore"] then
            table.insert(data.raw.technology["uranium-processing"].effects,
                         {type = "unlock-recipe", recipe = "early-uranium-ore"})
        end
    end

    -- 修复 antimony-mk01 的问题
    if data.raw.technology["antimony-mk01"] then
        if data.raw.recipe["early-antimonium-ore"] then
            table.insert(data.raw.technology["antimony-mk01"].effects, {
                type = "unlock-recipe",
                recipe = "early-antimonium-ore"
            })
        end
    end

    -- 修复配方的问题
    -- 修复 stone-brick 的问题
    if data.raw.recipe["stone-brick"] then
        data.raw.recipe["stone-brick"].enabled = false
    end
end

-- 修复 pypetroleumhandling 的问题
if mods["pypetroleumhandling"] then
    -- 修复科技的问题
    -- 修复 kerogen 的问题
    if data.raw.technology["kerogen"] then
        if data.raw.recipe["early-kerogen"] then
            table.insert(data.raw.technology["kerogen"].effects,
                         {type = "unlock-recipe", recipe = "early-kerogen"})
        end
    end

    -- 修复配方的问题
    -- 修复 bolts 的问题
    if data.raw.recipe["bolts"] then data.raw.recipe["bolts"].enabled = false end

    -- 修复 small-parts-01 的问题
    if data.raw.recipe["small-parts-01"] then
        data.raw.recipe["small-parts-01"].enabled = false
    end

    -- 修复 burner-mining-drill 的问题
    if data.raw.recipe["burner-mining-drill"] then
        data.raw.recipe["burner-mining-drill"].enabled = false
    end
end

-- 修复 pyrawores 的问题
if mods["pyrawores"] then
    -- 修复实体的问题
    -- 修复 flotation-cell-mk01 的问题
    if data.raw["assembling-machine"]["flotation-cell-mk01"] then
        data.raw["assembling-machine"]["flotation-cell-mk01"].crafting_speed = 2
    end

    -- 修复 flotation-cell-mk02 的问题
    if data.raw["assembling-machine"]["flotation-cell-mk02"] then
        data.raw["assembling-machine"]["flotation-cell-mk02"].crafting_speed = 3
    end

    -- 修复 flotation-cell-mk03 的问题
    if data.raw["assembling-machine"]["flotation-cell-mk03"] then
        data.raw["assembling-machine"]["flotation-cell-mk03"].crafting_speed = 4
    end

    -- 修复 flotation-cell-mk04 的问题
    if data.raw["assembling-machine"]["flotation-cell-mk04"] then
        data.raw["assembling-machine"]["flotation-cell-mk04"].crafting_speed = 5
    end

    -- 修复 hydroclassifier-mk01 的问题
    if data.raw["assembling-machine"]["hydroclassifier-mk01"] then
        data.raw["assembling-machine"]["hydroclassifier-mk01"].crafting_speed =
            2
    end

    -- 修复 hydroclassifier-mk02 的问题
    if data.raw["assembling-machine"]["hydroclassifier-mk02"] then
        data.raw["assembling-machine"]["hydroclassifier-mk02"].crafting_speed =
            3
    end

    -- 修复 hydroclassifier-mk03 的问题
    if data.raw["assembling-machine"]["hydroclassifier-mk03"] then
        data.raw["assembling-machine"]["hydroclassifier-mk03"].crafting_speed =
            4
    end

    -- 修复 hydroclassifier-mk04 的问题
    if data.raw["assembling-machine"]["hydroclassifier-mk04"] then
        data.raw["assembling-machine"]["hydroclassifier-mk04"].crafting_speed =
            5
    end

    -- 修复 leaching-station-mk01 的问题
    if data.raw["assembling-machine"]["leaching-station-mk01"] then
        data.raw["assembling-machine"]["leaching-station-mk01"].crafting_speed =
            2
    end

    -- 修复 leaching-station-mk02 的问题
    if data.raw["assembling-machine"]["leaching-station-mk02"] then
        data.raw["assembling-machine"]["leaching-station-mk02"].crafting_speed =
            3
    end

    -- 修复 leaching-station-mk03 的问题
    if data.raw["assembling-machine"]["leaching-station-mk03"] then
        data.raw["assembling-machine"]["leaching-station-mk03"].crafting_speed =
            4
    end

    -- 修复 leaching-station-mk04 的问题
    if data.raw["assembling-machine"]["leaching-station-mk04"] then
        data.raw["assembling-machine"]["leaching-station-mk04"].crafting_speed =
            5
    end

    -- 修复科技的问题
    -- 修复 solder-mk01 的问题
    if data.raw.technology["solder-mk01"] then
        if data.raw.recipe["early-lead-ore"] then
            table.insert(data.raw.technology["solder-mk01"].effects,
                         {type = "unlock-recipe", recipe = "early-lead-ore"})
        end
    end

    -- 修复 nexelit-mk01 的问题
    if data.raw.technology["nexelit-mk01"] then
        if data.raw.recipe["early-nexelit-ore"] then
            table.insert(data.raw.technology["nexelit-mk01"].effects,
                         {type = "unlock-recipe", recipe = "early-nexelit-ore"})
        end
    end

    -- 修复 chromium-mk01 的问题
    if data.raw.technology["chromium-mk01"] then
        if data.raw.recipe["early-chromium-ore"] then
            table.insert(data.raw.technology["chromium-mk01"].effects, {
                type = "unlock-recipe",
                recipe = "early-chromium-ore"
            })
        end
    end

    -- 修复 alloys-mk01 的问题
    if data.raw.technology["alloys-mk01"] then
        if data.raw.recipe["early-titanium-ore"] then
            table.insert(data.raw.technology["alloys-mk01"].effects, {
                type = "unlock-recipe",
                recipe = "early-titanium-ore"
            })
        end
    end

    -- 修复 nickel-mk01 的问题
    if data.raw.technology["nickel-mk01"] then
        if data.raw.recipe["early-nickel-ore"] then
            table.insert(data.raw.technology["nickel-mk01"].effects,
                         {type = "unlock-recipe", recipe = "early-nickel-ore"})
        end
    end

    -- 修复 machines-mk02 的问题
    if data.raw.technology["machines-mk02"] then
        for i = #data.raw.technology["machines-mk02"].effects, 1, -1 do
            local effect = data.raw.technology["machines-mk02"].effects[i]
            if effect.type == "unlock-recipe" and effect.recipe ==
                "leaching-station-mk01" then
                table.remove(data.raw.technology["machines-mk02"].effects, i)
                break
            end
        end
    end

    -- 修复 machines-mk01 的问题
    if data.raw.technology["machines-mk01"] then
        if data.raw.recipe["leaching-station-mk01"] then
            table.insert(data.raw.technology["machines-mk01"].effects, {
                type = "unlock-recipe",
                recipe = "leaching-station-mk01"
            })
        end
    end

    -- 修复配方的问题
    -- 修复 iron-plate 的问题
    if data.raw.recipe["iron-plate"] then
        data.raw.recipe["iron-plate"].enabled = false
    end

    -- 修复 copper-plate 的问题
    if data.raw.recipe["copper-plate"] then
        data.raw.recipe["copper-plate"].enabled = false
    end

    -- 修复 flotation-cell-mk01 的问题
    if data.raw.recipe["flotation-cell-mk01"] then
        if data.raw.item["flotation-cell-mk00"] then
            table.insert(data.raw.recipe["flotation-cell-mk01"].ingredients, {
                type = "item",
                name = "flotation-cell-mk00",
                amount = 1
            })
        end
    end

    -- 修复 leaching-station-mk01 的问题
    if data.raw.recipe["leaching-station-mk01"] then
        if data.raw.item["leaching-station-mk00"] then
            table.insert(data.raw.recipe["leaching-station-mk01"].ingredients, {
                type = "item",
                name = "leaching-station-mk00",
                amount = 1
            })
        end
    end

    -- 修复 hydroclassifier-mk01 的问题
    if data.raw.recipe["hydroclassifier-mk01"] then
        for i, ingredient in pairs(data.raw.recipe["hydroclassifier-mk01"]
                                       .ingredients) do
            if ingredient.name == "flotation-cell-mk01" then
                data.raw.recipe["hydroclassifier-mk01"].ingredients[i] = {
                    type = "item",
                    name = "hydroclassifier-mk00",
                    amount = ingredient.amount
                }
            end
        end
    end
end

-- 修复 pycoalprocessing 的问题
if mods["pycoalprocessing"] then
    -- 修复实体的问题
    -- 修复 distilator 的问题
    if data.raw["assembling-machine"]["distilator"] then
        data.raw["assembling-machine"]["distilator"].energy_source = {
            type = "burner",
            fuel_categories = {"chemical"},
            fuel_inventory_size = 1,
            burnt_inventory_size = 1,
            burnt_result = "ash"
        }
    end

    -- 修复 soil-extractor-mk01 的问题
    if data.raw["assembling-machine"]["soil-extractor-mk01"] then
        data.raw["assembling-machine"]["soil-extractor-mk01"].energy_source = {
            type = "burner",
            fuel_categories = {"chemical"},
            fuel_inventory_size = 1,
            burnt_inventory_size = 1,
            burnt_result = "ash"
        }
    end

    -- 修复 washer 的问题
    if data.raw["assembling-machine"]["washer"] then
        data.raw["assembling-machine"]["washer"].energy_source = {
            type = "burner",
            fuel_categories = {"chemical"},
            fuel_inventory_size = 1,
            burnt_inventory_size = 1,
            burnt_result = "ash"
        }
    end

    -- 修复 evaporator 的问题
    if data.raw["assembling-machine"]["evaporator"] then
        data.raw["assembling-machine"]["evaporator"].crafting_speed = 2
    end

    -- 修复 evaporator-mk02 的问题
    if data.raw["assembling-machine"]["evaporator-mk02"] then
        data.raw["assembling-machine"]["evaporator-mk02"].crafting_speed = 3
    end

    -- 修复 evaporator-mk03 的问题
    if data.raw["assembling-machine"]["evaporator-mk03"] then
        data.raw["assembling-machine"]["evaporator-mk03"].crafting_speed = 4
    end

    -- 修复 evaporator-mk04 的问题
    if data.raw["assembling-machine"]["evaporator-mk04"] then
        data.raw["assembling-machine"]["evaporator-mk04"].crafting_speed = 5
    end

    -- 修复科技的问题
    -- 修复 automation-science-pack 的问题
    if data.raw.technology["automation-science-pack"] then
        for i = #data.raw.technology["automation-science-pack"].effects, 1, -1 do
            local effect = data.raw.technology["automation-science-pack"]
                               .effects[i]
            if effect.type == "unlock-recipe" and
                (effect.recipe == "planter-box" or effect.recipe ==
                    "empty-planter-box" or effect.recipe == "soil" or
                    effect.recipe == "soil-extractor-mk01") then
                table.remove(data.raw.technology["automation-science-pack"]
                                 .effects, i)
            end
        end

        if data.raw.recipe["early-native-flora"] then
            table.insert(data.raw.technology["automation-science-pack"].effects,
                         {type = "unlock-recipe", recipe = "early-native-flora"})
        end

        if data.raw.recipe["burner-inserter"] then
            table.insert(data.raw.technology["automation-science-pack"].effects,
                         {type = "unlock-recipe", recipe = "burner-inserter"})
        end

        if data.raw.recipe["wooden-chest"] then
            table.insert(data.raw.technology["automation-science-pack"].effects,
                         {type = "unlock-recipe", recipe = "wooden-chest"})
        end

        if data.raw.recipe["small-electric-pole"] then
            table.insert(data.raw.technology["automation-science-pack"].effects,
                         {
                type = "unlock-recipe",
                recipe = "small-electric-pole"
            })
        end

        data.raw.technology["automation-science-pack"].research_trigger = {
            type = "craft-item",
            item = "log",
            count = 50
        }
        data.raw.technology["automation-science-pack"].prerequisites = {
            "log-processing"
        }
    end

    -- 修复 coal-processing-1 的问题
    if data.raw.technology["coal-processing-1"] then
        if data.raw.recipe["early-raw-coal"] then
            table.insert(data.raw.technology["coal-processing-1"].effects,
                         {type = "unlock-recipe", recipe = "early-raw-coal"})
        end

        if data.raw.recipe["organic-fuel"] then
            table.insert(data.raw.technology["coal-processing-1"].effects,
                         {type = "unlock-recipe", recipe = "organic-fuel"})
        end
    end

    -- 修复 steam-power 的问题
    if data.raw.technology["steam-power"] then
        for i = #data.raw.technology["steam-power"].effects, 1, -1 do
            local effect = data.raw.technology["steam-power"].effects[i]
            if effect.type == "unlock-recipe" and
                (effect.recipe == "inductor1-2" or effect.recipe == "pipe" or
                    effect.recipe == "pipe-to-ground") then
                table.remove(data.raw.technology["steam-power"].effects, i)
            end
        end

        if data.raw.recipe["biofactory-mk00"] then
            table.insert(data.raw.technology["steam-power"].effects,
                         {type = "unlock-recipe", recipe = "biofactory-mk00"})
        end

        if data.raw.recipe["hydroclassifier-mk00"] then
            table.insert(data.raw.technology["steam-power"].effects, {
                type = "unlock-recipe",
                recipe = "hydroclassifier-mk00"
            })
        end

        if data.raw.recipe["evaporator-mk00"] then
            table.insert(data.raw.technology["steam-power"].effects,
                         {type = "unlock-recipe", recipe = "evaporator-mk00"})
        end

        data.raw.technology["steam-power"].prerequisites = {"basic-resources"}
    end

    -- 修复 niobium 的问题
    if data.raw.technology["niobium"] then
        if data.raw.recipe["early-niobium-ore"] then
            table.insert(data.raw.technology["niobium"].effects,
                         {type = "unlock-recipe", recipe = "early-niobium-ore"})
        end
    end

    -- 修复 moss-processing 的问题
    if data.raw.technology["moss-processing"] then
        if data.raw.recipe["soil"] then
            table.insert(data.raw.technology["moss-processing"].effects,
                         {type = "unlock-recipe", recipe = "soil"})
        end

        if data.raw.recipe["burner-mining-drill"] then
            table.insert(data.raw.technology["moss-processing"].effects, {
                type = "unlock-recipe",
                recipe = "burner-mining-drill"
            })
        end

        if data.raw.recipe["soil-extractor-mk01"] then
            table.insert(data.raw.technology["moss-processing"].effects, {
                type = "unlock-recipe",
                recipe = "soil-extractor-mk01"
            })
        end
    end

    -- 修复 steel-processing 的问题
    if data.raw.technology["steel-processing"] then
        if data.raw.recipe["early-fish"] then
            table.insert(data.raw.technology["steel-processing"].effects,
                         {type = "unlock-recipe", recipe = "early-fish"})
        end
    end

    -- 修复配方的问题
    -- 修复 log-wood 的问题
    if data.raw.recipe["log-wood"] then
        data.raw.recipe["log-wood"].enabled = false
    end

    -- 修复 copper-cable 的问题
    if data.raw.recipe["copper-cable"] then
        data.raw.recipe["copper-cable"].enabled = false
    end

    -- 修复 burner-inserter 的问题
    if data.raw.recipe["burner-inserter"] then
        data.raw.recipe["burner-inserter"].enabled = false
    end

    -- 修复 botanical-nursery 的问题
    if data.raw.recipe["botanical-nursery"] then
        for i = #data.raw.recipe["botanical-nursery"].ingredients, 1, -1 do
            local ingredient =
                data.raw.recipe["botanical-nursery"].ingredients[i]
            local name = ingredient[1] or ingredient.name
            if name == "glass" or name == "fluid-drill-mk01" or name ==
                "soil-extractor-mk01" then
                table.remove(data.raw.recipe["botanical-nursery"].ingredients, i)
            end
        end
    end

    -- 修复 evaporator 的问题
    if data.raw.recipe["evaporator"] then
        if data.raw.item["evaporator-mk00"] then
            table.insert(data.raw.recipe["evaporator"].ingredients,
                         {type = "item", name = "evaporator-mk00", amount = 1})
        end
    end
end

-- 修复 pyindustry 的问题
if mods["pyindustry"] then
    -- 修复配方的问题
    -- 修复 stone-furnace 的问题
    if data.raw.recipe["stone-furnace"] then
        data.raw.recipe["stone-furnace"].enabled = false
    end

    -- 修复 pipe 的问题
    if data.raw.recipe["pipe"] then data.raw.recipe["pipe"].enabled = false end

    -- 修复 pipe-to-ground 的问题
    if data.raw.recipe["pipe-to-ground"] then
        data.raw.recipe["pipe-to-ground"].enabled = false
    end

    -- 修复 iron-gear-wheel 的问题
    if data.raw.recipe["iron-gear-wheel"] then
        data.raw.recipe["iron-gear-wheel"].enabled = false
    end

    -- 修复 iron-stick 的问题
    if data.raw.recipe["iron-stick"] then
        data.raw.recipe["iron-stick"].enabled = false
    end
end

-- 修复 pyhightech 的问题
if mods["pyhightech"] then
    -- 修复科技的问题
    -- 修复 rare-earth-tech 的问题
    if data.raw.technology["rare-earth-tech"] then
        if data.raw.recipe["early-rare-earth-ore"] then
            table.insert(data.raw.technology["rare-earth-tech"].effects, {
                type = "unlock-recipe",
                recipe = "early-rare-earth-ore"
            })
        end
    end

    -- 修复 electronics 的问题
    if data.raw.recipe["early-zinc-ore"] then
        table.insert(data.raw.technology["electronics"].effects,
                     {type = "unlock-recipe", recipe = "early-zinc-ore"})
    end
end

-- 修复 pyfusionenergy 的问题
if mods["pyfusionenergy"] then
    -- 修复科技的问题
    -- 修复 boron 的问题
    if data.raw.technology["boron"] then
        if data.raw.recipe["early-raw-borax"] then
            table.insert(data.raw.technology["boron"].effects,
                         {type = "unlock-recipe", recipe = "early-raw-borax"})
        end
    end

    -- 修复 molybdenum-processing 的问题
    if data.raw.technology["molybdenum-processing"] then
        if data.raw.recipe["early-molybdenum-ore"] then
            table.insert(data.raw.technology["molybdenum-processing"].effects, {
                type = "unlock-recipe",
                recipe = "early-molybdenum-ore"
            })
        end
    end
end

-- 修复 wood-logistics 的问题
if mods["wood-logistics"] then
    -- 修复科技的问题
    -- 修复 automation-science-pack 的问题
    if data.raw.technology["automation-science-pack"] then
        if data.raw.recipe["wood-transport-belt"] then
            table.insert(data.raw.technology["automation-science-pack"].effects,
                         {
                type = "unlock-recipe",
                recipe = "wood-transport-belt"
            })
        end

        if data.raw.recipe["lumber"] then
            table.insert(data.raw.technology["automation-science-pack"].effects,
                         {type = "unlock-recipe", recipe = "lumber"})
        end
    end

    -- 修复配方的问题
    -- 修复 wooden-chest 的问题
    if data.raw.recipe["wooden-chest"] then
        data.raw.recipe["wooden-chest"].enabled = false
    end

    -- 修复 lumber 的问题
    if data.raw.recipe["lumber"] then
        data.raw.recipe["lumber"].enabled = false
    end

    -- 修复 wood-transport-belt 的问题
    if data.raw.recipe["wood-transport-belt"] then
        data.raw.recipe["wood-transport-belt"].enabled = false
    end
end

-- 修复 bobtech 的问题
if mods["bobtech"] then
    -- 修复模组的问题
    -- 修复 aai-industry 的问题
    if not mods["aai-industry"] then
        -- 修复科技的问题
        -- 修复 steam-power 的问题
        if data.raw.technology["steam-power"] then
            if data.raw.recipe["steam-engine"] then
                table.insert(data.raw.technology["steam-power"].effects,
                             {type = "unlock-recipe", recipe = "steam-engine"})
            end
        end
    end

    -- 修复科技的问题
    -- 修复 bob-electricity 的问题
    if data.raw.technology["bob-electricity"] then
        for i = #data.raw.technology["bob-electricity"].effects, 1, -1 do
            local effect = data.raw.technology["bob-electricity"].effects[i]
            if effect.type == "unlock-recipe" then
                table.remove(data.raw.technology["bob-electricity"].effects, i)
            end
        end

        if next(data.raw.technology["bob-electricity"].effects or {}) == nil then
            for _, tech in pairs(data.raw.technology) do
                if tech.prerequisites and
                    table.contains(tech.prerequisites, "bob-electricity") then
                    for i, prerequisite in ipairs(tech.prerequisites) do
                        if prerequisite == "bob-electricity" then
                            table.remove(tech.prerequisites, i)
                            break
                        end
                    end

                    for _, prerequisite in ipairs(
                                               data.raw.technology["bob-electricity"]
                                                   .prerequisites or {}) do
                        if not table.contains(tech.prerequisites, prerequisite) then
                            if data.raw.technology[prerequisite] then
                                table.insert(tech.prerequisites, prerequisite)
                            end
                        end
                    end
                end
            end

            data.raw.technology["bob-electricity"] = nil
        end
    end

    -- 修复 bob-steam-engine-1 的问题
    if data.raw.technology["bob-steam-engine-1"] then
        for i = #data.raw.technology["bob-steam-engine-1"].effects, 1, -1 do
            local effect = data.raw.technology["bob-steam-engine-1"].effects[i]
            if effect.type == "unlock-recipe" then
                table.remove(data.raw.technology["bob-steam-engine-1"].effects,
                             i)
            end
        end

        if next(data.raw.technology["bob-steam-engine-1"].effects or {}) == nil then
            for _, tech in pairs(data.raw.technology) do
                if tech.prerequisites and
                    table.contains(tech.prerequisites, "bob-steam-engine-1") then
                    for i, prerequisite in ipairs(tech.prerequisites) do
                        if prerequisite == "bob-steam-engine-1" then
                            table.remove(tech.prerequisites, i)
                            break
                        end
                    end

                    for _, prerequisite in ipairs(
                                               data.raw.technology["bob-steam-engine-1"]
                                                   .prerequisites or {}) do
                        if not table.contains(tech.prerequisites, prerequisite) then
                            if data.raw.technology[prerequisite] then
                                table.insert(tech.prerequisites, prerequisite)
                            end
                        end
                    end
                end
            end

            data.raw.technology["bob-steam-engine-1"] = nil
        end
    end

    -- 修复 automation-science-pack 的问题
    if data.raw.technology["automation-science-pack"] then
        if data.raw.recipe["bob-burner-generator"] then
            table.insert(data.raw.technology["automation-science-pack"].effects,
                         {
                type = "unlock-recipe",
                recipe = "bob-burner-generator"
            })
        end

        if data.raw.recipe["bob-burner-lab"] then
            table.insert(data.raw.technology["automation-science-pack"].effects,
                         {type = "unlock-recipe", recipe = "bob-burner-lab"})
        end
    end

    -- 修复配方的问题
    -- 修复 bob-burner-lab 的问题
    if data.raw.recipe["bob-burner-lab"] then
        data.raw.recipe["bob-burner-lab"].enabled = false
    end
end

-- 修复 aai-industry 的问题
if mods["aai-industry"] then
    -- 修复科技的问题
    -- 修复 basic-wood-logistics 的问题
    if data.raw.technology["basic-wood-logistics"] then
        for i = #data.raw.technology["basic-wood-logistics"].effects, 1, -1 do
            local effect =
                data.raw.technology["basic-wood-logistics"].effects[i]
            if effect.type == "unlock-recipe" then
                table.remove(
                    data.raw.technology["basic-wood-logistics"].effects, i)
            end
        end

        if next(data.raw.technology["basic-wood-logistics"].effects or {}) ==
            nil then
            for _, tech in pairs(data.raw.technology) do
                if tech.prerequisites and
                    table.contains(tech.prerequisites, "basic-wood-logistics") then
                    for i, prerequisite in ipairs(tech.prerequisites) do
                        if prerequisite == "basic-wood-logistics" then
                            table.remove(tech.prerequisites, i)
                            break
                        end
                    end

                    for _, prerequisite in ipairs(
                                               data.raw.technology["basic-wood-logistics"]
                                                   .prerequisites or {}) do
                        if not table.contains(tech.prerequisites, prerequisite) then
                            if data.raw.technology[prerequisite] then
                                table.insert(tech.prerequisites, prerequisite)
                            end
                        end
                    end
                end
            end

            data.raw.technology["basic-wood-logistics"] = nil
        end
    end

    -- 修复 burner-mechanics 的问题
    if data.raw.technology["burner-mechanics"] then
        for i = #data.raw.technology["burner-mechanics"].effects, 1, -1 do
            local effect = data.raw.technology["burner-mechanics"].effects[i]
            if effect.type == "unlock-recipe" then
                table.remove(data.raw.technology["burner-mechanics"].effects, i)
            end
        end

        if next(data.raw.technology["burner-mechanics"].effects or {}) == nil then
            for _, tech in pairs(data.raw.technology) do
                if tech.prerequisites and
                    table.contains(tech.prerequisites, "burner-mechanics") then
                    for i, prerequisite in ipairs(tech.prerequisites) do
                        if prerequisite == "burner-mechanics" then
                            table.remove(tech.prerequisites, i)
                            break
                        end
                    end

                    for _, prerequisite in ipairs(
                                               data.raw.technology["burner-mechanics"]
                                                   .prerequisites or {}) do
                        if not table.contains(tech.prerequisites, prerequisite) then
                            if data.raw.technology[prerequisite] then
                                table.insert(tech.prerequisites, prerequisite)
                            end
                        end
                    end
                end
            end

            data.raw.technology["burner-mechanics"] = nil
        end
    end

    -- 修复 automation-science-pack 的问题
    if data.raw.technology["automation-science-pack"] then
        if data.raw.recipe["burner-assembling-machine"] then
            table.insert(data.raw.technology["automation-science-pack"].effects,
                         {
                type = "unlock-recipe",
                recipe = "burner-assembling-machine"
            })
        end

        if data.raw.recipe["burner-lab"] then
            table.insert(data.raw.technology["automation-science-pack"].effects,
                         {type = "unlock-recipe", recipe = "burner-lab"})
        end
    end

    -- 修复 moss-processing 的问题
    if data.raw.technology["moss-processing"] then
        if data.raw.recipe["motor"] then
            table.insert(data.raw.technology["moss-processing"].effects,
                         {type = "unlock-recipe", recipe = "motor"})
        end
    end
end

-- 修复科技的问题
-- 修复 basic-resources 的问题
if data.raw.technology["basic-resources"] then
    if data.raw.recipe["iron-stick"] then
        table.insert(data.raw.technology["basic-resources"].effects,
                     {type = "unlock-recipe", recipe = "iron-stick"})
    end

    if data.raw.recipe["bolts"] then
        table.insert(data.raw.technology["basic-resources"].effects,
                     {type = "unlock-recipe", recipe = "bolts"})
    end

    if data.raw.recipe["iron-gear-wheel"] then
        table.insert(data.raw.technology["basic-resources"].effects,
                     {type = "unlock-recipe", recipe = "iron-gear-wheel"})
    end

    if data.raw.recipe["small-parts-01"] then
        table.insert(data.raw.technology["basic-resources"].effects,
                     {type = "unlock-recipe", recipe = "small-parts-01"})
    end

    if data.raw.recipe["copper-cable"] then
        table.insert(data.raw.technology["basic-resources"].effects,
                     {type = "unlock-recipe", recipe = "copper-cable"})
    end

    if data.raw.recipe["inductor1-2"] then
        table.insert(data.raw.technology["basic-resources"].effects,
                     {type = "unlock-recipe", recipe = "inductor1-2"})
    end

    if data.raw.recipe["stone-furnace"] then
        table.insert(data.raw.technology["basic-resources"].effects,
                     {type = "unlock-recipe", recipe = "stone-furnace"})
    end

    if data.raw.recipe["iron-plate"] then
        table.insert(data.raw.technology["basic-resources"].effects,
                     {type = "unlock-recipe", recipe = "iron-plate"})
    end

    if data.raw.recipe["copper-plate"] then
        table.insert(data.raw.technology["basic-resources"].effects,
                     {type = "unlock-recipe", recipe = "copper-plate"})
    end

    if data.raw.recipe["stone-brick"] then
        table.insert(data.raw.technology["basic-resources"].effects,
                     {type = "unlock-recipe", recipe = "stone-brick"})
    end

    if data.raw.recipe["pipe"] then
        table.insert(data.raw.technology["basic-resources"].effects,
                     {type = "unlock-recipe", recipe = "pipe"})
    end

    if data.raw.recipe["pipe-to-ground"] then
        table.insert(data.raw.technology["basic-resources"].effects,
                     {type = "unlock-recipe", recipe = "pipe-to-ground"})
    end

    if data.raw.recipe["early-iron-ore"] then
        table.insert(data.raw.technology["basic-resources"].effects,
                     {type = "unlock-recipe", recipe = "early-iron-ore"})
    end

    if data.raw.recipe["early-copper-ore"] then
        table.insert(data.raw.technology["basic-resources"].effects,
                     {type = "unlock-recipe", recipe = "early-copper-ore"})
    end
end

-- 修复 moss-processing 的问题
if data.raw.technology["moss-processing"] then
    if data.raw.recipe["early-moss"] then
        table.insert(data.raw.technology["moss-processing"].effects,
                     {type = "unlock-recipe", recipe = "early-moss"})
    end

    if data.raw.recipe["early-carbon-dioxide"] then
        table.insert(data.raw.technology["moss-processing"].effects,
                     {type = "unlock-recipe", recipe = "early-carbon-dioxide"})
    end

    if data.raw.recipe["moss-farm-mk01"] then
        table.insert(data.raw.technology["moss-processing"].effects,
                     {type = "unlock-recipe", recipe = "moss-farm-mk01"})
    end

    if data.raw.recipe["Moss-1"] then
        table.insert(data.raw.technology["moss-processing"].effects,
                     {type = "unlock-recipe", recipe = "Moss-1"})
    end

    if data.raw.recipe["muddy-sludge"] then
        table.insert(data.raw.technology["moss-processing"].effects,
                     {type = "unlock-recipe", recipe = "muddy-sludge"})
    end

    data.raw.technology["moss-processing"].prerequisites = {"steam-power"}
end

-- 修复 log-processing 的问题
if data.raw.technology["log-processing"] then
    if data.raw.recipe["early-log"] then
        table.insert(data.raw.technology["log-processing"].effects,
                     {type = "unlock-recipe", recipe = "early-log"})
    end

    if data.raw.recipe["log-wood"] then
        table.insert(data.raw.technology["log-processing"].effects,
                     {type = "unlock-recipe", recipe = "log-wood"})
    end

    if data.raw.recipe["botanical-nursery"] then
        table.insert(data.raw.technology["log-processing"].effects,
                     {type = "unlock-recipe", recipe = "botanical-nursery"})
    end

    data.raw.technology["log-processing"].prerequisites = {"moss-processing"}
end

local function print_dependency_chain(tech_name, visited)
    visited = visited or {}
    if visited[tech_name] then return end
    visited[tech_name] = true

    local tech = data.raw.technology[tech_name]
    if not tech then
        log("科技 " .. tech_name .. " 不存在")
        return
    end

    log("科技：" .. tech_name)
    if tech.prerequisites and #tech.prerequisites > 0 then
        log("  前置科技: " .. table.concat(tech.prerequisites, ", "))
        for _, pre in ipairs(tech.prerequisites) do
            print_dependency_chain(pre, visited)
        end
    else
        log("  无前置科技")
    end
end

-- 从 logistic-science-pack 开始
print_dependency_chain("logistic-science-pack")
