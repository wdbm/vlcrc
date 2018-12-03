-- https://forum.videolan.org/viewtopic.php?t=137618 --

function descriptor()
   return {
      title = "Pop-Out Playback Speed Control",
      capabilities = {"meta-listener"}
   }
end

function activate()
   Create_dialog()
   click_Rate(0)
end

function deactivate()
   vlc.var.set(input, "rate", 1)
end

function meta_changed()
   click_Rate(0)
end

--- Dialog box ---
function close()
   vlc.deactivate()
end

function Create_dialog()
   d = vlc.dialog(descriptor().title)
   d:add_label("+/- Step Size:",1,1,1,1)
   ti_step = d:add_text_input("0.01",2,1,2,1)
   d:add_button("<< Slower", function() click_Rate(-1) end, 1,2,1,1)
   d:add_button("Normal (1.00)", function() click_Rate(0) end, 2,2,1,1)
   d:add_button("Faster >>", function() click_Rate(1) end, 3,2,1,1)
end

rate=1
function click_Rate(dir)
   local input=vlc.object.input()
   if input then
      if dir==0 then
         rate=1
      else
         rate=rate+dir*tonumber(ti_step:get_text())
      end
      vlc.var.set(input, "rate", rate)
      --
      crate=vlc.var.get(input,"rate")
      if rate==1 then
         d:set_title("Speed = 1.00")
      else
         d:set_title("Speed = " .. rate .. " (" .. crate .. ")")
      end
   end
end
