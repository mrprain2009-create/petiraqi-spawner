return function(petName)
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    -- المجلدات اللي نبحث فيها
    local foldersToCheck = {"Pets", "PetsPhysical"}

    local pet
    for _, folderName in ipairs(foldersToCheck) do
        local folder = ReplicatedStorage:FindFirstChild(folderName)
        if folder then
            pet = folder:FindFirstChild(petName)
            if pet then break end
        end
    end

    if pet then
        local clone = pet:Clone()

        -- إذا ما كان Tool نحوله Tool
        if not clone:IsA("Tool") then
            local tool = Instance.new("Tool")
            tool.Name = petName
            tool.RequiresHandle = false
            clone.Parent = tool
            clone = tool
        end

        -- نحطه في Backpack ونجهزه في اليد
        clone.Parent = Players.LocalPlayer.Backpack
        Players.LocalPlayer.Character:EquipTool(clone)

        print("[Pet Spawner] Spawned pet:", petName)
    else
        warn("[Pet Spawner] Pet not found:", petName)
    end
end
