--[[
function Hud()
	local client = LocalPlayer()
	
	if ! client:Alive() then
		return
	end
	
	draw.RoundedBox(0, 0, ScrH() - 100, 250, 100, Color(50, 50, 50), 230)
	
	draw.SimpleText("Health: " .. client:Health(), "DermaDefaultBold", 10, ScrH() - 90, Color(255, 255, 255, 255), 0, 0)
	draw.SimpleText("Armor: " .. client:Armor(), "DermaDefaultBold", 10, ScrH() - 55, Color(255, 255, 255, 255), 0, 0)
	
	draw.RoundedBox(0, 10, ScrH() - 75, math.Clamp(client:Health(), 0, 100) * 2.25, 15, Color(0, 255, 0, 255))
	draw.RoundedBox(0, 10, ScrH() - 40, math.Clamp(client:Armor(), 0, 100) * 2.25, 15, Color(0, 0, 255, 255))
end
hook.Add("HUDPaint", "TestHud", Hud)

function hideHud(name)
	for k, v in pairs({"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo"}) do
		if name == v then
			return false
		end
	end
end
hook.Add("HUDShouldDraw", "HideDefaultHud", hideHud)
--]]