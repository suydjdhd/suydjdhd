_G.Settings = {
    _G.AutoParry == false;
    _G.AutoParryNew == false;
    _G.Abilities == false;
    _G.afk == false;
    _G.Lag == false;
    _G.AutoVotefirst == false;
    _G.AutoVoteSecond == false;
    _G.AutoVoteThirst == false;
    _G.AutoAbi == false
 }

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/KhanhTranVan/NexusUI/main/NexusUI')))()
local Window = OrionLib:MakeWindow({Name = "Nexus Hub | Blade Ball", HidePremium = false, IntroText = "Nexus Hub | Community"})

 local Tab1 = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://7040391851",
    PremiumOnly = false
 })

local Tab2 = Window:MakeTab({
    Name = "Mics",
    Icon = "rbxassetid://11446835336",
    PremiumOnly = false
 })
 local Section = Tab2:AddSection({
	Name = "Mics"
})
function Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end
    function Teleport() 
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end 
Tab2:AddButton({
    Name = "RACTY",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-301.070129, 164.712509, 170.700012, 0, 1, 0, 0, 0, 1, 1, 0, 0)
      end    
})
Tab2:AddButton({
    Name = "RACT",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-321.939514, 120.461754, 181.91098, 1, 0, 0, 0, 1, 0, 0, 0, 1)
      end    
})
Tab2:AddButton({
    Name = "Teleport To Crate",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-277.873566, 135.457565, 197.49115, 0.999999881, 5.49919923e-06, 0.000517902838, 5.49919923e-06, 0.999774516, -0.0212340169, -0.000517902838, 0.0212340169, 0.999774396)
      end    
})
Tab2:AddButton({
    Name = "Teleport To LeaderBoard",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-224.100952, 122.998024, 192.7258, 0.53247571, 0, 0.846445322, 0, 1, 0, -0.846445322, 0, 0.53247571)
      end    
})
Tab2:AddButton({
    Name = "Teleport To Group Reward",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-339.151733, 130.441475, 150.060349, 0, 0, -1, 0, 1, 0, 1, 0, 0)
      end    
})
Tab2:AddButton({
    Name = "Rejoin",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
      end    
})
Tab2:AddButton({
    Name = "Hop Sv",
    Callback = function()
Hop()
end
})
Tab2:AddButton({
    Name = "Hop Sv Low Player",
    Callback = function()
        local Player = game.Players.LocalPlayer    
        local Http = game:GetService("HttpService")
        local TPS = game:GetService("TeleportService")
        local Api = "https://games.roblox.com/v1/games/"
        
        local _place,_id = game.PlaceId, game.JobId
        local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=10"
        function ListServers(cursor)
           local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
           return Http:JSONDecode(Raw)
        end
        
        time_to_wait = 0
        while wait(time_to_wait) do
           Player.Character.HumanoidRootPart.Anchored = true
           local Servers = ListServers()
           local Server = Servers.data[math.random(1,#Servers.data)]
           TPS:TeleportToPlaceInstance(_place, Server.id, Player)
        end
      end    
})
Tab1:AddButton({
    Name = "Open Abilities Gui",
    Callback = function()
        loadstring(Game:HttpGet("https://raw.githubusercontent.com/JewhisKids/StarXYZHub/main/BladeBall/AbilitiesBladeBall.lua"))()
      end    
})
Tab1:AddToggle({
    Name = "Auto AFK",
    Default = _G.afk,
    Callback = function(gayko)
        _G.afk = gayko
 end
})
spawn(function()
    while wait() do
if _G.afk then
    local args = {
        [1] = true
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangedAfkMode"):FireServer(unpack(args))    
elseif _G.afk == false then
    local args = {
        [1] = false
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangedAfkMode"):FireServer(unpack(args))
       end
    end
end)
Tab1:AddToggle({
    Name = "Auto Abilities",
    Default = _G.AutoAbi,
    Callback = function(abik)
_G.AutoAbi = abik
 end
})
spawn(function()
    while wait() do
        if _G.AutoAbi then
            pcall(function()
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"Q",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"Q",false,game)
               end)
            end
        end
    end)
    Tab1:AddToggle({
        Name = "Auto Parry",
        Default = _G.AutoParry,
        Callback = function(value)
    _G.AutoParry = value
     end
    })
    local function startAutoParry()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local replicatedStorage = game:GetService("ReplicatedStorage")
        local runService = game:GetService("RunService")
        local parryButtonPress = replicatedStorage.Remotes.ParryButtonPress
        local ballsFolder = workspace:WaitForChild("Balls")
        local function onCharacterAdded(newCharacter)
            character = newCharacter
        end
        player.CharacterAdded:Connect(onCharacterAdded)
        local focusedBall = nil  
        local function chooseNewFocusedBall()
            local balls = ballsFolder:GetChildren()
            focusedBall = nil
            for _, ball in ipairs(balls) do
                if ball:GetAttribute("realBall") == true then
                    focusedBall = ball
                    break
                end
            end
        end
        spawn(function()
        chooseNewFocusedBall()
        end)
        local function timeUntilImpact(ballVelocity, distanceToPlayer, playerVelocity)
            local directionToPlayer = (character.HumanoidRootPart.Position - focusedBall.Position).Unit
            local velocityTowardsPlayer = ballVelocity:Dot(directionToPlayer) - playerVelocity:Dot(directionToPlayer)
            
            if velocityTowardsPlayer <= 0 then
                return math.huge
            end
            
            local distanceToBeCovered = distanceToPlayer - 40
            return distanceToBeCovered / velocityTowardsPlayer
        end
    
        local BASE_THRESHOLD = 0.15
        local VELOCITY_SCALING_FACTOR = 0.002
    
        local function getDynamicThreshold(ballVelocityMagnitude)
            local adjustedThreshold = BASE_THRESHOLD - (ballVelocityMagnitude * VELOCITY_SCALING_FACTOR)
            return math.max(0.12, adjustedThreshold)
        end
    
        local function checkBallDistance()
            if not character:FindFirstChild("Highlight") then return end
            local charPos = character.PrimaryPart.Position
            local charVel = character.PrimaryPart.Velocity
    
            if focusedBall and not focusedBall.Parent then
                chooseNewFocusedBall()
            end
    
            if not focusedBall then return end
    
            local ball = focusedBall
            local distanceToPlayer = (ball.Position - charPos).Magnitude
    
            if distanceToPlayer < 15 then
                parryButtonPress:Fire()
                return
            end
    if distanceToPlayer < 20 then
                parryButtonPress:Fire()
                return
            end
if distanceToPlayer < 25 then
                parryButtonPress:Fire()
                return
            end
            local timeToImpact = timeUntilImpact(ball.Velocity, distanceToPlayer, charVel)
            local dynamicThreshold = getDynamicThreshold(ball.Velocity.Magnitude)
    
            if timeToImpact < dynamicThreshold then
                parryButtonPress:Fire()
            end
        end
        heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function()
            checkBallDistance()
        end)
    end
    local function stopAutoParry()
        if heartbeatConnection then
            heartbeatConnection:Disconnect()
            heartbeatConnection = nil
        end
    end
    spawn(function()
        while wait() do
            if _G.AutoParry then
                pcall(function()
                startAutoParry()
                startAutoParry()
                startAutoParry()
                startAutoParry()
                   end)
                end
            end
        end)
        Tab1:AddToggle({
            Name = "Make Server Lag",
            Default = _G.Lag,
            Callback = function(lagduchua)
        _G.lag = lagduchua
         end
        })
        spawn(function()
            while wait() do
                if _G.AutoParry or _G.Lag or _G.AutoParryNew then
                   pcall(function()
                    local args = {
                        [1] = true,
                        [2] = "Empyrean"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CustomEmote:FireServer(unpack(args))
                    local args = {
                        [1] = false,
                        [2] = "Empyrean"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CustomEmote:FireServer(unpack(args))
                    end)
                end
            end
        end)
        Tab1:AddToggle({
            Name = "Auto Vote For Classical Mode",
            Default = _G.AutoVotefirst,
            Callback = function(first)
                _G.AutoVotefirst = first 
         end
        })
        Tab1:AddToggle({
            Name = "Auto Vote For Team 2 Mode",
            Default = _G.AutoVoteSecond,
            Callback = function(second)
                _G.AutoVoteSecond = second
            save()
         end
        })
        Tab1:AddToggle({
            Name = "Auto Vote For Team 4 Mode",
            Default = _G.AutoVoteThirst,
            Callback = function(thirst)
                _G.AutoVoteThirst = thirst
         end
        })
        spawn(function()
            while wait() do
                if _G.AutoVotefirst then
                   pcall(function()
                    local args = {
                        [1] = "ffa"
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpdateVotes"):FireServer(unpack(args))
                   end)
                end
            end
        end)
        spawn(function()
            while wait() do
                if _G.AutoVoteSecond then
                   pcall(function()
                    local args = {
                        [1] = "2t"
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpdateVotes"):FireServer(unpack(args))
                   end)
                end
            end
        end)
        spawn(function()
            while wait() do
                if _G.AutoVoteThirst then
                   pcall(function()
                    local args = {
                        [1] = "4t"
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpdateVotes"):FireServer(unpack(args))
                   end)
                end
            end
        end)