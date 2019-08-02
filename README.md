# easy\_iterm\_badge

## 安装
### 执行以下命令

```bash
source <(curl -fsSL https://raw.githubusercontent.com/zhranklin/easy_iterm_badge/master/install.sh)
```

### 设置iterms
#### 设置trigger
Preference → Profiles → Advanced → Triggers下的Edit → 点击"+" 添加两个trigger:

Regular Expression | Action | Parameters | Instant
---|---|---|---
`========RUN_CURRENT_SCRIPT========`|`Send Text...`|`~/.easy_iterm_badge/run_current_script\n`|√
`========CLEAR_BADGE========`|`Send Text...`|`_eib_set_badge ""\n`|√

#### 如果要在终端背景中显示(badge)
Preference → General → Basics → Badge中输入`\(user.eibTitle)`

#### 如果要在status bar中显示
status bar处右键 → Configure Status Bar → 找到"Interpolated String" → 往下拽 → 单击这个组件 → 点左下角"Configure Component" → String Value里面输入`\(user.eibTitle)` → OK

### 测试
设置完成后起一个新的shell, 执行`test_login 127.0.0.1`, status会出现`test_login to 127.0.0.1`的字样, 过几秒后消失, 即成功安装。

## 使用
### ssh
内置一个ssh命令, 可以直接试一下

### 自定义脚本
`~/.easy_iterm_badge/scripts`目录下存放自己的脚本, 直接输入该目录下脚本名即可, 新脚本需要重启shell生效。

### 自定义内容
脚本第二行加上注释可以修改状态栏文本内容, 即"自定义内容+参数", 不加注释则为完整的命令行内容


