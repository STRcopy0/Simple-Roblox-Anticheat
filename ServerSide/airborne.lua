-- server side
local Players = game:GetService("Players")

-- is the player airborne?
local function checkAirborne(player)
    while true do
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChildWhichIsA("Humanoid")
            if humanoid then
                local airborneTime = 0
                while true do
                    if humanoid.FloorMaterial == Enum.Material.Air then
                        airborneTime = airborneTime + 5
                        if airborneTime > 8 then
                            -- Check if the player has a glider
                            local glider = character:FindFirstChild("Glider")
                            if not glider then
                                -- Kick the player
                                player:Kick("Airborne for too long without a glider.")
                            end
                        end
                    else
                        airborneTime = 0
                    end
                    wait(5)
                end
            end
        end
        wait()
    end
end

-- run for check for every player
for _, player in pairs(Players:GetPlayers()) do
    spawn(function()
        checkAirborne(player)
    end)
end

-- see if there are new people joining
Players.PlayerAdded:Connect(function(player)
    spawn(function()
        checkAirborne(player)
    end)
end)
