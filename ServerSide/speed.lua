game.Players.PlayerAdded:Connect(function(plr)
    if not plr.Character then
        plr.CharacterAdded:Wait()
    end

    local c = plr.Character
    local Humanoid = c:FindFirstChild("Humanoid")

    while true do
        local OldPosition = c.HumanoidRootPart.Position * Vector3.new(1,0,1)
        wait(1)
        local NewPosition = c.HumanoidRootPart.Position * Vector3.new(1,0,1)
        local ActualSpeed = (OldPosition-NewPosition).Magnitude

        if ActualSpeed > (Humanoid.WalkSpeed + 5) then
            plr:Kick("speed hacks")
        end
    end
end)
