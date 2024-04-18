Config = {}

-- 冷却时间（分钟）
Config.Cooldown = 10

-- 直到投放的时间（分钟）
Config.TimeUntilDrop = 5

-- 所需警察在线人数
Config.RequiredCops = 5

-- 警察职业
Config.PoliceJobs = {"police", "sheriff"}

-- 要加载的模型
Config.LoadModels = {
    "prop_air_carrier_cargo_01a",
    "prop_mb_cargo_04a",
    "w_am_flare", 
    "p_cargo_chute_s", 
    "ex_prop_adv_case_sm",
    "cuban800", 
    "s_m_m_pilot_02",
    -- 需要时可以添加更多模型
}

-- 飞机模型
Config.PlaneModel = "cuban800"

-- 飞行员模型
Config.PlanePilotModel = "s_m_m_pilot_02"

-- 箱子模型
Config.CrateModel = "ex_prop_adv_case_sm"

-- 降落伞模型
Config.ParachuteModel = "p_cargo_chute_s"

-- 信号弹名称
Config.FlareName = "weapon_flare"
Config.FlareModel = "w_am_flare" -- 信号弹武器的模型

-- 物品掉落配置
Config.ItemDrops = {
    goldenphone = {
        { name = "金条", amount = 10 },
        { name = "钻石", amount = 5 },
    },
    redphone = {
        { name = "现金", amount = 5000 },
        { name = "金条", amount = 5 },
    },
    greenphone = {
        { name = "大麻", amount = 10 },
        { name = "可卡因", amount = 5 },
    },
}

-- 目标设置
Config.TargetName = "ox_target"  -- 更改为您的目标资源名称
Config.TargetIcon = "fas fa-box"  -- 示例：FontAwesome 图标名称
Config.TargetLabel = "打开箱子" -- 箱子操作标签

-- 语言设置（您可以根据需要更改）
Config.Lang = {
    item_recieved = "您获得了一个物品。",
    pilot_dropping_soon = "飞行员即将投放货物。",
    crate_dropping = "货物从飞机投放。",
    pilot_contact = "飞行员已联系。",
    pilot_crashed = "飞行员已坠毁。",
    no_cops = "在线警察不足。",
}
