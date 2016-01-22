local Users  = require "models.users"
local Bans   = require "models.bans"
local Boards = require "models.boards"

return function(self)
	-- Prepare session names
	self.session.names = self.session.names or {}

	-- Verify Authorization
	if self.session.name then
		local user = Users.get_user(self.session.name)

		if user then
			user.password        = nil
			self.session.admin   = user.admin
			self.session.mod     = user.mod
			self.session.janitor = user.janitor
		else
			self.session.admin   = nil
			self.session.mod     = nil
			self.session.janitor = nil
		end
	else
		self.session.admin   = nil
		self.session.mod     = nil
		self.session.janitor = nil
	end
end
