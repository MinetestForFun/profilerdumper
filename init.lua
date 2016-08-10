if minetest.chatcommands['profiler'] then
  local function get_interval()
    return minetest.setting_get('profilerdumper.interval') or 10*60
  end
  local function loop()
    minetest.chatcommands['profiler'].func(nil, 'dump')
    minetest.after(get_interval(), loop)
  end
  minetest.after(get_interval(), loop)
  minetest.log('action', '[profilerdumper] Started with initial interval of ' .. get_interval())
end
