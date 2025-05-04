-- Copyright (c) 2025 GeekieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
script.on_event(defines.events.on_research_finished, function(event)
    -- 研究完成后给予物品
    if event.research.name == "basic-resources" then
        for _, player in pairs(game.connected_players) do
            player.insert {name = "hydroclassifier-mk00", count = 1}
        end
    end
end)
