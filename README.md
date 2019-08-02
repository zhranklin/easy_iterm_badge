# easy\_iterm\_badge

## 安装
### 安装脚本

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