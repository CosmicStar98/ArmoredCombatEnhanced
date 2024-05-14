
local ClassName = "GPS"


ACF = ACF or {}
ACF.Guidance = ACF.Guidance or {}

local this = ACF.Guidance[ClassName] or inherit.NewSubOf(ACF.Guidance.Wire)
ACF.Guidance[ClassName] = this

this.Name = ClassName

-- An entity with a Position wire-output
this.InputSource = nil

this.desc = "This guidance package recieves a one-time position and guides to it regardless of LOS."

-- Disables guidance when true
this.FirstGuidance = true


function this:Init()

end




function this:Configure(missile)

	self:super().Configure(self, missile)

	self.FirstGuidance = true

end

function this:GetGuidance(missile)

	if self.FirstGuidance then

	local launcher = missile.Launcher

		if not IsValid(launcher) then
			return {}
		end

		local posVec = launcher.TargPos

		if not posVec or type(posVec) ~= "Vector" or posVec == Vector() then
			return {TargetPos = nil}
		end

		self.FirstGuidance = false
		self.TargetPos = posVec
	end

	return {TargetPos = self.TargetPos, ViewCone = self.ViewCone}

end

--Another Stupid Workaround. Since guidance degrees are not loaded when ammo is created
function this:GetDisplayConfig(_)

	return
	{
		["Tracking"] = "Single Position"
	}
end