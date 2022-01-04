--- Endeavor Chat Tracker
--- written by Keldor
---

----
--- Initialize global Variables
----
EndeavorChatTracker = {}
EndeavorChatTracker.Name = "EndeavorChatTracker"


----
--- Event Functions
----



----
--- OnAddOnLoaded
----
function EndeavorChatTracker.OnAddOnLoaded(_, addonName)

	if addonName ~= EndeavorChatTracker.Name then return end

	EVENT_MANAGER:UnregisterForEvent(EndeavorChatTracker.Name, EVENT_ADD_ON_LOADED)

	EVENT_MANAGER:RegisterForEvent(ChatWindowResizer.Name, EVENT_TIMED_ACTIVITY_PROGRESS_UPDATED, function()
		CHAT_SYSTEM:AddMessage("EVENT_TIMED_ACTIVITY_PROGRESS_UPDATED")
	end)

	EVENT_MANAGER:RegisterForEvent(ChatWindowResizer.Name, EVENT_TIMED_ACTIVITIES_UPDATED, function()
		CHAT_SYSTEM:AddMessage("EVENT_TIMED_ACTIVITIES_UPDATED")
	end)

	EVENT_MANAGER:RegisterForEvent(ChatWindowResizer.Name, EVENT_TIMED_ACTIVITY_SYSTEM_STATUS_UPDATED, function()
		CHAT_SYSTEM:AddMessage("EVENT_TIMED_ACTIVITY_SYSTEM_STATUS_UPDATED")
	end)
end


----
--- AddOn init
----
EVENT_MANAGER:RegisterForEvent(EndeavorChatTracker.Name, EVENT_ADD_ON_LOADED, EndeavorChatTracker.OnAddOnLoaded)
