# PUBLISHING.md — 内容发布规则

> **给 AI 助手的说明**：在创建、编辑或发布 `src/content/posts/` 下的任何内容之前，**必须先读完这份文件**。
> 重点看「三、frontmatter 规则」和「五、硬性约束」—— 违反其中任何一条都会导致**整站构建失败**。

---

## 一、这个博客是什么

| 项 | 值 |
|---|---|
| 本地仓库 | `C:\Users\22517\Desktop\Files\Study\Code\blog` |
| GitHub | https://github.com/adrianwang0715/blog |
| 线上地址 | https://firefly.adrianwang0715.workers.dev |
| 托管 | Cloudflare **Workers**（静态资源模式），项目名 `firefly` |
| 主题 | Firefly v6.16.8（Astro 7.3.2） |

---

## 二、怎么发布

双击仓库根目录的 **`publish-blog.bat`**。它依次做三件事：

1. `git add -A`
2. `git commit`
3. `git push`

推送后 Cloudflare 自动重新构建，**1–2 分钟后**线上更新。

> ⚠️ **最重要的一条：`git push` 成功 ≠ 网站更新成功。**
> 两者之间隔着一次 Cloudflare 构建。构建失败时 Cloudflare 不会通知你，
> 网站会**静默停留在旧版本** —— 表现出来就是「明明推上去了，网站却没反应」。
>
> 遇到这种情况，第一件事是去 Cloudflare → Workers & Pages → `firefly` → **Deployments** 看构建状态。

---

## 三、frontmatter 规则（最重要）

### 硬性约束

`src/content/posts/` 下（**含所有子目录**）每一个 `.md` / `.mdx` **都必须带 frontmatter**，
且至少包含 `title` 和 `published` 两个字段。

**只要有 1 个文件缺失，整个站点构建失败**，报错形如：

```
[InvalidContentEntryDataError] posts → xxx data does not match collection schema.
  title: Required
  published: Required
```

### 完整字段示例

```yaml
---
title: "2.2 数据抽象"
published: 2026-10-12
description: "CS61A 教材《Composing Programs》第 2.2 节中文翻译。"
tags: [CS61A, Python, 教材]
category: CS61A
series: "CS61A 教材中文版"
seriesOrder: 2
---
```

常用字段：`title`(必填) / `published`(必填) / `description` / `tags` / `category` /
`series` + `seriesOrder`（自动生成上一章·下一章导航）/ `image`（封面）/ `draft` / `pinned` / `slug`。

### 按所在文件夹套用的默认规则

| 文章放在哪 | category | tags | series |
|---|---|---|---|
| `posts/` 根目录 | 随笔 | [随笔] | — |
| `posts/textbook/` | CS61A | [CS61A, Python, 教材] | "CS61A 教材中文版"，seriesOrder 按 2.1→4.7 递增 |
| `posts/cs61a/` | CS61A | [CS61A, Python, 学习笔记] | — |

`published` 一律用当天日期。

> **碰到上表没有的新文件夹，不要自己编 category 和 tags —— 先问站点主人。**
> 分类编错了比不写还糟。

---

## 四、图片怎么放

- 图片放在文章**同级目录**（如 `posts/textbook/img/`），md 里用**相对路径**引用：`![](./img/xxx.png)`
- **不要用 `../` 往上跳出文章目录**
- 想让文件出现在网站根目录（如 `https://站点/logo.png`），放 `public/` 下，会原样复制
- 只有 `src/` 和 `public/` 里的文件会进网站。仓库里其他文件夹的文件会被提交到 GitHub，**但网站上永远看不到**

---

## 五、硬性约束（逐条都踩过坑）

1. **`posts/` 下每个 `.md` 必须有 frontmatter**（见第三节）
2. **非文章文件不能放进 `posts/`** —— 例如 `README.md`。要放就放 `docs/`
3. **目录结构 = URL 结构**：`posts/textbook/2.2-Data-Abstraction.md` → `/posts/textbook/2.2-Data-Abstraction/`
   - 改文件夹名 = 改网址，已分享出去的旧链接会失效
   - 末段为 `index` 的文件会并入所在文件夹，folder 行本身变成文章链接
   - 空文件夹不会出现在侧边栏文件树上（树只统计有文章的目录）
4. **写 `.bat` 文件后必须转成 CRLF 换行**（`sed -i 's/$/\r/'`），否则 cmd.exe 会吞掉每一行的首字符，
   报出 `'m' 不是内部或外部命令` 这类怪错

---

## 六、本地验证

```bash
pnpm exec astro sync     # 校验内容集合，几秒钟，最快的检查手段
```

⚠️ **不要在 WorkBuddy 沙箱里跑完整的 `pnpm build`** —— Astro 清理临时目录时会触发沙箱的批量删除保护而中断。
完整构建交给 Cloudflare 验证即可。

---

## 七、本地预览

双击 `start-blog.bat` → 浏览器打开 http://127.0.0.1:4321/

（若提示「已有一个博客在运行」，说明 4321 端口被占用，关掉另一个黑窗口再试。）

---

## 八、故障排查

| 现象 | 原因 | 处理 |
|---|---|---|
| 推送成功、网站没变化 | Cloudflare 构建失败 | 去 Deployments 看构建日志 |
| `InvalidContentEntryDataError` | `posts/` 下有 .md 缺 frontmatter | 补 frontmatter |
| 图片 404 | 相对路径指错，或图没跟着搬 | 放到文章同级目录，用 `./` 引用 |
| 双击 bat 报 `'m'/'cho' 不是内部或外部命令` | .bat 被存成了 LF 换行 | 转成 CRLF |
| 双击 bat 提示「已有一个博客在运行」 | 4321 端口被占 | 关掉另一个黑窗口 |
| 双击 bat 弹 GitHub 登录窗 | 凭据过期 | 选 "Sign in with your browser" 重新授权 |

---

## 九、侧边栏「文件树」组件

侧边栏的文件夹树由 `src/components/widget/PostTree.astro` 生成，
它**在构建时读取 `entry.id`**（= 文章相对 `src/content/posts/` 的路径）来建树。

- 想调整网页上的层级 → **只能改本地的文件夹结构**，然后重新发布
- 网页上**不支持拖拽**：它是静态产物，没有后端和文件系统，树只是只读镜像
- 树的展开/折叠是浏览器原生的 `<details>` 行为，不需要 JS

---

_最后更新：2026-10-12_
