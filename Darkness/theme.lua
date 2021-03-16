--[[

     Darkness Awesome WM theme 
     github.com/tin-gprieto

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local spotify_widget = require("awesome-wm-widgets.spotify-widget.spotify")
local logout_menu_widget = require("awesome-wm-widgets.logout-menu-widget.logout-menu")
local battery_widget = require("awesome-wm-widgets.battery-widget.battery") --sudo install acpi

local string, os = string, os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.default_dir                               = require("awful.util").get_themes_dir() .. "default"
theme.icon_dir                                  = os.getenv("HOME") .. "/.config/awesome/Darkness/icons"
theme.widget_dir                                = theme.icon_dir .. "/widget"
theme.layout_dir                                = theme.icon_dir .. "/layout"
theme.tag_dir                                   = theme.icon_dir .. "/tag"
theme.battery_dir                               = theme.icon_dir .. "/battery"
theme.wallpaper                                 = os.getenv("HOME") .. "/.config/awesome/Darkness/wallpapers/abstract.png"
theme.font                                      = "Roboto Bold 10"
theme.widget_font                               = "Roboto Bold 9"
theme.calendar_font                             = "Monospace 10"
theme.taglist_font                              = "Roboto Condensed Regular 10"
theme.fg_normal                                 = "#FFFFFF"
theme.fg_focus                                  = "#0099CC"
theme.bg_focus                                  = "#303030"
theme.bg_normal                                 = "#242424"
theme.fg_urgent                                 = "#CC9393"
theme.bg_urgent                                 = "#006B8E"
theme.border_width                              = dpi(3)
theme.border_normal                             = "#252525"
theme.border_focus                              = "#0099CC"
theme.taglist_fg_focus                          = "#FFFFFF"
theme.tasklist_bg_normal                        = "#222222"
theme.tasklist_fg_focus                         = "#4CB7DB"
theme.menu_height                               = dpi(20)
theme.menu_width                                = dpi(160)
theme.menu_icon_size                            = dpi(32)
theme.awesome_icon                              = theme.icon_dir .. "/awesome_icon_white.png"
theme.awesome_icon_launcher                     = theme.icon_dir .. "/awesome_icon.png"
theme.taglist_squares_sel                       = theme.icon_dir .. "/square_sel.png"
theme.taglist_squares_unsel                     = theme.icon_dir .. "/square_unsel.png"
theme.spr_small                                 = theme.icon_dir .. "/spr_small.png"
theme.spr_very_small                            = theme.icon_dir .. "/spr_very_small.png"
theme.spr_right                                 = theme.icon_dir .. "/spr_right.png"
theme.spr_left                                  = theme.icon_dir .. "/spr_left.png"
theme.spr_empty                                 = theme.icon_dir .. "/spr_empty.png"
theme.spr_middle                                = theme.icon_dir .. "/spr_middle.png"
theme.bar                                       = theme.icon_dir .. "/bar.png"
theme.spotify_play                              = theme.widget_dir .. "/spotify_play.png"
theme.spotify_pause                             = theme.widget_dir .. "/spotify_pause.png"
theme.vol                                       = theme.widget_dir .. "/volume.svg"
theme.net                                       = theme.widget_dir .. "/net.svg"
theme.clock                                     = theme.widget_dir .. "/clock.svg"
theme.calendar                                  = theme.widget_dir .. "/cal.svg"
theme.cpu                                       = theme.widget_dir .. "/cpu.svg"
theme.mem                                       = theme.widget_dir .. "/mem.svg"
theme.temp                                      = theme.widget_dir .. "/temp.svg"
theme.disk                                      = theme.widget_dir .. "/disk.svg"
theme.net_up                                    = theme.widget_dir .. "/net_up.svg"
theme.net_down                                  = theme.widget_dir .. "/net_down.svg"
theme.layout_tile                               = theme.layout_dir .. "/tile.png"
theme.layout_tileleft                           = theme.layout_dir .. "/tileleft.png"
theme.layout_tilebottom                         = theme.layout_dir .. "/tilebottom.png"
theme.layout_tiletop                            = theme.layout_dir .. "/tiletop.png"
theme.layout_fairv                              = theme.layout_dir .. "/fairv.png"
theme.layout_fairh                              = theme.layout_dir .. "/fairh.png"
theme.layout_spiral                             = theme.layout_dir .. "/spiral.png"
theme.layout_dwindle                            = theme.layout_dir .. "/dwindle.png"
theme.layout_max                                = theme.layout_dir .. "/max.png"
theme.layout_magnifier                          = theme.layout_dir .. "/magnifier.png"
theme.layout_floating                           = theme.layout_dir .. "/floating.png"
theme.tag_term                                  = theme.tag_dir .. "/terminal.svg"
theme.tag_dev                                   = theme.tag_dir .. "/dev.svg"
theme.tag_docs                                  = theme.tag_dir .. "/docs.svg"
theme.tag_web                                   = theme.tag_dir .. "/web.svg"
theme.tag_music                                 = theme.tag_dir .. "/music.svg"
theme.tag_other                                 = theme.tag_dir .. "/other.svg"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = dpi(4)

-- Launcher
local mylauncher = awful.widget.button({ image = theme.awesome_icon_launcher })
mylauncher:connect_signal("button::press", function() awful.util.mymainmenu:toggle() end)

-- Separators
local first = wibox.widget.textbox('<span font="Roboto 7"> </span>')
local spr_small = wibox.widget.imagebox(theme.spr_small)
local spr_very_small = wibox.widget.imagebox(theme.spr_very_small)
local spr_right = wibox.widget.imagebox(theme.spr_right)
local spr_left = wibox.widget.imagebox(theme.spr_left)
local spr_empty = wibox.widget.imagebox(theme.spr_empty)
local spr_middle = wibox.widget.imagebox(theme.spr_middle)
local bar = wibox.widget.imagebox(theme.bar)


local markup = lain.util.markup
local blue   = "#80CCE6"

-- Clock
local mytextclock = wibox.widget.textclock(markup(theme.fg_normal, " %H:%M     "))
mytextclock.font = theme.font
local clock_icon = wibox.widget.imagebox(theme.clock)
local clockbg = wibox.container.background(mytextclock, theme.bg_focus, gears.shape.rectangle)
local clockwidget = wibox.container.margin(clockbg, dpi(0), dpi(3), dpi(5), dpi(5))

-- Calendar
local mytextcalendar = wibox.widget.textclock(markup.fontfg(theme.font, theme.fg_normal, " %d %b "))
local calendar_icon = wibox.widget.imagebox(theme.calendar)
local calbg = wibox.container.background(mytextcalendar, theme.bg_focus, gears.shape.rectangle)
local calendarwidget = wibox.container.margin(calbg, dpi(0), dpi(0), dpi(5), dpi(5))
theme.cal = lain.widget.cal({
    attach_to = { mytextclock, mytextcalendar },
    notification_preset = {
        fg = theme.fg_normal,
        bg = theme.bg_normal,
        position = "top_right",
        font = theme.calendar_font,
    }
})

--fs
local fs_icon = wibox.widget.imagebox(theme.disk)
--FALTA

--Spotify

-- ALSA volume bar
local volume_icon = wibox.widget.imagebox(theme.vol)
theme.volume = lain.widget.alsabar({
    notification_preset = { font = theme.widget_font},
    --togglechannel = "IEC958,3",
    width = dpi(80), height = dpi(10), border_width = dpi(0),
    colors = {
        background = "#383838",
        unmute     = "#80CCE6",
        mute       = "#FF9F9F"
    },
})
theme.volume.bar.paddings = dpi(0)
theme.volume.bar.margins = dpi(5)
local volumewidget = wibox.container.background(theme.volume.bar, theme.bg_focus, gears.shape.rectangle)
volumewidget = wibox.container.margin(volumewidget, dpi(0), dpi(0), dpi(5), dpi(5))

-- CPU
local cpu_icon = wibox.widget.imagebox(theme.cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.font(theme.widget_font, " CPU " .. cpu_now.usage .. "% "))
    end
})
local cpubg = wibox.container.background(cpu.widget, theme.bg_focus, gears.shape.rectangle)
local cpuwidget = wibox.container.margin(cpubg, dpi(0), dpi(0), dpi(5), dpi(5))

