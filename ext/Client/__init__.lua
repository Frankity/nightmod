class "NightModClient"

Visuals = require "Visuals"
g_Logger = require "__shared/Logger"

function NightModClient:__init()

	self.m_Visuals = Visuals()
	-- self.m_Ui
	
	self.m_OnReadInstance = Events:Subscribe('Partition:ReadInstance', self, self.OnReadInstance)
	self.m_ExtensionLoadedEvent = Events:Subscribe('ExtensionLoaded', self, self.OnLoaded)
	self.m_StateAddedEvent = Events:Subscribe('VE:StateAdded', self, self.OnStateAdded)
	self.m_StateRemovedEvent = Events:Subscribe('VE:StateRemoved', self, self.OnStateRemoved)
	
	g_Logger:Write("Night Mod init.")

end

function NightModClient:OnLoaded()
	self.m_Visuals:OnLoaded()
end

function NightModClient:OnReadInstance(p_Instance, p_Guid)
	self.m_Visuals:OnReadInstance(p_Instance, p_Guid)
	
	-- Client UI Tweaks
	-- self.m_UI:OnReadInstance(p_Instance, p_Guid)
end

function NightModClient:OnStateAdded(p_State)
	self.m_Visuals:OnStateChanged(p_State)
end

function NightModClient:OnStateRemoved(p_State)
	self.m_Visuals:OnStateChanged(p_State)
end

g_NightModClient = NightModClient()