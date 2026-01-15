## 源代码的版本并不是设计给普通用户使用的（我还没有完全测试）
## 如果你愿意，可以尝试，但是普通用户请在此处下载：<a href="#fully-automatic-installation-recommended-">Fully Automatic Installation</a>

- 前段时间存储库消失是因为GitHub给我封号了

- https://www.bilibili.com/video/BV1dwrHBdEyq/


<a id="readme-top"></a>

[![Forks][forks-shield]]([forks-url])
[![Stargazers][stars-shield]]([stars-url])
[![Issues][issues-shield]]([issues-url])
[![License][license-shield]]([license-url])

<div align="right">
  <a href="https://github.com/Felix3322/PotPlayer_ChatGPT_Translate/blob/master/docs/readme_zh.md">简体中文</a> | 
  <a href="https://github.com/Felix3322/PotPlayer_ChatGPT_Translate/blob/master/docs/readme_zh-tw.md">繁体中文</a> | 
  <strong href="https://github.com/Felix3322/PotPlayer_ChatGPT_Translate/blob/master/README.md">English</strong>
</div>

<div align="center">
  <h3 align="center">PotPlayer_ChatGPT_Translate 🚀</h3>
  <p align="center">
    A PotPlayer plugin that leverages the ChatGPT API to provide real-time, context-aware subtitle translation. ✨
  </p>
  <p align="center">
    <img src="https://blog.codinghorror.com/content/images/uploads/2007/03/6a0120a85dcdae970b0128776ff992970c-pi.png" alt="It works on my machine">
  </p>
<p align="center"><em>Works on my machine.</em></p>
  <p align="center">
    <a href="https://github.com/Felix3322/PotPlayer_ChatGPT_Translate/issues/new?labels=bug&template=bug-report---.md">🐞 Report Bug</a>
    &nbsp;&middot;&nbsp;
    <a href="https://github.com/Felix3322/PotPlayer_ChatGPT_Translate/issues/new?labels=enhancement&template=feature-request---.md">💡 Request Feature</a>
  </p>
</div>

<!-- HTML Directory (Table of Contents) -->
<div>
  <h2>📑 Table of Contents</h2>
  <ol>
    <li>
      <a href="#installation-">Installation</a>
      <ol>
        <li><a href="#fully-automatic-installation-recommended-">Fully Automatic Installation</a></li>
        <li><a href="#manual-installation-">Manual Installation</a></li>
      </ol>
    </li>
    <li><a href="#about-the-project-">About The Project</a></li>
    <li><a href="#video-tutorial-">Video Tutorial</a></li>
    <li><a href="#built-with-">Built With</a></li>
    <li><a href="#usage-">Usage</a></li>
    <li><a href="#roadmap-">Roadmap</a></li>
    <li><a href="#contributing-">Contributing</a></li>
    <li><a href="#license-">License</a></li>
    <li><a href="#contact-">Contact</a></li>
    <li><a href="#acknowledgments-">Acknowledgments</a></li>
  </ol>
</div>

---

## Installation 📦

### Fully Automatic Installation (Recommended) ⚡

