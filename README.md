# Echange365-public-webmail-guard
PowerShell rules for Exchange Online that flag and banner emails from public webmail domains (Gmail, Yahoo, Outlook, 280+ domains).
The banner is french in the script. You can change it to your own langage
# Exchange Webmail Guard

> Règles de transport Exchange Online pour avertir les utilisateurs  
> de tout e-mail entrant depuis un domaine webmail grand public.

---

## 📋 Description

Ce projet déploie deux règles de transport **Microsoft Exchange Online**  
qui insèrent automatiquement une bannière d'avertissement visuelle  
en tête de tout message provenant d'un domaine webmail grand public  
(Gmail, Outlook, Yahoo, FAI, opérateurs internationaux, etc.).

Il couvre **~280 domaines** répartis sur 6 continents et est conçu  
pour sensibiliser les utilisateurs aux risques de **phishing**,  
d'**usurpation d'identité** et de **pièces jointes malveillantes**.

---

## ✨ Fonctionnalités

- 🔴 Bannière HTML rouge insérée en tête du message
- 🌍 ~280 domaines webmail couverts (Google, Microsoft, Yahoo, FAI France/Europe/Monde...)
- ⚡ Déploiement en une seule exécution PowerShell
- 🔒 Compatible DKIM / ARC — pas de rejet des messages légitimes
- 🔄 Exception automatique sur les transferts (en-tête `Auto-Submitted`)
- 🏷️ Flag technique `X-Webmail-Sender-Warning: true` sur chaque message concerné
- 📋 Deux règles complémentaires pour contourner la limite de 8 192 caractères d'Exchange Online

---

## 🛠️ Prérequis

- Microsoft 365 avec Exchange Online
- Rôle **Administrateur Exchange** ou **Administrateur global**
- PowerShell 5.1+ ou PowerShell 7+
- Module `ExchangeOnlineManagement`

```powershell
Install-Module -Name ExchangeOnlineManagement -Scope CurrentUser -Force
```

---

## 🚀 Déploiement

```powershell
# 1. Se connecter à Exchange Online
Connect-ExchangeOnline -UserPrincipalName admin@votredomaine.com

# 2. Exécuter le script
.\Pubweb-guard.ps1

# 3. Se déconnecter
Disconnect-ExchangeOnline -Confirm:$false
```
