DeriveGamemode("base")

GM.Name = "Grifball"
GM.Author = "Birdboat & Hobo"
GM.Email = ""
GM.Website = "N/A"
GM.TeamBased = true

local TEAM_RED, TEAM_BLUE, TEAM_GRIF, TEAM_SPEC = 1,2,3,4



function GM:Initialize()
	self.BaseClass.Initialize(self)
end

util.PrecacheModel("models/player/lordvipes/h3_spartans_mps/h3spartan_mps_cvp.mdl")

function GM:PlayerSetModel(ply)
	ply:SetModel("models/player/lordvipes/h3_spartans_mps/h3spartan_mps_cvp.mdl")
end

function GM:CreateTeams()
	team.SetUp(TEAM_RED, "Red Team", Color(255,0,0,255))
	team.SetUp(TEAM_BLUE, "Blue Team", Color(0,0,255,255))
	team.SetUp(TEAM_GRIF, "Grif", Color(255,120,15,255))
end

function GM:PlayerInitialSpawn(ply)
	ply:Give("weapon_pistol")
	ply:GiveAmmo(999,"Pistol",true)
end

function GM:PlayerSpawn(ply)
	ply:SetupHands(ply)
end

function GM:PlayerSetHandsModel( ply, ent )

	local simplemodel = player_manager.TranslateToPlayerModelName( ply:GetModel() )
	local info = player_manager.TranslatePlayerHands( simplemodel )
	if ( info ) then
		ent:SetModel( info.model )
		ent:SetSkin( info.skin )
		ent:SetBodyGroups( info.body )
	end

end