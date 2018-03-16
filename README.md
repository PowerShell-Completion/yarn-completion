# posh-yarn-completion
[![license](https://img.shields.io/github/license/gluons/posh-yarn-completion.svg?style=flat-square)](./LICENSE)
[![PowerShell Gallery](https://img.shields.io/powershellgallery/v/yarn-completion.svg?style=flat-square)](https://www.powershellgallery.com/packages/yarn-completion/)
[![PowerShell Gallery](https://img.shields.io/powershellgallery/dt/yarn-completion.svg?style=flat-square)](https://www.powershellgallery.com/packages/yarn-completion/)

A [Yarn](https://yarnpkg.com/) tab completion for [PowerShell](https://microsoft.com/powershell).

## ⚙️ Installation

Install from [PowerShell Gallery](https://www.powershellgallery.com/)

```powershell
Install-Module yarn-completion -Scope CurrentUser
```

---

⚠️ If you haven't allowed script execution policy, set your script execution policy to `RemoteSigned` or `Unrestricted`.

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## 🛂 Usage

You have to import the module to use `yarn-completion`.

Add below command into your PowerShell profile.

```powershell
Import-Module yarn-completion
```

Then restart your PowerShell.  
Now you can use tab completion with **Yarn**.

---

⚠️ If you don't have PowerShell profile yet, create it with below command!

```powershell
New-Item -ItemType File $profile
```