-- MEM
local mem_icon = wibox.widget.imagebox(theme.mem)
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(theme.widget_font, " " .. mem_now.used .. "MB "))
    end
})
local membg = wibox.container.background(mem.widget, theme.bg_focus, gears.shape.rectangle)
local memwidget = wibox.container.margin(membg, dpi(0), dpi(0), dpi(5), dpi(5))

-- Coretemp (lain, average)
local temp_icon = wibox.widget.imagebox(theme.temp)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.font(theme.widget_font, " " .. coretemp_now .. "°C "))
    end
})
local tempbg = wibox.container.background(temp.widget, theme.bg_focus, gears.shape.rectangle)
local tempwidget = wibox.container.margin(tempbg, dpi(0), dpi(0), dpi(5), dpi(5))

-- Net
local net_icon = wibox.widget.imagebox(theme.net)
local netdown_icon = wibox.widget.imagebox(theme.net_down)
local netup_icon = wibox.widget.imagebox(theme.net_up)
local net = lain.widget.net({
    settings = function()
        widget:set_markup(markup.font(theme.widget_font, net_now.received .. " - "
                          .. net_now.sent))
    end
})
local netbg = wibox.container.background(net.widget, theme.bg_focus, gears.shape.rectangle)
local networkwidget = wibox.container.margin(netbg, dpi(0), dpi(0), dpi(5), dpi(5))

