if minetest.settings:get_bool('profiler.load') then
  local function get_interval()
    return minetest.settings:get('profilerdumper.interval') or 10*60
  end
  local function loop()
    minetest.chatcommands['profiler'].func(nil, 'dump')
    minetest.after(get_interval(), loop)
  end
  minetest.after(get_interval(), loop)
  minetest.log('action', '[profilerdumper] Started with initial interval of ' .. get_interval())
end
