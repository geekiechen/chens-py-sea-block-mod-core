-- Copyright (c) 2025 GeekieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
-- 修复模组的问题
-- 修复 chens-modpack-py-auxiliary-others 的问题
if mods["chens-modpack-py-auxiliary-others"] then
    -- 修复模组的问题
    -- 修复 pycoalprocessing 的问题
    if mods["pycoalprocessing"] then
        -- 注册实体
        -- 注册evaporator-mk00
        local evaporator_mk00_entity
        if data.raw["assembling-machine"]["evaporator"] then
            evaporator_mk00_entity = table.deepcopy(
                                         data.raw["assembling-machine"]["evaporator"])
            evaporator_mk00_entity.name = "evaporator-mk00"
            evaporator_mk00_entity.icon = nil
            evaporator_mk00_entity.icons = {
                {
                    icon = "__pycoalprocessinggraphics__/graphics/icons/evaporator.png",
                    icon_size = 64,
                    tint = {r = 0.4, g = 0.4, b = 0.4, a = 1}
                }
            }
            evaporator_mk00_entity.energy_source.type = "burner"
            evaporator_mk00_entity.energy_source.fuel_categories = {"chemical"}
            evaporator_mk00_entity.energy_source.fuel_inventory_size = 1
            evaporator_mk00_entity.energy_source.burnt_inventory_size = 1
            evaporator_mk00_entity.energy_source.burnt_result = "ash"
            evaporator_mk00_entity.minable = {
                mining_time = 1,
                result = "evaporator-mk00"
            }
            evaporator_mk00_entity.energy_usage = "500kW"
            evaporator_mk00_entity.next_upgrade = "evaporator"
            evaporator_mk00_entity.crafting_categories = {"evaporator"}

            if evaporator_mk00_entity.graphics_set and
                evaporator_mk00_entity.graphics_set.animation and
                evaporator_mk00_entity.graphics_set.animation.layers then
                for _, layer in pairs(evaporator_mk00_entity.graphics_set
                                          .animation.layers) do
                    if layer.tint then
                        layer.tint = {r = 0.5, g = 0.5, b = 0.5, a = 1.0}
                    end
                end
            end

            if evaporator_mk00_entity.graphics_set and
                evaporator_mk00_entity.graphics_set.working_visualisations then
                for _, visual in pairs(evaporator_mk00_entity.graphics_set
                                           .working_visualisations) do
                    if visual.animation and visual.animation.layers then
                        for _, layer in pairs(visual.animation.layers) do
                            if layer.tint then
                                layer.tint = {
                                    r = 0.5,
                                    g = 0.5,
                                    b = 0.5,
                                    a = 1.0
                                }
                            end
                        end
                    end
                end
            end
        end

        -- 注册物品子组
        -- 注册evaporator-mk00
        local evaporator_mk00_item_subgroup
        if data.raw["item-subgroup"]["py-cp-buildings-mk01"] then
            evaporator_mk00_item_subgroup = table.deepcopy(
                                                data.raw["item-subgroup"]["py-cp-buildings-mk01"])
            evaporator_mk00_item_subgroup.name = "py-cp-buildings-mk00"
            evaporator_mk00_item_subgroup.group = "coal-processing"
        end

        -- 注册物品
        -- 注册evaporator-mk00
        local evaporator_mk00_item
        if data.raw.item["evaporator"] then
            evaporator_mk00_item = table.deepcopy(data.raw.item["evaporator"])
            evaporator_mk00_item.name = "evaporator-mk00"
            evaporator_mk00_item.icon = nil
            evaporator_mk00_item.icons = {
                {
                    icon = "__pycoalprocessinggraphics__/graphics/icons/evaporator.png",
                    icon_size = 64,
                    tint = {r = 0.4, g = 0.4, b = 0.4, a = 1}
                }
            }

            evaporator_mk00_item.place_result = "evaporator-mk00"
            evaporator_mk00_item.subgroup = "py-cp-buildings-mk00"
        end

        -- 注册配方
        -- 注册evaporator-mk00
        local evaporator_mk00_recipe
        if data.raw.recipe["evaporator"] then
            evaporator_mk00_recipe = table.deepcopy(
                                         data.raw.recipe["evaporator"])
            evaporator_mk00_recipe.name = "evaporator-mk00"
            evaporator_mk00_recipe.ingredients = {
                {type = "item", name = "copper-plate", amount = 4},
                {type = "item", name = "iron-stick", amount = 2},
                {type = "item", name = "stone-furnace", amount = 1},
                {type = "item", name = "copper-cable", amount = 3},
                {type = "item", name = "small-parts-01", amount = 3}
            }
            evaporator_mk00_recipe.results = {
                {type = "item", name = "evaporator-mk00", amount = 1}
            }
            evaporator_mk00_recipe.enabled = false
        end

        data:extend({
            evaporator_mk00_entity, evaporator_mk00_item_subgroup,
            evaporator_mk00_item, evaporator_mk00_recipe
        })
    end

    -- 修复 pyrawores 的问题
    if mods["pyrawores"] then
        -- 注册实体
        -- 注册flotation-cell-mk00
        local flotation_cell_mk00_entity
        if data.raw["assembling-machine"]["flotation-cell-mk01"] then
            flotation_cell_mk00_entity = table.deepcopy(
                                             data.raw["assembling-machine"]["flotation-cell-mk01"])
            flotation_cell_mk00_entity.name = "flotation-cell-mk00"
            flotation_cell_mk00_entity.icon = nil
            flotation_cell_mk00_entity.icons = {
                {
                    icon = "__pyraworesgraphics__/graphics/icons/flotation-cell-mk01.png",
                    icon_size = 32,
                    tint = {r = 0.4, g = 0.4, b = 0.4, a = 1}
                }
            }
            flotation_cell_mk00_entity.minable = {
                mining_time = 1,
                result = "flotation-cell-mk00"
            }
            flotation_cell_mk00_entity.energy_usage = "500kW"
            flotation_cell_mk00_entity.next_upgrade = "flotation-cell-mk01"
            flotation_cell_mk00_entity.crafting_categories = {"flotation"}

            if flotation_cell_mk00_entity.graphics_set and
                flotation_cell_mk00_entity.graphics_set.animation and
                flotation_cell_mk00_entity.graphics_set.animation.layers then
                for _, layer in pairs(flotation_cell_mk00_entity.graphics_set
                                          .animation.layers) do
                    if layer.tint then
                        layer.tint = {r = 0.5, g = 0.5, b = 0.5, a = 1.0}
                    end
                end
            end

            if flotation_cell_mk00_entity.graphics_set and
                flotation_cell_mk00_entity.graphics_set.working_visualisations then
                for _, visual in pairs(flotation_cell_mk00_entity.graphics_set
                                           .working_visualisations) do
                    if visual.animation and visual.animation.layers then
                        for _, layer in pairs(visual.animation.layers) do
                            if layer.tint then
                                layer.tint = {
                                    r = 0.5,
                                    g = 0.5,
                                    b = 0.5,
                                    a = 1.0
                                }
                            end
                        end
                    end
                end
            end
        end

        -- 注册hydroclassifier-mk00
        local hydroclassifier_mk00_entity
        if data.raw["assembling-machine"]["hydroclassifier-mk01"] then
            hydroclassifier_mk00_entity = table.deepcopy(
                                              data.raw["assembling-machine"]["hydroclassifier-mk01"])
            hydroclassifier_mk00_entity.name = "hydroclassifier-mk00"
            hydroclassifier_mk00_entity.icon = nil
            hydroclassifier_mk00_entity.icons = {
                {
                    icon = "__pyraworesgraphics__/graphics/icons/hydroclassifier-mk01.png",
                    icon_size = 32,
                    tint = {r = 0.4, g = 0.4, b = 0.4, a = 1}
                }
            }
            hydroclassifier_mk00_entity.energy_source.type = "burner"
            hydroclassifier_mk00_entity.energy_source.fuel_categories = {
                "chemical"
            }
            hydroclassifier_mk00_entity.energy_source.fuel_inventory_size = 1
            hydroclassifier_mk00_entity.energy_source.burnt_inventory_size = 1
            hydroclassifier_mk00_entity.energy_source.burnt_result = "ash"
            hydroclassifier_mk00_entity.minable = {
                mining_time = 1,
                result = "hydroclassifier-mk00"
            }
            hydroclassifier_mk00_entity.energy_usage = "500kW"
            hydroclassifier_mk00_entity.next_upgrade = "hydroclassifier-mk01"
            hydroclassifier_mk00_entity.crafting_categories = {
                "hydroclassifier"
            }

            if hydroclassifier_mk00_entity.graphics_set and
                hydroclassifier_mk00_entity.graphics_set.animation and
                hydroclassifier_mk00_entity.graphics_set.animation.layers then
                for _, layer in pairs(hydroclassifier_mk00_entity.graphics_set
                                          .animation.layers) do
                    if layer.tint then
                        layer.tint = {r = 0.5, g = 0.5, b = 0.5, a = 1.0}
                    end
                end
            end

            if hydroclassifier_mk00_entity.graphics_set and
                hydroclassifier_mk00_entity.graphics_set.working_visualisations then
                for _, visual in pairs(hydroclassifier_mk00_entity.graphics_set
                                           .working_visualisations) do
                    if visual.animation and visual.animation.layers then
                        for _, layer in pairs(visual.animation.layers) do
                            if layer.tint then
                                layer.tint = {
                                    r = 0.5,
                                    g = 0.5,
                                    b = 0.5,
                                    a = 1.0
                                }
                            end
                        end
                    end
                end
            end
        end

        -- 注册leaching-station-mk00
        local leaching_station_mk00_entity
        if data.raw["assembling-machine"]["leaching-station-mk01"] then
            leaching_station_mk00_entity = table.deepcopy(
                                               data.raw["assembling-machine"]["leaching-station-mk01"])
            leaching_station_mk00_entity.name = "leaching-station-mk00"
            leaching_station_mk00_entity.icon = nil
            leaching_station_mk00_entity.icons = {
                {
                    icon = "__pyraworesgraphics__/graphics/icons/leaching-station-mk01.png",
                    icon_size = 32,
                    tint = {r = 0.4, g = 0.4, b = 0.4, a = 1}
                }
            }
            leaching_station_mk00_entity.minable = {
                mining_time = 1,
                result = "leaching-station-mk00"
            }
            leaching_station_mk00_entity.energy_usage = "500kW"
            leaching_station_mk00_entity.next_upgrade = "leaching-station-mk01"
            leaching_station_mk00_entity.crafting_categories = {"leaching"}

            if leaching_station_mk00_entity.graphics_set and
                leaching_station_mk00_entity.graphics_set.animation and
                leaching_station_mk00_entity.graphics_set.animation.layers then
                for _, layer in pairs(leaching_station_mk00_entity.graphics_set
                                          .animation.layers) do
                    if layer.tint then
                        layer.tint = {r = 0.5, g = 0.5, b = 0.5, a = 1.0}
                    end
                end
            end

            if leaching_station_mk00_entity.graphics_set and
                leaching_station_mk00_entity.graphics_set.working_visualisations then
                for _, visual in pairs(leaching_station_mk00_entity.graphics_set
                                           .working_visualisations) do
                    if visual.animation and visual.animation.layers then
                        for _, layer in pairs(visual.animation.layers) do
                            if layer.tint then
                                layer.tint = {
                                    r = 0.5,
                                    g = 0.5,
                                    b = 0.5,
                                    a = 1.0
                                }
                            end
                        end
                    end
                end
            end
        end

        -- 注册物品子组
        -- 注册flotation-cell-mk00
        local flotation_cell_mk00_item_subgroup
        if data.raw["item-subgroup"]["py-rawores-buildings-mk01"] then
            flotation_cell_mk00_item_subgroup = table.deepcopy(
                                                    data.raw["item-subgroup"]["py-rawores-buildings-mk01"])
            flotation_cell_mk00_item_subgroup.name = "py-rawores-buildings-mk00"
            flotation_cell_mk00_item_subgroup.group = "py-rawores"
        end

        -- 注册hydroclassifier-mk00
        local hydroclassifier_mk00_item_subgroup
        if data.raw["item-subgroup"]["py-rawores-buildings-mk01"] then
            hydroclassifier_mk00_item_subgroup = table.deepcopy(
                                                     data.raw["item-subgroup"]["py-rawores-buildings-mk01"])
            hydroclassifier_mk00_item_subgroup.name =
                "py-rawores-buildings-mk00"
            hydroclassifier_mk00_item_subgroup.group = "py-rawores"
        end

        -- 注册leaching-station-mk00
        local leaching_station_mk00_item_subgroup
        if data.raw["item-subgroup"]["py-rawores-buildings-mk01"] then
            leaching_station_mk00_item_subgroup = table.deepcopy(
                                                      data.raw["item-subgroup"]["py-rawores-buildings-mk01"])
            leaching_station_mk00_item_subgroup.name =
                "py-rawores-buildings-mk00"
            leaching_station_mk00_item_subgroup.group = "py-rawores"
        end

        -- 注册物品
        -- 注册flotation-cell-mk00
        local flotation_cell_mk00_item
        if data.raw.item["flotation-cell-mk01"] then
            flotation_cell_mk00_item = table.deepcopy(
                                           data.raw.item["flotation-cell-mk01"])
            flotation_cell_mk00_item.name = "flotation-cell-mk00"
            flotation_cell_mk00_item.icon = nil
            flotation_cell_mk00_item.icons = {
                {
                    icon = "__pyraworesgraphics__/graphics/icons/flotation-cell-mk01.png",
                    icon_size = 32,
                    tint = {r = 0.5, g = 0.5, b = 0.5, a = 1}
                }
            }
            flotation_cell_mk00_item.place_result = "flotation-cell-mk00"
            flotation_cell_mk00_item.subgroup = "py-rawores-buildings-mk00"
        end

        -- 注册hydroclassifier-mk00
        local hydroclassifier_mk00_item
        if data.raw.item["hydroclassifier-mk01"] then
            hydroclassifier_mk00_item = table.deepcopy(
                                            data.raw.item["hydroclassifier-mk01"])
            hydroclassifier_mk00_item.name = "hydroclassifier-mk00"
            hydroclassifier_mk00_item.icon = nil
            hydroclassifier_mk00_item.icons = {
                {
                    icon = "__pyraworesgraphics__/graphics/icons/hydroclassifier-mk01.png",
                    icon_size = 32,
                    tint = {r = 0.4, g = 0.4, b = 0.4, a = 1}
                }
            }
            hydroclassifier_mk00_item.place_result = "hydroclassifier-mk00"
            hydroclassifier_mk00_item.subgroup = "py-rawores-buildings-mk00"
        end

        -- 注册leaching-station-mk00
        local leaching_station_mk00_item
        if data.raw.item["leaching-station-mk01"] then
            leaching_station_mk00_item = table.deepcopy(
                                             data.raw.item["leaching-station-mk01"])
            leaching_station_mk00_item.name = "leaching-station-mk00"
            leaching_station_mk00_item.icon = nil
            leaching_station_mk00_item.icons = {
                {
                    icon = "__pyraworesgraphics__/graphics/icons/leaching-station-mk01.png",
                    icon_size = 32,
                    tint = {r = 0.4, g = 0.4, b = 0.4, a = 1}
                }
            }
            leaching_station_mk00_item.place_result = "leaching-station-mk00"
            leaching_station_mk00_item.subgroup = "py-rawores-buildings-mk00"
        end

        -- 注册配方
        -- 注册flotation-cell-mk00
        local flotation_cell_mk00_recipe
        if data.raw.recipe["flotation-cell-mk01"] then
            flotation_cell_mk00_recipe = table.deepcopy(
                                             data.raw.recipe["flotation-cell-mk01"])
            flotation_cell_mk00_recipe.name = "flotation-cell-mk00"
            flotation_cell_mk00_recipe.ingredients = {
                {type = "item", name = "iron-stick", amount = 4},
                {type = "item", name = "copper-plate", amount = 3},
                {type = "item", name = "stone", amount = 2},
                {type = "item", name = "bolts", amount = 3},
                {type = "item", name = "small-parts-01", amount = 2}
            }
            flotation_cell_mk00_recipe.results = {
                {type = "item", name = "flotation-cell-mk00", amount = 1}
            }
            flotation_cell_mk00_recipe.enabled = false
        end

        -- 注册hydroclassifier-mk00
        local hydroclassifier_mk00_recipe
        if data.raw.recipe["hydroclassifier-mk01"] then
            hydroclassifier_mk00_recipe = table.deepcopy(
                                              data.raw.recipe["hydroclassifier-mk01"])
            hydroclassifier_mk00_recipe.name = "hydroclassifier-mk00"
            hydroclassifier_mk00_recipe.ingredients = {
                {type = "item", name = "iron-plate", amount = 3},
                {type = "item", name = "stone", amount = 4},
                {type = "item", name = "copper-cable", amount = 2},
                {type = "item", name = "small-parts-01", amount = 3},
                {type = "item", name = "pipe", amount = 1}
            }
            hydroclassifier_mk00_recipe.results = {
                {type = "item", name = "hydroclassifier-mk00", amount = 1}
            }
            hydroclassifier_mk00_recipe.enabled = false
        end

        -- 注册leaching-station-mk00
        local leaching_station_mk00_recipe
        if data.raw.recipe["leaching-station-mk01"] then
            leaching_station_mk00_recipe = table.deepcopy(
                                               data.raw.recipe["leaching-station-mk01"])
            leaching_station_mk00_recipe.name = "leaching-station-mk00"
            leaching_station_mk00_recipe.ingredients = {
                {type = "item", name = "stone", amount = 5},
                {type = "item", name = "copper-plate", amount = 3},
                {type = "item", name = "iron-stick", amount = 2},
                {type = "item", name = "bolts", amount = 4},
                {type = "item", name = "small-parts-01", amount = 3}
            }
            leaching_station_mk00_recipe.results = {
                {type = "item", name = "leaching-station-mk00", amount = 1}
            }
            leaching_station_mk00_recipe.enabled = false
        end

        data:extend({
            flotation_cell_mk00_entity, hydroclassifier_mk00_entity,
            leaching_station_mk00_entity, flotation_cell_mk00_item_subgroup,
            hydroclassifier_mk00_item_subgroup,
            leaching_station_mk00_item_subgroup, flotation_cell_mk00_item,
            hydroclassifier_mk00_item, leaching_station_mk00_item,
            flotation_cell_mk00_recipe, hydroclassifier_mk00_recipe,
            leaching_station_mk00_recipe
        })
    end

    -- 修复 pyalienlife 的问题
    if mods["pyalienlife"] then
        -- 注册实体
        -- 注册biofactory-mk00
        local biofactory_mk00_entity
        if data.raw["assembling-machine"]["biofactory-mk01"] then
            biofactory_mk00_entity = table.deepcopy(
                                         data.raw["assembling-machine"]["biofactory-mk01"])
            biofactory_mk00_entity.name = "biofactory-mk00"
            biofactory_mk00_entity.icon = nil
            biofactory_mk00_entity.icons = {
                {
                    icon = "__pyalienlifegraphics__/graphics/icons/biofactory-mk01.png",
                    icon_size = 64,
                    tint = {r = 0.4, g = 0.4, b = 0.4, a = 1}
                }
            }
            biofactory_mk00_entity.energy_source.type = "burner"
            biofactory_mk00_entity.energy_source.fuel_categories = {"chemical"}
            biofactory_mk00_entity.energy_source.fuel_inventory_size = 1
            biofactory_mk00_entity.energy_source.burnt_inventory_size = 1
            biofactory_mk00_entity.energy_source.burnt_result = "ash"
            biofactory_mk00_entity.minable = {
                mining_time = 1,
                result = "biofactory-mk00"
            }
            biofactory_mk00_entity.energy_usage = "500kW"
            biofactory_mk00_entity.next_upgrade = "biofactory-mk01"
            biofactory_mk00_entity.crafting_categories = {"biofactory"}

            if biofactory_mk00_entity.graphics_set and
                biofactory_mk00_entity.graphics_set.animation and
                biofactory_mk00_entity.graphics_set.animation.layers then
                for _, layer in pairs(biofactory_mk00_entity.graphics_set
                                          .animation.layers) do
                    if layer.tint then
                        layer.tint = {r = 0.5, g = 0.5, b = 0.5, a = 1.0}
                    end
                end
            end

            if biofactory_mk00_entity.graphics_set and
                biofactory_mk00_entity.graphics_set.working_visualisations then
                for _, visual in pairs(biofactory_mk00_entity.graphics_set
                                           .working_visualisations) do
                    if visual.animation and visual.animation.layers then
                        for _, layer in pairs(visual.animation.layers) do
                            if layer.tint then
                                layer.tint = {
                                    r = 0.5,
                                    g = 0.5,
                                    b = 0.5,
                                    a = 1.0
                                }
                            end
                        end
                    end
                end
            end
        end

        -- 注册物品子组
        -- 注册biofactory-mk00
        local biofactory_mk00_item_subgroup
        if data.raw["item-subgroup"]["py-alienlife-buildings-mk01"] then
            biofactory_mk00_item_subgroup = table.deepcopy(
                                                data.raw["item-subgroup"]["py-alienlife-buildings-mk01"])
            biofactory_mk00_item_subgroup.name = "py-alienlife-buildings-mk00"
            biofactory_mk00_item_subgroup.group = "py-alienlife"
        end

        -- 注册物品
        -- 注册biofactory-mk00
        local biofactory_mk00_item
        if data.raw.item["biofactory-mk01"] then
            biofactory_mk00_item = table.deepcopy(
                                       data.raw.item["biofactory-mk01"])
            biofactory_mk00_item.name = "biofactory-mk00"
            biofactory_mk00_item.icon = nil
            biofactory_mk00_item.icons = {
                {
                    icon = "__pyalienlifegraphics__/graphics/icons/biofactory-mk01.png",
                    icon_size = 64,
                    tint = {r = 0.4, g = 0.4, b = 0.4, a = 1}
                }
            }

            biofactory_mk00_item.place_result = "biofactory-mk00"
            biofactory_mk00_item.subgroup = "py-alienlife-buildings-mk00"
        end

        -- 注册配方
        -- 注册biofactory-mk00
        local biofactory_mk00_recipe
        if data.raw.recipe["biofactory-mk01"] then
            biofactory_mk00_recipe = table.deepcopy(
                                         data.raw.recipe["biofactory-mk01"])
            biofactory_mk00_recipe.name = "biofactory-mk00"
            biofactory_mk00_recipe.ingredients = {
                {type = "item", name = "stone-furnace", amount = 1},
                {type = "item", name = "iron-stick", amount = 3},
                {type = "item", name = "copper-plate", amount = 2},
                {type = "item", name = "small-parts-01", amount = 3},
                {type = "item", name = "bolts", amount = 2}
            }
            biofactory_mk00_recipe.results = {
                {type = "item", name = "biofactory-mk00", amount = 1}
            }
            biofactory_mk00_recipe.enabled = false
        end

        data:extend({
            biofactory_mk00_entity, biofactory_mk00_item_subgroup,
            biofactory_mk00_item, biofactory_mk00_recipe
        })
    end
end
