$banniere = "<div style='background-color:#FDEAEA;border-left:4px solid #C0392B;" +
            "padding:12px 16px;margin-bottom:12px;font-family:Arial,sans-serif;font-size:13px;'>" +
            "<div style='margin-bottom:6px;'>" +
            "<strong style='color:#7B1C1C;'>&#9888;&#65039; Avertissement &ndash; " +
            "Exp&eacute;diteur webmail grand public</strong></div>" +
            "<p style='color:#7B1C1C;margin:0 0 6px 0;'>Ce message a &eacute;t&eacute; envoy&eacute; " +
            "depuis une adresse e-mail personnelle (Gmail, Outlook, Yahoo, etc.).</p>" +
            "<ul style='color:#7B1C1C;margin:0;padding-left:18px;'>" +
            "<li>V&eacute;rifiez l&apos;identit&eacute; de l&apos;exp&eacute;diteur avant de r&eacute;pondre.</li>" +
            "<li>Ne cliquez pas sur des liens suspects.</li>" +
            "<li>N&apos;ouvrez pas les pi&egrave;ces jointes inattendues.</li>" +
            "</ul></div>"

# ============================================================
#  REGLE 1 — Google, Microsoft, Yahoo, Apple, AOL, France, UK,
#             Allemagne, Italie, Espagne, Belgique, Pays-Bas
# ============================================================
$domaines1 = @(
    "gmail.com", "googlemail.com",
    "outlook.com", "outlook.fr", "outlook.de", "outlook.es", "outlook.it",
    "outlook.com.br", "outlook.com.ar", "outlook.co.uk",
    "hotmail.com", "hotmail.fr", "hotmail.be", "hotmail.co.uk", "hotmail.de",
    "hotmail.es", "hotmail.it", "hotmail.ca", "hotmail.com.br", "hotmail.com.ar",
    "hotmail.com.mx", "hotmail.co.jp",
    "live.com", "live.fr", "live.co.uk", "live.de", "live.be",
    "live.ca", "live.com.ar", "live.com.mx", "live.com.au",
    "msn.com",
    "yahoo.com", "yahoo.fr", "yahoo.co.uk", "yahoo.de", "yahoo.es",
    "yahoo.it", "yahoo.co.jp", "yahoo.com.br", "yahoo.com.ar",
    "yahoo.com.mx", "yahoo.com.au", "yahoo.com.sg", "yahoo.com.hk",
    "yahoo.com.tw", "yahoo.in", "yahoo.gr", "yahoo.ro", "yahoo.hu",
    "yahoo.at", "yahoo.dk", "yahoo.se", "yahoo.no", "yahoo.fi",
    "yahoo.com.ph", "yahoo.com.vn", "yahoo.ca",
    "ymail.com", "rocketmail.com",
    "icloud.com", "me.com", "mac.com",
    "aol.com", "aol.co.uk", "aol.fr", "aol.de",
    "orange.fr", "wanadoo.fr", "free.fr", "sfr.fr", "neuf.fr",
    "numericable.fr", "bbox.fr", "bouyguestelecom.fr", "laposte.net",
    "club-internet.fr", "cegetel.net", "tiscali.fr", "aliceadsl.fr",
    "nordnet.fr", "dbmail.com",
    "btinternet.com", "btopenworld.com", "bt.com",
    "virginmedia.com", "virgin.net",
    "sky.com", "talktalk.net", "ntlworld.com",
    "blueyonder.co.uk", "tiscali.co.uk",
    "gmx.de", "gmx.net", "gmx.com", "gmx.fr",
    "web.de", "t-online.de", "freenet.de",
    "arcor.de", "online.de", "mail.de",
    "libero.it", "virgilio.it", "tim.it",
    "alice.it", "tiscali.it", "email.it",
    "inwind.it", "iol.it",
    "telefonica.net", "terra.es", "ya.com",
    "ono.com", "correo.es", "jazztel.es",
    "skynet.be", "telenet.be", "proximus.be", "voo.be",
    "edpnet.be", "brutele.be",
    "ziggo.nl", "kpnmail.nl", "hetnet.nl",
    "upcmail.nl", "planet.nl", "xs4all.nl",
    "tele2.nl", "chello.nl", "online.nl"
)

New-TransportRule `
    -Name "Avertissement - Expéditeur webmail public (1/2)" `
    -SenderDomainIs $domaines1 `
    -ExceptIfHeaderContainsMessageHeader "Auto-Submitted" `
    -ExceptIfHeaderContainsWords "auto-generated","auto-replied","auto-notified" `
    -ApplyHtmlDisclaimerLocation Prepend `
    -ApplyHtmlDisclaimerText $banniere `
    -ApplyHtmlDisclaimerFallbackAction Wrap `
    -SetHeaderName "X-Webmail-Sender-Warning" `
    -SetHeaderValue "true" `
    -Enabled $true `
    -Mode Enforce `
    -Priority 0

