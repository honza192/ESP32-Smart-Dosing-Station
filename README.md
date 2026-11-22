# 🧪 ESP32 Smart Dosing Station (4-Channel)

A complete open-source 4-channel automated dosing station for aquariums and hydroponics, powered by ESP32, a 4-channel MOSFET driver, INTLLAB peristaltic pumps, and ESPHome (Home Assistant).

Kompletní open-source 4kanálová automatická dávkovací stanice pro akvária a hydroponii postavená na ESP32, 4kanálovém MOSFET modulu, peristaltických čerpadlech INTLLAB a ESPHome (Home Assistant).

---

## ✨ Features / Vlastnosti

### 🇬🇧 English
- **4× INTLLAB Peristaltic Pumps (12V)** with smooth and precise dosing.
- **ESP32 with Screw-Terminal Expansion Board** (easy, solder-free wiring).
- **0.96" OLED Display (I2C)** mounted on the front panel.
- **15 mm Rim Tube Holder** with a 20° tilt angle (prevents silicone tubing from kinking) and snap-in (drop-in) channels.
- **Full Home Assistant Integration** via ESPHome (dosing schedules, volume adjustments, 10-second calibration routine, and manual prime buttons).
- Fully parametric 3D printable enclosures designed in **OpenSCAD**.

### 🇨🇿 Čeština
- **4× Peristaltické čerpadlo INTLLAB (12V)** s plynulým a přesným dávkováním.
- **ESP32 s Expansion Boardem** (snadné zapojení bez pájení na šroubovací svorky).
- **0.96" OLED displej (I2C)** na čelním panelu.
- **Držák hadiček na 15mm sklo** s úhlem 20° (hadičky se nelámou) a zacvakávacím profilem (drop-in).
- **Plná integrace do Home Assistantu** přes ESPHome (nastavení časů, dávek, kalibrace i ruční odvzdušnění/sepnutí).
- Plně parametrické 3D modely vytvořené v programu **OpenSCAD**.

---

## 🛒 Bill of Materials / Seznam komponent

| # | Component / Komponenta | Description / Popis |
|---|------------------------|---------------------|
| 1 | **ESP32 DevKit + Expansion Board** | 30/38 pin board with screw terminals / se svorkovnicemi |
| 2 | **4-Channel MOSFET Module** | 4-channel driver (e.g. 4× IRF540) / 4kanálový spínací modul |
| 3 | **4× INTLLAB Peristaltic Pumps** | 12V panel/bracket mount / 12V verze s konzolou do panelu |
| 4 | **0.96" OLED Display SSD1306** | I2C version (4 pins: VCC, GND, SCL, SDA) |
| 5 | **Panel-Mount DC Barrel Jack** | 5.5 / 2.1 mm (8 mm mounting hole / montážní otvor 8 mm) |
| 6 | **12V DC Power Supply** | 12V DC adapter (min. 2A) / Napájecí adaptér 12V (min. 2A) |
| 7 | **Step-Down Buck Converter** | Mini MP1584EN (12V to 5V for ESP32) / z 12V na 5V pro ESP32 |
| 8 | **Fasteners / Spojovací materiál** | 4× M3 countersunk screws (lid), 8× M2.5 screws + nuts (pumps) |
| 9 | **Silicone Tubing / Hadičky** | 6 mm outer diameter (4/6 mm) / vnější průměr 6 mm (4/6 mm) |

---

## 🖨️ 3D Printing / Tiskové soubory


- `krabicka peristal hnojeni.scad` – Main enclosure body, prints without supports / Tělo skříně (tisk bez podpěr)
- `krabicka peristal hnojeni viko.stl` – Top lid with countersunk M3 screw holes / Horní víko se zapuštěním pro šrouby M3
- `drzak hadicek hnojeni.stl` – 15 mm glass rim tube holder / Držák hadiček na 15mm hranu skla
- `*.scad` – Fully parametric OpenSCAD source files / Zdrojové soubory OpenSCAD pro vlastní úpravy

> **Recommended Material / Doporučený materiál:** **PETG** (excellent chemical resistance to aquarium fertilizers, UV resistance, and clip elasticity / chemická odolnost vůči hnojivům a pružnost klipů).

---

## 🔌 Wiring / Zapojení
