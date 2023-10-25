

require 'require_watcher'
require 'class'

local utf8 = require 'lua-utf8'
local Editor = require 'editor'
local editor = Editor()

function love.load()
  -- enable key repeat so backspace can be held down to trigger love.keypressed multiple times.
  love.keyboard.setKeyRepeat(true)
end

function love.textinput(t)
  editor:textinput(t)
end

function love.keypressed(key)
  editor:keypressed(key)
end

function love.update(dt)
  package.update(dt)
end


function love.draw()
  editor:draw()
end


-- function inherit(target, src...)
local Char = {prototype = {}}
Char.__index = Char

function Char:new(o)
  o = o or {}
  o.__index = Char.prototype
  setmetatable(o, Char)
  assert(o.E, "define editor")
  assert(o.x > 0, "positive x value")
  assert(o.y > 0, "positive y value")
  assert(o.c , "character should be defined")
  return o
end

local Editor = {prototype = {}}
Editor.__index = Editor

function Editor:new(width, height)
  o = o or inherit{
    F = love.graphics.newFont(10),
    C = {},
    w = width,
    h = height,
  }
  setmetatable(o, Editor)
  assert(width > 0, "positive width required")
  assert(height > 0, "positive height required")


  for i=1, width do
    o.C[i] = {}     -- create a new row
    for j=1,height do
      o.C[i][j] = Char:new{x = i, y = j}
    end
  end
  return o
end

-- local char = ' '
-- local txt = love.graphics.newText(font, char)
