-- XY 脚本中心 · 云端载入器
-- 用法：loadstring(game:HttpGet("https://raw.githubusercontent.com/fhuev12/xy-hub/main/loader.lua"))()
-- 本体已加密，放在 CDN 上；这个文件只负责把本体拉下来执行
local SRC = "https://aka.doubaocdn.com/s/MnUVTaWjeY"
local ok, body = pcall(function()
    return game:HttpGet(SRC, true)     -- 第二个参数：允许跟随跳转
end)
if not ok or type(body) ~= "string" or #body < 1000 then
    warn("[XY] 拉取失败：" .. tostring(body))
    return
end
local compile = loadstring or load
if type(compile) ~= "function" then
    warn("[XY] 这个执行器没有 loadstring")
    return
end
local chunk, err = compile(body, "XY_Hub_Cloud")
if not chunk then
    warn("[XY] 编译失败：" .. tostring(err))
    return
end
chunk()
