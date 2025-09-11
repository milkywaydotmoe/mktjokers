SMODS.Sound {
    key = "dreaming_days_music",
    path = "DreamingDays(Midnight_ver).ogg",
    select_music_track = function(self)
        if G.GAME.blind and G.GAME.blind.config.blind.key == "bl_mktjk_dvd" then
            return 10
        end
    end,
    sync = false,
    pitch = 1,
    volume = 0.8
}

MKTJK_dvd_stuff = {}

local DVD_icon_file = assert(NFS.newFileData(mktjk.path .. "assets/misc/DVD_icon.png"))
local DVD_icon_data = assert(love.image.newImageData(DVD_icon_file))
MKTJK_dvd_stuff.DVD_ICON_SPRITE = assert(love.graphics.newImage(DVD_icon_data))

MKTJK_dvd_stuff.curr_color = {1,1,1,1}
MKTJK_dvd_stuff.in_dvd = false
MKTJK_dvd_stuff.timer = 0
MKTJK_dvd_stuff.x_pos = love.graphics.getWidth()/2
MKTJK_dvd_stuff.y_pos = love.graphics.getHeight()/2
MKTJK_dvd_stuff.angle = (math.random() + 0.5) * math.pi / 4
MKTJK_dvd_stuff.velocity_vector = {dx = 0, dy = 0}

SMODS.Blind {
    key = "dvd",
    loc_vars = function(self)
        return {key = next(SMODS.find_mod("Yahimod")) and "bl_mktjk_dvd_alt" or nil}
    end,
    atlas = "blinds",
    pos = { x = 0, y = 0 },
    boss = {min = 1},
    boss_colour = HEX("A6A6A6"),
    set_blind = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                MKTJK_dvd_stuff.x_pos = love.graphics.getWidth()/2
                MKTJK_dvd_stuff.y_pos = love.graphics.getHeight()/2
                MKTJK_dvd_stuff.in_dvd = true
                MKTJK_dvd_stuff.timer = 0
                MKTJK_dvd_stuff.angle = (math.random() + 0.5) * math.pi / 4
                MKTJK_dvd_stuff.velocity_vector = {dx = 130 * math.cos(MKTJK_dvd_stuff.angle), dy = 130 * math.sin(MKTJK_dvd_stuff.angle)}
                G.E_MANAGER:add_event(Event({
                    trigger = "immediate",
                    func = function()
                        return not MKTJK_dvd_stuff.in_dvd
                    end
                }))
                return true
            end
        }))
    end,
    disable = function(self)
        MKTJK_dvd_stuff.in_dvd = false
    end
}

local draw_hook = love.draw
function love.draw()
    draw_hook()
    local width, height = love.graphics.getDimensions()
    local x_factor = width / 1536
    local y_factor = height / 864
    if MKTJK_dvd_stuff.in_dvd and G.GAME.blind and G.GAME.blind.config.blind.key == "bl_mktjk_dvd" then
        MKTJK_dvd_stuff.x_pos = MKTJK_dvd_stuff.x_pos + G.real_dt * MKTJK_dvd_stuff.velocity_vector.dx
        MKTJK_dvd_stuff.y_pos = MKTJK_dvd_stuff.y_pos + G.real_dt * MKTJK_dvd_stuff.velocity_vector.dy
        MKTJK_dvd_stuff.timer = MKTJK_dvd_stuff.timer + G.real_dt
        if MKTJK_dvd_stuff.x_pos > 1375 or MKTJK_dvd_stuff.x_pos < 166 then
            MKTJK_dvd_stuff.velocity_vector.dx = -MKTJK_dvd_stuff.velocity_vector.dx
            MKTJK_dvd_stuff.x_pos = MKTJK_dvd_stuff.x_pos > 1370 and 1370 or 166
            MKTJK_dvd_stuff.curr_color = {math.random(), math.random(), math.random(), 1}
        end
        if MKTJK_dvd_stuff.y_pos > 790.5 or MKTJK_dvd_stuff.y_pos < 75.5 then
            MKTJK_dvd_stuff.velocity_vector.dy = -MKTJK_dvd_stuff.velocity_vector.dy
            MKTJK_dvd_stuff.y_pos = MKTJK_dvd_stuff.y_pos > 788.5 and 788.5 or 75.5
            MKTJK_dvd_stuff.curr_color = {math.random(), math.random(), math.random(), 1}
        end
        if (MKTJK_dvd_stuff.x_pos < 15 and MKTJK_dvd_stuff.y_pos < 5) or
            (MKTJK_dvd_stuff.x_pos < 15 and MKTJK_dvd_stuff.y_pos > 775.5) or
            (MKTJK_dvd_stuff.x_pos > 1360 and MKTJK_dvd_stuff.y_pos < 5) or
            (MKTJK_dvd_stuff.x_pos > 1360 and MKTJK_dvd_stuff.y_pos > 775.5) then
                MKTJK_dvd_stuff.in_dvd = false
                G.E_MANAGER:add_event(Event({
                    blocking = false,
                    func = function()
                        if G.STATE == G.STATES.SELECTING_HAND then
                            G.GAME.chips = G.GAME.blind.chips
                            G.STATE = G.STATES.HAND_PLAYED
                            G.STATE_COMPLETE = true
                            end_round()
                            return true
                        end
                        return false
                    end
                }))
        end
        if MKTJK_dvd_stuff.timer > 600 then
            MKTJK_dvd_stuff.in_dvd = false
        end
        love.graphics.setColor(MKTJK_dvd_stuff.curr_color)
        love.graphics.draw(
            MKTJK_dvd_stuff.DVD_ICON_SPRITE,
            MKTJK_dvd_stuff.x_pos * x_factor,
            MKTJK_dvd_stuff.y_pos * y_factor,
            0,
            x_factor,
            y_factor,
            166,
            75.5,
            0,
            0
        )
    end
end