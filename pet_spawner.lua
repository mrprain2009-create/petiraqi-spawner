return function(petName)
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    
    local petsFolder = ReplicatedStorage:WaitForChild("PetsPhysical")
    local pet = petsFolder:FindFirstChild(petName)
    
    if pet then
        local clone = pet:Clone()
        clone.Parent = Players.LocalPlayer.Backpack
        print(petName .. " added to Backpack!")
    else
        warn("Pet " .. petName .. " not found!")
    end
end
