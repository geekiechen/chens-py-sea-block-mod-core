-- Copyright (c) 2025 GeekieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
-- 修复模组的问题
-- 修复 chens-py-sea-block-mod 的问题
if mods["chens-py-sea-block-mod"] then
    -- 修复模组的问题
    -- 修复 chens-tweak-mod 的问题
    if mods["chens-tweak-mod"] then
        -- 修复科技的问题
        -- 修复 basic-resources 的问题
        if data.raw.technology["basic-resources"] then
            table.insert(data.raw.technology["basic-resources"].effects,
                         {type = "unlock-recipe", recipe = "landfill"})
        end
    end

    -- 修复科技的问题
    -- 修复 landfill 的问题
    if data.raw.technology["landfill"] then
        for i = #data.raw.technology["landfill"].effects, 1, -1 do
            local effect = data.raw.technology["landfill"].effects[i]
            if effect.type == "unlock-recipe" and effect.recipe == "landfill" then
                table.remove(data.raw.technology["landfill"].effects, i)
                break
            end
        end

        if next(data.raw.technology["landfill"].effects or {}) == nil then
            for _, tech in pairs(data.raw.technology) do
                if tech.prerequisites and
                    table.contains(tech.prerequisites, "landfill") then
                    for i, prerequisite in ipairs(tech.prerequisites) do
                        if prerequisite == "landfill" then
                            table.remove(tech.prerequisites, i)
                            break
                        end
                    end

                    for _, prerequisite in ipairs(
                                               data.raw.technology["landfill"]
                                                   .prerequisites or {}) do
                        if not table.contains(tech.prerequisites, prerequisite) then
                            table.insert(tech.prerequisites, prerequisite)
                        end
                    end
                end
            end

            data.raw.technology["landfill"] = nil
        end
    end

    -- 修复配方的问题
    -- 修复 landfill 的问题
    if data.raw.recipe["landfill"] then
        data.raw.recipe["landfill"].ingredients = {
            {type = "item", name = "stone", amount = 5},
            {type = "item", name = "ash", amount = 10}
        }
        data.raw.recipe["landfill"].results = {
            {type = "item", name = "landfill", amount = 2}
        }
    end
end
