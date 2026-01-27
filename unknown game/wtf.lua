local name = game:GetService("Players").LocalPlayer.Name
local parent = workspace:FindFirstChild(name)

-- thats beta bro!!! working so bad!!!!!!
local accessoryLink = {
    -- [ HANDLE LINKS ]
    meshid = "rbxassetid://110977633104402",
    textureid = "rbxassetid://112983320393475",
}
-- simple safety from being crashed
local a, b = pcall(function()
    workspace:FindFirstChild(name):FindFirstChild("Pants"):Destroy()
    workspace:FindFirstChild(name):FindFirstChild("Shirt"):Destroy()
end)
if not a then
    warn("( ! ) function `:Destroy()` error: " .. b)
end
task.wait(1)

-- [ CREATING PARTS FOR NEW SKIN ]
-- default skin (pants, shirts)
local newPants = Instance.new("Pants", parent)
local newShirt = Instance.new("Shirt", parent)
-- accessories (BETA)
if _G.betaVer then
    local newAccessory = Instance.new("Accessory", parent)
    local newHandle = Instance.new("MeshPart", newAccessory)
    local newAvatarPartScaleType = Instance.new("StringValue", newHandle)
    local newHairAttachment = Instance.new("Attachment", newHandle)
    local origPos = Instance.new("Vector3Value", newHairAttachment)
    local origSize = Instance.new("Vector3Value", newHandle)
    local newAccessoryWeld = Instance.new("Weld", newHandle)
end
---------------------------------------
-- CONFIGURING ALL PARTS (important)  |
-- adding IDs to the skin             |
---------------------------------------
-- configuring pants here
newPants.Name = "Pants"
newPants.PantsTemplate = not _G.do_Not_Load_Assets and _G.link["pants"] or ""
-- configuring shirt here
newShirt.Name = "Shirt"
newShirt.ShirtTemplate = not _G.do_Not_Load_Assets and _G.link["shirt"] or ""
-- configuring accessory here (BETA)
if _G.betaVer then
    newAccessory.Name = "Accessory (Handle1Accessory)"
    newHandle.Name = "Handle"
    newHandle.MeshId = accessoryLink["meshid"]
    newHandle.TextureID = accessoryLink["textureid"]
    newAvatarPartScaleType.Name = "AvatarPartScaleType"
    newAvatarPartScaleType.Value = "Classic"
    newHairAttachment.Name = "HairAttachment"
    newHairAttachment.CFrame = workspace:FindFirstChild(name):FindFirstChild("Head"):FindFirstChild("HairAttachment").CFrame
    origPos.Name = "OriginalPosition"
    origPos.Value = workspace:FindFirstChild(name):FindFirstChild("Head"):FindFirstChild("HairAttachment"):FindFirstChild("OriginalPosition").Value
    origSize.Name = "OriginalSize"
    origSize.Value = workspace:FindFirstChild(name):FindFirstChild("Head"):FindFirstChild("OriginalSize").Value
    newAccessoryWeld.Name = "AccessoryWeld"
end

-- doing other things asked from cfg
if _G.removeAccessory then
    local a, b = pcall(function()
        workspace:FindFirstChild(name):FindFirstChildOfClass("Accessory"):Destroy()
    end)
    if not a then
        warn("( ! ) CFG Accessory Deleting Error: " .. b)
    end
end
if _G.changeSkinColor ~= nil then
    local a, b = pcall(function()
        local bc = workspace:FindFirstChild(name):FindFirstChild("Body Colors")
        bc.HeadColor3 = _G.changeSkinColor
        bc.LeftArmColor3 = _G.changeSkinColor
        bc.LeftLegColor3 = _G.changeSkinColor
        bc.RightArmColor3 = _G.changeSkinColor
        bc.RightLegColor3 = _G.changeSkinColor
        bc.TorsoColor3 = _G.changeSkinColor
    end)
    if not a then
        warn("( ! ) CFG Skin Color Change Error: " .. b)
    end
end

print('Done! Have fun ;)')
