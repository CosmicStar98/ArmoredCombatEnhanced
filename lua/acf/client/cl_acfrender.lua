
---------------- ACE2 Damage Material rendering ----------------
do
	local ACF_HealthRenderList = {}

	local Damaged = {
		CreateMaterial("ACF_Damaged1", "VertexLitGeneric", {["$basetexture"] = "damaged/damaged1"}),
		CreateMaterial("ACF_Damaged2", "VertexLitGeneric", {["$basetexture"] = "damaged/damaged2"}),
		CreateMaterial("ACF_Damaged3", "VertexLitGeneric", {["$basetexture"] = "damaged/damaged3"})
	}

	hook.Add("PostDrawOpaqueRenderables", "ACF_RenderDamage", function()
		if not ACF_HealthRenderList then return end

		cam.Start3D( EyePos(), EyeAngles() )

			for k,ent in pairs( ACF_HealthRenderList ) do
				if not IsValid(ent) then
					ACF_HealthRenderList[k] = nil
					continue
				end

				render.ModelMaterialOverride( ent.ACF_Material )
				render.SetBlend( math.Clamp( 1 - ent.ACF_HealthPercent,0,0.8) )
				ent:DrawModel()

			end
			render.ModelMaterialOverride()
			render.SetBlend(1)
		cam.End3D()
	end)

	net.Receive("ACF_RenderDamage", function()

		local Index = net.ReadUInt(13)
		local Entity = ents.GetByIndex( Index )

		if IsValid(Entity) then

			local MaxHealth = net.ReadFloat()
			local Health = net.ReadFloat()

			if math.Round(MaxHealth) == math.Round(Health) then
				ACF_HealthRenderList[Entity:EntIndex()] = nil
				return
			end

			Entity.ACF_Health = Health
			Entity.ACF_MaxHealth = MaxHealth
			Entity.ACF_HealthPercent = (Health / MaxHealth)

			if Entity.ACF_HealthPercent > 0.7 then
				Entity.ACF_Material = Damaged[1]
			elseif Entity.ACF_HealthPercent > 0.3 then
				Entity.ACF_Material = Damaged[2]
			elseif Entity.ACF_HealthPercent <= 0.3 then
				Entity.ACF_Material = Damaged[3]
			end

			ACF_HealthRenderList[Entity:EntIndex()] = Entity

		end
	end)
end
---------------- ACE2 Light renders ----------------
do
	local function CanEmitLight(lightSize)

		local minLightSize = GetConVar("acf_enable_lighting"):GetFloat()

		if minLightSize == 0 then return false end
		if lightSize == 0 then return false end

		return true
	end

	--[[
		ACF_RenderLight(idx, lightSize, colour, pos, duration)

		- idx		: the index of this light. Use the entity index, or 0 for the world.
		- lightSize	: sets the scale size factor of the light.
		- colour	: the color of this light
		- pos 		: the position
		- duration	: the duration, in seconds, that this light will stand before turning off.
	]]
	function ACF_RenderLight(idx, lightSize, colour, pos, duration)
		if not CanEmitLight(lightSize) then return end

		local dlight = DynamicLight( idx )
		if dlight then

			local c             = colour or Color(255, 128, 48)
			local Brightness    = lightSize * 0.00018

			dlight.Pos          = pos
			dlight.r            = c.r
			dlight.g            = c.g
			dlight.b            = c.b
			dlight.Brightness   = Brightness
			dlight.Decay        = 1000 / 0.1
			dlight.Size         = lightSize
			dlight.DieTime      = CurTime() + (duration or 0.05)

		end
	end
end

