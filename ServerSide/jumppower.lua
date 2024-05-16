-- serverside
local JUMP_VELOCITY_THRESHOLD = 50

game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        local humanoid = character:WaitForChild("Humanoid")

        humanoid.StateChanged:Connect(function(state)
            if state == Enum.HumanoidStateType.Jumping then
                local velocity = humanoid.Velocity
                if velocity.Y > JUMP_VELOCITY_THRESHOLD then
                    -- detection vec
                    print("Player " .. player.Name .. " exceeded the jump velocity threshold.")
                    -- kick player once detected
                    player:Kick("Jump power cheat detected.")
                end
            end
        end)
    end)
end)
