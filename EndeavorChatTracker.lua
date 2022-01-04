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
function EndeavorChatTracker.OnTimedActivityProgressUpdate(_, index, _, currentProgress)

	local name = GetTimedActivityName(index)
	local maxProgress = GetTimedActivityMaxProgress(index)

	CHAT_SYSTEM:AddMessage(name .. " (|c00C000" .. currentProgress .. " / " .. maxProgress .. "|r)")
end




----
--- OnAddOnLoaded
----
function EndeavorChatTracker.OnAddOnLoaded(_, addonName)

	if addonName ~= EndeavorChatTracker.Name then return end

	EVENT_MANAGER:UnregisterForEvent(EndeavorChatTracker.Name, EVENT_ADD_ON_LOADED)
	EVENT_MANAGER:RegisterForEvent(EndeavorChatTracker.Name, EVENT_TIMED_ACTIVITY_PROGRESS_UPDATED, EndeavorChatTracker.OnTimedActivityProgressUpdate)
end


----
--- AddOn init
----
EVENT_MANAGER:RegisterForEvent(EndeavorChatTracker.Name, EVENT_ADD_ON_LOADED, EndeavorChatTracker.OnAddOnLoaded)
