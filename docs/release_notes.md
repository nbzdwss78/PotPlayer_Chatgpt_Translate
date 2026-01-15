# 📢 PotPlayer ChatGPT Translate v1.8

## 📦 下载地址 / Download

| 渠道 (Channel) | 下载链接 (Download Link) |
| --- | --- |
| **GitHub (Global)** | [👉 Download Latest Installer (v1.8)](https://github.com/Felix3322/PotPlayer_ChatGPT_Translate/releases/latest) |
| **Gitee (China)** | [🚀 国内镜像快速下载](https://gitee.com/felix3322/PotPlayer_ChatGPT_Translate/raw/master/releases/latest/installer.exe) |

---

## 🔧 更新内容 / Update Highlights

**本次更新主要集中在核心稳定性和字符处理的修复上，强烈建议所有用户升级：**

* **[重要修复]** **修复 JSON 转义失效问题**：修复了一个导致特殊字符（如引号、反斜杠、换行符）无法正确转义的严重 bug，大幅提升了复杂字幕内容的翻译稳定性。
* **[重要修复]** **修复 CJK 字符截断问题**：优化了上下文“智能修剪”逻辑，现在能正确处理 UTF-8 多字节字符（如中文、韩文），防止因字符被切断而导致的乱码或 API 报错。
* **[优化]** **增强 JSON 兼容性**：新增对退格符 (`\b`) 和换页符 (`\f`) 的转义支持，符合更严格的 JSON 规范。
* **[优化]** **重试逻辑安全网**：为网络重试机制添加了最大尝试次数限制，防止在网络不可用时陷入无限循环。

---

## 🛠 核心改进详情 / Technical Improvements

针对开发者与高级用户，本次更新在底层逻辑上做了以下调整：

> **AngelScript 修复: String Replace & Slicing**
> 修正了 `string.replace` 返回值未被重新赋值的低级错误；重写了 `Smart Trim` 算法，在截取字符串时会自动检测 UTF-8 边界，避免产生无效字节序列。

> **鲁棒性增强: Robustness**
> `ExecuteWithRetry` 函数现在拥有硬性的循环上限（10次），即使在极端的网络配置或错误状态下也能保证主线程不会卡死。

---

## 📸 预览 / Screenshots

<p align="center">
  <img src="https://github.com/user-attachments/assets/d21a23f8-d580-400d-8e94-efc618b9c541" width="90%" alt="Banner" />
  <br><br>
  <img src="https://github.com/user-attachments/assets/ed644de9-f878-4978-bb54-5f1be48ad7d0" width="200" alt="Settings" />
</p>

---

## ℹ️ 其他说明 / Additional Notes

* 💻 **运行环境**：建议在 **Windows 10 / 11** 系统下配合最新版 PotPlayer 运行。
* ⚠️ **升级提示**：由于修复了核心脚本逻辑，**请务必使用安装包重新安装**，或手动覆盖 `SubtitleTranslate - ChatGPT.as` 和 `SubtitleTranslate - ChatGPT - Without Context.as` 两个文件。
* 🐞 **问题反馈**：如遇安装或使用问题，请通过 [GitHub Issues](https://github.com/Felix3322/PotPlayer_ChatGPT_Translate/issues) 提交反馈。
