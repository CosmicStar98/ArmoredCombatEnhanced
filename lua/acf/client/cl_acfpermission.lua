-- Code modified from the NADMOD client permissions menu, by Nebual
-- http://www.facepunch.com/showthread.php?t=1221183

ACF = ACF or {}
ACF.Permissions = ACF.Permissions or {}
local this = ACF.Permissions

local getPanelChecks = function() return {} end



net.Receive("ACF_refreshfriends", function()
	--Msg("\ncl refreshfriends\n")
	local perms = net.ReadTable()
	local checks = getPanelChecks()

	--PrintTable(perms)

	for _, check in pairs(checks) do
		if perms[check.steamid] then
			check:SetChecked(true)
		else
			check:SetChecked(false)
		end
	end

end)



net.Receive("ACF_refreshfeedback", function()
	local success = net.ReadBit()
	local str, notify

	if success then
		str = "Successfully updated your ACE2 damage permissions!"
		notify = NOTIFY_GENERIC
	else
		str = "Failed to update your ACE2 damage permissions."
		notify = NOTIFY_ERROR
	end

	notification.AddLegacy(str, notify, 7)
end)



function this.ApplyPermissions(checks)
	perms = {}

	for _, check in pairs(checks) do
		if not check.steamid then Error("Encountered player checkbox without an attached SteamID!") end
		perms[check.steamid] = check:GetChecked()
	end

	net.Start("ACF_dmgfriends")
		net.WriteTable(perms)
	net.SendToServer()
end



function this.ClientPanel(Panel)

	if IsValid(Panel) then Panel:Clear() end

	if not this.ClientCPanel then this.ClientCPanel = Panel end
	Panel:SetName("ACF2 Damage Permissions")

	local txt = Panel:Help("ACF2 Damage Permission Panel")
	txt:SetContentAlignment( TEXT_ALIGN_CENTER )
	txt:SetFont("DermaDefaultBold")
	--txt:SetAutoStretchVertical(false)
	--txt:SetHeight

	local txt = Panel:Help("Allow or deny ACF2 damage to your props using this panel.\n\nThese preferences only work during the Build and Strict Build modes.")
	txt:SetContentAlignment( TEXT_ALIGN_CENTER )
	--txt:SetAutoStretchVertical(false)

	Panel.playerChecks = {}
	local checks = Panel.playerChecks

	getPanelChecks = function() return checks end

	local Players = player.GetAll()
	for _, tar in pairs(Players) do
		if IsValid(tar) then
			local check = Panel:CheckBox(tar:Nick())
			check.steamid = tar:SteamID()
			--if tar == LocalPlayer() then check:SetChecked(true) end
			checks[#checks + 1] = check
		end
	end
	local button = Panel:Button("Give Damage Permission")
	button.DoClick = function() this.ApplyPermissions(Panel.playerChecks) end

	net.Start("ACF_refreshfriends")
		net.WriteBit(true)
	net.SendToServer(ply)
end



function this.SpawnMenuOpen()
	if this.ClientCPanel then
		this.ClientPanel(this.ClientCPanel)
	end
end
hook.Add("SpawnMenuOpen", "ACFPermissionsSpawnMenuOpen", this.SpawnMenuOpen)



function this.PopulateToolMenu()
	spawnmenu.AddToolMenuOption("Utilities", "ACE2", "Damage Permission", "Damage Permission", "", "", this.ClientPanel)
end
hook.Add("PopulateToolMenu", "ACFPermissionsPopulateToolMenu", this.PopulateToolMenu)