# ============================================================
#  REGLE 2 — Suisse, Autriche, Portugal, Pologne, Tchéquie,
#             Hongrie, Roumanie, Grèce, Turquie, Nordiques,
#             Russie/CIS, Chine, Corée, Japon, Inde,
#             Moyen-Orient, Brésil, Amérique Latine,
#             Afrique du Sud, Australie, Canada, USA, Privacy
# ============================================================
$domaines2 = @(
    "bluewin.ch", "gmx.ch", "swissmail.org", "sunrise.ch", "hispeed.ch",
    "aon.at", "chello.at", "utanet.at", "gmx.at",
    "sapo.pt", "iol.pt", "netcabo.pt", "clix.pt",
    "wp.pl", "onet.pl", "interia.pl",
    "o2.pl", "tlen.pl", "poczta.fm",
    "gazeta.pl", "op.pl",
    "seznam.cz", "email.cz", "centrum.cz",
    "post.cz", "volny.cz", "atlas.sk",
    "centrum.sk", "zoznam.sk",
    "freemail.hu", "citromail.hu", "t-online.hu",
    "mail.ro", "clicknet.ro",
    "forthnet.gr", "hol.gr", "otenet.gr",
    "mynet.com", "turk.net", "superonline.com",
    "ttmail.com", "millenicom.com",
    "telia.com", "comhem.se", "bredband.net", "spray.se",
    "online.no", "frisurf.no", "broadpark.no",
    "telia.fi", "elisa.fi", "luukku.com", "mbnet.fi",
    "tdcmail.dk", "mail.dk", "jubii.dk",
    "mail.ru", "yandex.ru", "yandex.com",
    "rambler.ru", "bk.ru", "list.ru", "inbox.ru",
    "ya.ru", "internet.ru",
    "ukr.net", "i.ua", "meta.ua", "bigmir.net",
    "tut.by",
    "qq.com", "163.com", "126.com",
    "sina.com", "sina.cn", "sohu.com",
    "foxmail.com", "yeah.net", "21cn.com",
    "tom.com", "139.com", "189.cn",
    "wo.cn", "263.net",
    "naver.com", "daum.net", "hanmail.net",
    "kakao.com", "nate.com", "korea.com", "paran.com",
    "docomo.ne.jp", "ezweb.ne.jp", "softbank.ne.jp",
    "au.com", "i.softbank.jp",
    "nifty.com", "ocn.ne.jp", "biglobe.ne.jp",
    "rediffmail.com", "indiatimes.com", "sify.com", "in.com",
    "walla.co.il", "bezeqint.net", "netvision.net.il",
    "zahav.net.il", "hotmail.co.il",
    "uol.com.br", "bol.com.br", "ig.com.br",
    "terra.com.br", "r7.com", "oi.com.br",
    "globomail.com", "zipmail.com.br",
    "fibertel.com.ar", "arnet.com.ar",
    "sinectis.com.ar", "ciudad.com.ar", "prodigy.net.mx",
    "webmail.co.za", "iafrica.com", "mweb.co.za", "vodamail.co.za",
    "bigpond.com", "bigpond.net.au",
    "optusnet.com.au", "tpg.com.au",
    "iprimus.com.au", "iinet.net.au",
    "westnet.com.au", "dodo.com.au",
    "sympatico.ca", "shaw.ca", "rogers.com",
    "bell.net", "eastlink.ca", "videotron.ca",
    "telus.net", "cogeco.ca",
    "comcast.net", "att.net", "sbcglobal.net",
    "bellsouth.net", "verizon.net", "cox.net",
    "charter.net", "earthlink.net", "juno.com",
    "netzero.net", "optonline.net", "roadrunner.com",
    "twc.com", "centurylink.net", "windstream.net",
    "protonmail.com", "proton.me",
    "tutanota.com", "tuta.com",
    "mailfence.com", "disroot.org",
    "runbox.com", "hushmail.com",
    "fastmail.com", "fastmail.fm",
    "posteo.de", "mailbox.org",
    "startmail.com", "ctemplar.com",
    "mail.com", "email.com", "inbox.com",
    "zoho.com", "gmx.us", "usa.com",
    "myself.com", "asia.com", "europe.com"
)

New-TransportRule `
    -Name "Avertissement - Expéditeur webmail public (2/2)" `
    -SenderDomainIs $domaines2 `
    -ExceptIfHeaderContainsMessageHeader "Auto-Submitted" `
    -ExceptIfHeaderContainsWords "auto-generated","auto-replied","auto-notified" `
    -ApplyHtmlDisclaimerLocation Prepend `
    -ApplyHtmlDisclaimerText $banniere `
    -ApplyHtmlDisclaimerFallbackAction Wrap `
    -SetHeaderName "X-Webmail-Sender-Warning" `
    -SetHeaderValue "true" `
    -Enabled $true `
    -Mode Enforce `
    -Priority 0
