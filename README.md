# Exchange Webmail Guard

> PowerShell deployment of Exchange Online transport rules  
> that warn users of any incoming email from a public webmail domain.

Developed by **David ANDE** & **Claude**

---

## 📋 Description

This project deploys two **Microsoft Exchange Online** transport rules
that automatically insert a visual warning banner at the top of any
message sent from a public webmail domain
(Gmail, Outlook, Yahoo, ISPs, international carriers, etc.).

It covers **~280 domains** across 6 continents and is designed
to raise user awareness of **phishing**, **identity spoofing**
and **malicious attachment** risks.

---

## ✨ Features

- 🔴 Red HTML warning banner inserted at the top of the message
- 🌍 ~280 webmail domains covered (Google, Microsoft, Yahoo, ISPs across France/Europe/World...)
- 🇫🇷 🇬🇧 Banner available in **French** or **English** via parameter
- ⚡ Deployed in a single PowerShell execution
- 🔒 DKIM / ARC compatible — no rejection of legitimate messages
- 🔄 Automatic exception for auto-forwarded messages (`Auto-Submitted` header)
- 🏷️ Technical flag `X-Webmail-Sender-Warning: true` added to every matched message
- 📋 Two complementary rules to work around Exchange's 8,192-character limit

---

## 🛠️ Requirements

- Microsoft 365 with Exchange Online
- **Exchange Administrator** or **Global Administrator** role
- PowerShell 5.1+ or PowerShell 7+
- `ExchangeOnlineManagement` module

```powershell
Install-Module -Name ExchangeOnlineManagement -Scope CurrentUser -Force
```

---

## 🚀 Deployment

```powershell
# 1. Connect to Exchange Online
Connect-ExchangeOnline -UserPrincipalName admin@yourdomain.com

# 2a. Deploy with French banner (default)
.\PubWeb-Guard.ps1

# 2b. Deploy with English banner
.\PubWeb-Guard.ps1 -Langue EN

# 3. Disconnect
Disconnect-ExchangeOnline -Confirm:$false
```

> **Note:** If an invalid value is passed to `-Langue`, PowerShell will
> block execution and display the list of accepted values (`FR`, `EN`).

---

## 🌐 Banner preview

**French**
> ⚠️ **Avertissement – Expéditeur webmail grand public**
> Ce message a été envoyé depuis une adresse e-mail personnelle (Gmail, Outlook, Yahoo, etc.).
> - Vérifiez l'identité de l'expéditeur avant de répondre.
> - Ne cliquez pas sur des liens suspects.
> - N'ouvrez pas les pièces jointes inattendues.

**English**
> ⚠️ **Warning – Public webmail sender**
> This message was sent from a personal e-mail address (Gmail, Outlook, Yahoo, etc.).
> - Verify the sender's identity before replying.
> - Do not click on suspicious links.
> - Do not open unexpected attachments.

---

## 🧪 Verification

```powershell
# List rules and their status
Get-TransportRule | Where-Object { $_.Name -like '*webmail*' } |
    Select-Object Name, State, Priority, Mode
```

---

## ⚠️ Important notes

| Topic | Detail |
|---|---|
| Propagation delay | Allow 15 to 30 minutes after deployment before rules become active |
| False positives | Use `-ExceptIfFrom` to whitelist trusted senders on public domains |
| DKIM | The banner invalidates the original DKIM signature — mitigated by Exchange Online's native ARC |
| Legacy mail clients | The `Wrap` fallback encapsulates and preserves the original message |

---

## 📄 License

MIT — Free to use, modify and distribute.

---

## 👤 Author

**David ANDE** & **Claude**
