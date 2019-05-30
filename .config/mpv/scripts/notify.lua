lastcommand = nil
function string.shellescape(str)
   return "'"..string.gsub(str, "'", "'\"'\"'").."'"
end

function do_notify(a)
   local ytCommand = "youtube-dl --skip-download --no-warnings --get-title  https://youtu.be/" .. a
   local getTitle = io.popen(ytCommand)
   
   
   local command = ("dunstify -r 120 -i /home/geeray/media/wallpapers/icons/doremi.png 'Now Playing:' -- '%s'"):format(getTitle:read("*all"))
   if command ~= lastcommand then
      os.execute(command)
      lastcommand = command
   end
end

function notify_current_track()
   data = mp.get_property_native("metadata")
   if data then
      local artist = (data["ARTIST"] or data["artist"] or " ")
      local title = (data["TITLE"] or data["title"] or " ")
      if artist..title~="  " then
         do_notify(title)
         return
      end
   end
   local data = mp.get_property("path")
   if data then
      local file = data:gsub("^.-([^/]+)$","%1")
      file = file:gsub("%....$","") -- delete 3 char suffix
      local dir = data:gsub("^.-([^/]+)/[^/]*$","%1")
      do_notify(file)
   end
end

mp.register_event("file-loaded", notify_current_track)
