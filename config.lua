-----------------------------------------------------------------------------
-- Belial web waf
-- Author: 逆雪寒
-- Copyright (c) 2013 半夜三更
-- 
-- 安装说明
-- 
-- 
-----------------------------------------------------------------------------

local Conf = {
-----------------------------------------------------------------------------
-- 全局选项
	rootDirectory = "/data/", -- belial lua代码所在的目录
	belialFileLogPath = "/data/cake/log.belial", --  日志的目录
	isBackend = true, -- 如果 belial waf 位于后端 那就true。否则得到的请求IP获取不准确
	attackHtmlPageName = "", --自定义拦截页面 文件路径  例如:/data/belial.html
	toLog = "On", -- 攻击信息是否纪录到日志文件

-----------------------------------------------------------------------------
--文件上传模块

	allowUploadFileExtension = {".jpg",".jpeg",".bmp",".gif",".png"}, --允许上传的扩展名
	
-----------------------------------------------------------------------------
--cookie过滤模块
	cookieMatch = "On",  -- 是否对cookie进行关键字匹配判断
	
-----------------------------------------------------------------------------
--post过滤模块
	postMatch   = "On",   -- 是否对post请求进行关键字匹配判断
	
-----------------------------------------------------------------------------	
--	post白名单模块

	whiteModule = "On",
	
--	是否开启收集,可以先开启 收集个几天，然后获得大部分得post白名单之后再关闭。
--	注意：只有 whiteModule = "On" 和 getTogether = "Off" 后 白名单拦截机制才正式启动

	getTogether = "Off",
	
	webProjectRootDirectory = "/usr/local/www/nginx", --你网站的www目录(根目录) *记得不带斜杠(/)
	allowAccessPostFilePath = "/data/allow.belial", -- 白名单,一个记录一行
	rejectPostLogPath = "/data/cake/reject.belial", -- post被拦截的记录
	
-----------------------------------------------------------------------------
-- nginx 畸形路径解释防御

	ngxPathInfoFixModule = "On", 

-----------------------------------------------------------------------------
--全局放行的ip，比如你公司的IP
	allowIpAccess = {"10.211.55.1"}, --不受拦截ip
	
-----------------------------------------------------------------------------
--禁止访问的IP列表
	denyIPAccess = "/data/denyAccess.ip",--被禁止的IP访问列表
	
-----------------------------------------------------------------------------
-- 自动拦截：根据攻击次数和访问频率进行拦截
	autoDenyIpModule = "On", -- On 开启   Off关闭
	accessFrequencySecond = 1, --访问频率 ,达到这个数量就启动计数
	attackAmount = 20, --HACK次数
	autoDenyRuleExptimeSecond = 120 -- 规则存在的有效时间 秒单位

}

return Conf