local barcolor  = gears.color({
    type  = "linear",
    from  = { dpi(32), 0 },
    to    = { dpi(32), dpi(32) },
    stops = { {0, theme.bg_focus}, {0.25, "#505050"}, {1, theme.bg_focus} }
})

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    --Layouts

    awful.layout.layouts = {
        awful.layout.suit.tile,         --1
        awful.layout.suit.floating,     --2
        awful.layout.suit.spiral,       --3
        awful.layout.suit.max,          --4
    }

    -- Tags

    local tags = {
        names ={ "TERM", "DEV", "DOCS", "WEB", "MUSIC" , "OTRO" },
        icons = {theme.tag_term, theme.tag_dev, theme.tag_docs, theme.tag_web, theme.tag_music, theme.tag_other},
    }
    
    awful.util.tagnames = tags.names
    
    --[[ Without icons
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])
    --]]

    --{{ With icons

        for i,v in ipairs(tags.icons) do
            awful.tag.add( "", {
                icon = v,
                layout = awful.layout.layouts[1],
                screen = s,
            })
        end
    --}}

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons, { bg_focus = barcolor })

    mytaglistcont = wibox.container.background(s.mytaglist, theme.bg_focus, gears.shape.rectangle)
    s.mytag = wibox.container.margin(mytaglistcont, dpi(0), dpi(0), dpi(5), dpi(5))

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons, { bg_focus = theme.bg_focus, shape = gears.shape.rectangle, shape_border_width = 5, shape_border_color = theme.tasklist_bg_normal, align = "center" })

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(32) })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            spr_empty,
            mylauncher,
            spr_empty,
            first,
            s.mytag,
            bar,
            s.mylayoutbox,
            bar,
            s.mypromptbox,
        },
	    {-- Middle widget
            layout = wibox.layout.fixed.horizontal,
            spr_middle,
            spotify_widget({
                    font = theme.font,
                    play_icon = theme.spotify_play,
                    pause_icon = theme.spotify_pause,
                    max_length = 60,
                    show_tooltip = false
                }),
        }, 
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            bar,
            volume_icon,
            volumewidget,
            bar,
            calendar_icon,
            calendarwidget,
            bar,
            clock_icon,
            clockwidget,
            --[[ Info bateria para Notebooks
            bar,
            battery_widget({
                font = theme.widget_font,
                path_to_icons = theme.battery_dir,
                show_current_level = true,
            }),
            bar,
            --]]
            spr_empty,
            logout_menu_widget(),
            spr_empty,
        },
    }

    -- Create the bottom wibox
    s.mybottomwibox = awful.wibar({ position = "bottom", screen = s, border_width = dpi(0), height = dpi(32) })
    s.borderwibox = awful.wibar({ position = "bottom", screen = s, height = dpi(1), bg = theme.fg_focus, x = dpi(0), y = dpi(33)})

    -- Add widgets to the bottom wibox
    s.mybottomwibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            spr_empty,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            spr_empty,            
            bar,
	        cpu_icon,
            cpuwidget,
	        bar,
	        mem_icon,
            memwidget,
            bar,
            temp_icon,
            tempwidget,
            bar,
            net_icon,
            netdown_icon,
            networkwidget,
            netup_icon,
	        bar,
            spr_empty,
            
        },
    }
end

return theme