1. **Download the Installer:**  
   [Installer](https://github.com/Felix3322/PotPlayer_ChatGPT_Translate/releases/latest)  
   *(The installer is open source, so you can review the source code)*
2. **Run the Installer (`installer.exe`):**
   - Double-click `installer.exe` to start.
   - Approve the **administrator prompt** if Windows asks for permission.
3. **Confirm the PotPlayer Plugin Folder:**
   - The wizard auto-detects your PotPlayer install path.
   - Verify the target folder is:  
     `...\PotPlayer\Extension\Subtitle\Translate`
   - If you installed PotPlayer to a custom location, browse to the correct `Translate` folder.
4. **Choose the Plugin Variant:**
   - **With context** (better translation quality, slightly higher latency).
   - **Without context** (faster, less contextual awareness).
5. **Configure Model & API Endpoint:**
   - **Model Name:** enter the model ID (example: `gpt-4.1-nano`).
   - **Custom API base URL (optional):** use `ModelName|API Base URL`.
   - **No-key endpoints:** leave the key blank and verify; the installer will inject `nullkey` after a successful empty-key test.
6. **Enter API Key (if required):**
   - Paste your API key into the installer field.
   - If your endpoint does **not** require a key, leave it blank and use **Verify** to test an empty key; on success, the installer will inject `nullkey`.
7. **Finalize Installation:**
   - Click **Install** to copy the files.
   - Optionally register the **uninstaller** entry to cleanly remove the plugin later.
   - Note: installer defaults are written once; any later changes in PotPlayer’s panel will override the installer values.

**After installation, verify settings in PotPlayer:**
1. **Open PotPlayer Preferences:** press **F5**.
2. **Navigate to Extensions:** **Extensions > Subtitle translation**.
3. **Select the plugin:** choose **ChatGPT Translate**.
4. **Set source/target languages** as needed.

### Manual Installation 🔧

1. **Download the ZIP File:**  
   Download the latest ZIP file from this repository.
2. **Extract the ZIP File:**  
   Extract the contents to a temporary folder.
3. **Copy Files:**  
   Copy `ChatGPTSubtitleTranslate.as` and `ChatGPTSubtitleTranslate.ico` to the following directory:
   ```
   C:\Program Files\DAUM\PotPlayer\Extension\Subtitle\Translate
   ```
   Replace `C:\Program Files\DAUM\PotPlayer` with your custom PotPlayer installation path if necessary.
4. **Configure PotPlayer After Copying:**
   1. Open PotPlayer **Preferences** (press **F5**).
   2. Go to **Extensions > Subtitle translation**.
   3. Select **ChatGPT Translate**.
   4. Configure **Model Name**, **API URL**, and **API Key** as needed.
   5. Set **source** and **target** languages.

> ℹ️ **If you switch between the context-aware and no-context scripts, replace both `.as` files together.**
> Older copies that used the shared `FormatFailureTranslation` name can cause PotPlayer to report a conflict on whichever script loads first (often the standard context version). The current files use uniquely prefixed helpers to avoid this.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

### Configuration Reference ⚙️

1. **Model Name:**  
   You can simply enter the model name, which will use the default API URL.  
   **Example:**  
   ```
   gpt-4.1-nano
   ```  
   
   Alternatively, specify a custom API URL using the following format:  
   ```
   ModelName|API Base URL
   ```  
   **Example:**  
   ```
   gpt-4.1-nano|https://api.openai.com/v1/chat/completions
   ```  
   
   > **Note:**  
   > In version **v1.5** and later, if you're using a self-hosted or third-party API that does not require an API key, you can add `nullkey` at the end:  
   > ```
   > gpt-4.1-nano|nullkey
   > ```
   > or:  
   > ```
   > qwen2.5:7b|http://127.0.0.1:11434/v1/chat/completions|nullkey
   > ```
   >
   > **Optional tuning parameters (v1.7+):**  
   > Append extra tokens separated by `|`:  
   > - `delay_ms` (digits only): add a delay before each request  
   > - `retryN` (N = 0–3): retry mode  
   >   - `retry0`: no retry  
   >   - `retry1`: one extra attempt on empty response  
   >   - `retry2`: keep retrying until a response (no delay)  
   >   - `retry3`: keep retrying, with delay before every attempt  
   > - `cache=auto` / `cache=off`: context cache mode (context version only; auto falls back to chat if unsupported)  
   >
   > Example with all options:  
   > ```
   > gpt-4.1-nano|https://api.openai.com/v1/chat/completions|nullkey|500|retry1|cache=auto
   > ```

2. **API Key:**  
   Enter your API key if needed.  
   If your endpoint does not require a key, verify with a blank field; the installer will inject `nullkey` only after a successful empty-key test.  
   > You can test your API key using **[keytest.obanarchy.org](https://keytest.obanarchy.org/)** to ensure it is valid.

3. **Set the Source and Target Languages:**  
   Configure the source and target languages as required.

---

#### Available Models (Examples)

Use the format:  
```
ModelName|API Base URL|nullkey (optional)|delay_ms (optional)|retryN (optional)|cache=auto/off (optional)
```

Here is a list of supported models:

```
Deepseek: deepseek-chat|https://api.deepseek.com/v1/chat/completions
Tongyi Qianwen: qwen-plus|https://dashscope-intl.aliyuncs.com/compatible-mode/v1/chat/completions
SiliconFlow: siliconflow-chat|https://api.siliconflow.cn/v1/chat/completions
ERNIE Bot (Wenxin Yiyan): ernie-4.0-turbo-8k|https://qianfan.baidubce.com/v2/chat/completions
Gemini: gemini-2.0-flash|https://generativelanguage.googleapis.com/v1beta/openai/chat/completions
ChatGLM: chatglm-6b|https://api.chatglm.cn/v1/chat/completions
LLaMA: llama-13b|https://api.llama.ai/v1/chat/completions
Code LLaMA: code-llama-34b|https://api.llama.ai/v1/code/completions
OpenAI GPT-4o: gpt-4o|https://api.openai.com/v1/chat/completions
OpenAI GPT-4 Turbo: gpt-4-turbo|https://api.openai.com/v1/chat/completions
OpenAI GPT-3.5 Turbo: gpt-3.5-turbo|https://api.openai.com/v1/chat/completions
Claude 3 Sonnet: claude-3-sonnet-20240229|https://api.anthropic.com/v1/messages
Mistral Large: mistral-large|https://api.mistral.ai/v1/chat/completions
Groq Llama 3: llama3-70b-8192|https://api.groq.com/openai/v1/chat/completions
Perplexity Sonar Large: pplx-70b-online|https://api.perplexity.ai/chat/completions
Fireworks Mixtral: accounts/fireworks/models/mixtral-8x7b-instruct|https://api.fireworks.ai/inference/v1/chat/completions
Moonshot v1: moonshot-v1-128k|https://api.moonshot.cn/v1/chat/completions
Yi 34B Chat: yi-34b-chat|https://api.lingyi.ai/v1/chat/completions
Local Deployment (no API key): model-name|http://127.0.0.1:PORT/v1/chat/completions|nullkey
```
Model names in the installer are shown in your chosen language whenever possible.

You can expand or replace these with any OpenAI-compatible model that supports the chat/completions endpoint.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## About The Project 💬

**PotPlayer_ChatGPT_Translate** is a PotPlayer plugin that integrates the ChatGPT API to deliver real-time, context-aware subtitle translation. Unlike traditional translation tools, this plugin considers context, idioms, and cultural nuances to produce more accurate translations. The core of the project is implemented using AngleScript, leveraging both the ChatGPT API and PotPlayer API for deep integration.
### This plugin is also compatible with any AI model that follows the same API call format as ChatGPT.

## 🔍 Google Translate vs ChatGPT Translate

One key advantage of using ChatGPT for subtitle translation is its ability to understand context and cultural references. Compare the following results:

- **Original subtitle:**  
  > *"You're gonna old yeller my f**king universe."*

- **Google Translate Result:**  
  > *"你要老了我他妈的宇宙吗?"*  
  ![](https://github.com/Felix3322/PotPlayer_ChatGPT_Translate/blob/master/docs/Google%20translate.png)  
  _(Nonsensical and incorrect)_

- **ChatGPT Translation Result:**  
  > *"你要像《老黄犬》一样对待我的宇宙?"*  
  ![](https://github.com/Felix3322/PotPlayer_ChatGPT_Translate/blob/master/docs/ChatGPT.png)  
  _(Correctly captures the reference and intended meaning)_

## 🧐 ChatGPT Without Context vs. ChatGPT With Context Comparison

- **Original Subtitle:**  
  > *"But being one in real life is even better."*

- **ChatGPT Translation (Without Context):**  
  > *"但是，在现实生活中成为一个人甚至更好。"*  
  ![](https://github.com/Felix3322/PotPlayer_ChatGPT_Translate/blob/master/docs/without%20context.png)  
  _(Literal translation, failing to capture the implied meaning)_

- **ChatGPT Translation (With Context):**  
  > *"但在现实生活中成为一个反派更好。"*  
  ![](https://github.com/Felix3322/PotPlayer_ChatGPT_Translate/blob/master/docs/using%20context.png)  
  _(Accurately capturing the intended context)_

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## Video Tutorial 🎥

Click below to watch the tutorial on Bilibili:

<a href="https://www.bilibili.com/video/BV1w9FzegEbM" title="Watch on Bilibili">
  <img src="https://i1.hdslb.com/bfs/archive/88992bd0e80ff751771e78675a558b663a728028.jpg" alt="Watch on Bilibili">
</a>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## Built With 🛠

- **AngleScript** – The scripting language used to develop the plugin  
- **ChatGPT API** – Provides context-aware translation capabilities  
- **PotPlayer API** – Enables seamless integration with PotPlayer

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## Usage ▶️

When playing a video with subtitles in PotPlayer, the plugin automatically calls the ChatGPT API to translate the subtitles in real time. By handling context, idioms, and cultural nuances, the plugin provides more accurate translations.

For example:  
- **Input:** *"You're gonna old yeller my f**king universe."*  
  - **Traditional Translation Tools** might output a literal or awkward translation.  
  - **ChatGPT Translation** captures the movie reference and context to deliver a more appropriate translation.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## Roadmap 🗺

- [x] Integrate ChatGPT API with PotPlayer API for real-time subtitle translation.  
- [ ] Support additional AI models (planned for the future, not imminent).  
- [ ] Optimize context handling to further improve translation accuracy.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## Contributing 🤝

Contributions are welcome! When submitting a pull request, please clearly describe the purpose of your changes.  
If you have suggestions for improvements or bug fixes, feel free to open an issue before making modifications.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## License 📄

Distributed under the GPLv3 License. See `LICENSE` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## Contact 📞

Personal website: [obanarchy.org](https://obanarchy.org)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## Acknowledgments 🙏

- Thanks to OpenAI for providing the powerful ChatGPT API.  
- Thanks to the PotPlayer team for creating an excellent media player.  
- Thanks to everyone who has contributed suggestions or code to improve this project (contributor details will be updated here).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=Felix3322/PotPlayer_ChatGPT_Translate&type=Date)](https://www.star-history.com/#Felix3322/PotPlayer_ChatGPT_Translate&Date)

---

<!-- MARKDOWN LINKS & IMAGES -->
[stars-shield]: https://img.shields.io/github/stars/Felix3322/PotPlayer_ChatGPT_Translate.svg?style=for-the-badge
[stars-url]: https://github.com/Felix3322/PotPlayer_ChatGPT_Translate/stargazers
[forks-shield]: https://img.shields.io/github/forks/Felix3322/PotPlayer_ChatGPT_Translate.svg?style=for-the-badge
[forks-url]: https://github.com/Felix3322/PotPlayer_ChatGPT_Translate/network/members
[issues-shield]: https://img.shields.io/github/issues/Felix3322/PotPlayer_ChatGPT_Translate.svg?style=for-the-badge
[issues-url]: https://github.com/Felix3322/PotPlayer_ChatGPT_Translate/issues
[license-shield]: https://img.shields.io/github/license/Felix3322/PotPlayer_ChatGPT_Translate.svg?style=for-the-badge
[license-url]: https://github.com/Felix3322/PotPlayer_ChatGPT_Translate/blob/master/LICENSE
