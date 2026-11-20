# Linux Personal Environment

個人 Linux 開發環境設定（Zsh + Tmux + Vim）。支援透過 `curl` 一鍵遠端安裝與本機快速配置。

## 快速安裝 (One-line Install)

在新機器上，只需一行指令即可完成全部配置（包含自動備份現有設定、Git clone、套件與外掛安裝、建立軟連結）：

```bash
curl -fsSL https://raw.githubusercontent.com/ALiangLiang/linux-personal-env/master/install.sh | bash
```

### 僅安裝指定環境

如果只想安裝特定工具：

```bash
# 只安裝 Zsh
curl -fsSL https://raw.githubusercontent.com/ALiangLiang/linux-personal-env/master/install.sh | bash -s -- zsh

# 只安裝 Vim、Tmux、NVM 與 PNPM
curl -fsSL https://raw.githubusercontent.com/ALiangLiang/linux-personal-env/master/install.sh | bash -s -- vim tmux nvm pnpm
```

---

## 本機執行 (Local Install)

如果你已經手動將專案 clone 到本機：

```bash
git clone https://github.com/ALiangLiang/linux-personal-env.git
cd linux-personal-env
chmod +x install.sh

# 安裝全部
./install.sh

# 或指定模組
./install.sh zsh
./install.sh tmux
./install.sh vim
./install.sh nvm
./install.sh pnpm
```

---

## 特色與優化

- **安全備份**：若 `~/.zshenv`、`~/.zshrc`、`~/.vimrc` 等檔案已存在，會自動備份為 `*.bak.<timestamp>`，不覆蓋遺失原有設定。
- **符號連結 (Symlink)**：設定檔皆以軟連結方式關聯，日後在 repo 內更新或 `git pull` 即可即時生效。
- **環境設定職責分離**：
  - `.zshenv`：管理全域環境變數與 PATH（如 `PNPM_HOME`、`NVM`、`~/.local/bin`），無論互動終端或背景腳本皆可載入。
  - `.zshrc`：專注於終端互動體驗（Oh My Zsh、別名 Aliases、鍵位綁定、fzf）。
- **統一 Vim 外掛管理**：全面採用 `vim-plug`，支援非同步平行下載外掛。
- **Node.js 開發生態開箱即用**：自動安裝與配置 **NVM** (Node Version Manager) 與 **pnpm**，不污染 shell 既有設定。
- **自訂本機配置**：支援 `~/.zshenv.local` 與 `~/.zshrc.local`，機器專屬變數或私鑰 alias 可放置於此，不污染版控。
- **非干擾安裝**：Oh My Zsh 安裝腳本以非交互模式執行，確保安裝腳本流暢執行到底。
