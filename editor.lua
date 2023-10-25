local class = require("class")

local Char = class('Char')
Char.i = 0

function Char:render()
  love.graphics.draw(self.txt, self.x, self.y) -- r, sx, sy, ox, oy, kx, ky)
end

local TxtArea = class('TxtArea')
TxtArea.txt = _VERSION .. " type away: "
TxtArea.chars = {}


function TxtArea:textinput(t)
  self.txt = self.txt .. t
end

function TxtArea:recalc()
  local txt = {}
  for i,v in ipairs(self.chars) do
    table.insert(txt, v.i)
  end
end

function TxtArea:keypressed(key)
  if key == "backspace" then
    -- get the byte offset to the last UTF-8 character in the string.
    local byteoffset = utf8.offset(self.txt, -1)

    if byteoffset then
      -- remove the last UTF-8 character.
      -- string.sub operates on bytes rather than UTF-8 characters, so we couldn't do string.sub(text, 1, -2).
      self.txt = string.sub(self.txt, 1, byteoffset - 1)
    end
  end
end

function TxtArea:draw()
  love.graphics.printf(self.txt, 0, 0, love.graphics.getWidth())
end

return TxtArea
