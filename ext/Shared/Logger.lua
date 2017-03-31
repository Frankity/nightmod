class "Logger"

function Logger:__init()
	print("Logger Init")
end

function Logger:Write(p_Message)
	print("[NigthMod] : " .. p_Message)
end

return Logger