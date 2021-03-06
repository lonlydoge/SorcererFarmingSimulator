local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local Locations = {Endurance15M = CFrame.new(1382.09485, 117.744446, 2953.90503, 1, 0, 0, 0, 1, 0, 0, 0, 1), Water15M = CFrame.new(-324.960297, 289.047607, 617.203613, 0.939688325, -0.342032015, -7.74115324e-06, 0.309976697, 0.851630032, -0.422659129, 0.144569546, 0.397165447, 0.906288743), Endurance150K = CFrame.new(-239.659637, 111.266975, -192.735718, 1, 0, 0, 0, 1, 0, 0, 0, 1), Water500M = CFrame.new(2087.35327, 319.699585, 4075.97559, -0.0307138022, 5.78389558e-09, 0.999528229, 4.68250967e-08, 1, -4.34777014e-09, -0.999528229, 4.66694701e-08, -0.0307138022)}
local Sorted = {}
local Skills = {Water = "SG", ["Endurance"] = {"SG", "Endurance"}}
local EquipList = {Water = "SE", Endurance = "PUI"}
local LocalPlayer = game:GetService("Players").LocalPlayer
getgenv().style = ""
getgenv().Teleport = ""

for i in pairs(Locations) do
    table.insert(Sorted, i)
end

table.sort(Sorted)


local UI = Material.Load({
     Title = "Sorcerer Farming Simulator",
     Style = 1,
     SizeX = 400,
     SizeY = 300,
     Theme = "Dark"
})

function Equip(type_, tFalse)
    local args = {
        [1] = type_,
        [2] = tFalse
    }

    game:GetService("ReplicatedStorage").RSPackage.Events.GeneralFunction:InvokeServer(unpack(args))
end

function Fire(type_, type2)
    local args
    if not type2 then
        print("here")
        args = {
            [1] = type_
        }
    else
        args = {
            [1] = type_,
            [2] = type2
        }
    end

    game:GetService("ReplicatedStorage").RSPackage.Events.GeneralFunction:InvokeServer(unpack(args))
end

local AutoFarmPage = UI.New({
    Title = "Auto Farm"
})

local MiscPage = UI.New({
    Title = "Misc"
})

local Style = AutoFarmPage.Dropdown({
	Text = "Style",
	Callback = function(Value)
		getgenv().style = Value
	end,
	Options = {
		"Water",
		"Endurance"
	}
})

local FarmStyle = AutoFarmPage.Toggle({
    Text = "Auto Farm State",
    Callback = function(Value)
        getgenv().Water = Value
        while getgenv().Water do
            game:GetService("RunService").Heartbeat:wait()
            Equip(EquipList[getgenv().style], true)
            if #Skills[getgenv().style] == 2 and Skills[getgenv().style][2] ~= nil then
                Fire(Skills[getgenv().style][1], Skills[getgenv().style][2])
            else
                Fire(Skills[getgenv().style])
            end
        end
        Equip(EquipList[getgenv().style], false)
    end
})

local Selected = MiscPage.Dropdown({
	Text = "Teleport Where",
	Callback = function(Value)
		getgenv().Teleport = Value
	end,
	Options = Sorted
})

local TeleportTo = MiscPage.Button({
    Text = "Teleport",
    Callback = function()
        LocalPlayer.Character.HumanoidRootPart.CFrame = Locations[getgenv().Teleport]
    end
})

--[[
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local X = Material.Load({
	Title = "ChibuHub",
	Style = 3,
	SizeX = 500,
	SizeY = 350,
	Theme = "Light",
	ColorOverrides = {
		MainFrame = Color3.fromRGB(235,235,235)
	}
})
local Y = X.New({
	Title = "1"
})
local Z = X.New({
	Title = "2"
})
local A = Y.Button({
	Text = "Kill All",
	Callback = function()
		print("hello")
	end,
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "This function can get you banned in up-to-date servers; use at your own risk."
			})
		end
	}
})
local B = Y.Toggle({
	Text = "I'm a switch",
	Callback = function(Value)
		print(Value)
	end,
	Enabled = false
})
local C = Y.Slider({
	Text = "Slip and... you get the idea",
	Callback = function(Value)
		print(Value)
	end,
	Min = 200,
	Max = 400,
	Def = 300
})
local D = Y.Dropdown({
	Text = "Dropping care package",
	Callback = function(Value)
		print(Value)
	end,
	Options = {
		"Floor 1",
		"Floor 2",
		"Floor 3",
		"Floor 4",
		"Floor 5"
	},
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "Test alert!"
			})
		end
	}
})
local E = Y.ChipSet({
	Text = "Chipping away",
	Callback = function(ChipSet)
		table.foreach(ChipSet, function(Option, Value)
			print(Option, Value)
		end)
	end,
	Options = {
		ESP = true,
		TeamCheck = false,
		UselessBool = {
			Enabled = true,
			Menu = {
				Information = function(self)
					X.Banner({
						Text = "This bool has absolutely no purpose whatsoever."
					})
				end
			}
		}
	}
})
local F = Y.DataTable({
	Text = "Chipping away",
	Callback = function(ChipSet)
		table.foreach(ChipSet, function(Option, Value)
			print(Option, Value)
		end)
	end,
	Options = {
		ESP2 = true,
		TeamCheck2 = false,
		UselessBool2 = {
			Enabled = true,
			Menu = {
				Information = function(self)
					X.Banner({
						Text = "This bool ALSO has absolutely no purpose. Sorry."
					})
				end
			}
		}
	}
})
local G = Y.ColorPicker({
	Text = "ESP Colour",
	Default = Color3.fromRGB(0,255,110),
	Callback = function(Value)
		print("RGB:", Value.R * 255, Value.G * 255, Value.B * 255)
	end,
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "This changes the color of your ESP."
			})
		end
	}
})
local H = Y.TextField({
	Text = "Country",
	Callback = function(Value)
		print(Value)
	end,
	Menu = {
		GB = function(self)
			self.SetText("GB")
		end,
		JP = function(self)
			self.SetText("JP")
		end,
		KO = function(self)
			self.SetText("KO")
		end
	}
})
]]
