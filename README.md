# bigsea-airdrop
![11231](https://github.com/GTAbigsea/bigsea-airdrop/assets/92125012/fa933e8e-7dfc-4b55-8ebc-674f698c75b7)
这是一个相当简单的脚本，您使用三个电话物品中的一个，一架飞机将飞过您的位置并放下一个板条箱，其中包含您在配置中设置的任何战利品。
这最初是 cad-gundrop（链接如下），
但已针对我正在开发的服务器进行了编辑，以在所有玩家之间完全同步箱子，包括全局冷却
（因此空投不会被垃圾邮件发送）和 Polyzone 创建在投放区域周围，在进入时通知红区人员。
常见问题
如果您正在编辑降落伞和/或板条箱的 SetEntityVelocity，请确保数字有小数点
（例如，您可以输入 SetEntityVelocity(crate, 0.0,
而不是 SetEntityVelocity(crate, 0.0, 0.0, -1)) 0.0,-1.0))

# 依赖项：
    es_extended（最新）
    ox_target
    PolyZone
# 如何安装
    将文件夹中的图像添加到您的库存中
# 将以下项目添加到 Ox Inventory/items.lua
    ["goldenphone"] = {
        ["name"] = "goldenphone",
        ["label"] = "金色卫星电话",
        ["weight"] = 200,
        ["type"] = "item",
        ["image"] = "goldenphone.png",
        ["unique"] = false,
        ["usable"] = true,
        ["shouldClose"] = false,
        ["description"] = "用于联系俄罗斯黑手党的通讯设备。",
        ["metadata"] = {},
        ["slot"] = 0,
        ["stackable"] = false,
    },

    ["redphone"] = {
        ["name"] = "redphone",
        ["label"] = "红色卫星电话",
        ["weight"] = 200,
        ["type"] = "item",
        ["image"] = "redphone.png",
        ["unique"] = false,
        ["usable"] = true,
        ["shouldClose"] = false,
        ["description"] = "用于联系俄罗斯黑手党的通讯设备。",
        ["metadata"] = {},
        ["slot"] = 0,
        ["stackable"] = false,
    },

    ["greenphone"] = {
        ["name"] = "greenphone",
        ["label"] = "绿色卫星电话",
        ["weight"] = 200,
        ["type"] = "item",
        ["image"] = "greenphone.png",
        ["unique"] = false,
        ["usable"] = true,
        ["shouldClose"] = false,
        ["description"] = "用于联系俄罗斯黑手党的通讯设备。",
        ["metadata"] = {},
        ["slot"] = 0,
        ["stackable"] = false,
    },
