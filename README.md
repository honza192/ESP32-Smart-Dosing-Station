# 🧪 ESP32 Smart Dosing Station (4-Channel)

Kompletní open-source 4kanálová dávkovací stanice pro akvária a hydroponii postavená na ESP32, 4kanálovém MOSFET modulu a peristaltických čerpadlech INTLLAB.

A complete open-source 4-channel dosing station for aquariums and hydroponics powered by ESP32, 4-channel MOSFET driver, and INTLLAB peristaltic pumps.

---

## ✨ Features / Vlastnosti
- **4× Peristaltické čerpadlo INTLLAB** (12V) se skloněným vývodem.
- **ESP32 s Expansion Boardem** (snadné zapojení bez pájení na breadboard).
- **0.96" OLED displej (SPI)** umístěný na čelním panelu pro snadnou čitelnost zespodu z police.
- **Držák hadiček na sklo 15 mm** s úhlem 20° (hadičky se nelámou) a zacvakávacím profilem (drop-in).
- Plně parametrické 3D modely vytvořené v **OpenSCAD**.

---

## 🛒 Bill of Materials / Seznam komponent
1. **ESP32 DevKit + Expansion Board** (30/38 pin dle verze se svorkovnicemi)
2. **4-kanálový MOSFET modul** (např. 4x IRF540)
3. **4× INTLLAB peristaltické čerpadlo** (12V do panelu / s konzolou)
4. **0.96" OLED displej SSD1306** (7-pin SPI)
5. **DC napájecí konektor do panelu** (5.5 / 2.1 mm, otvor 8 mm)
6. **Napájecí adaptér 12V DC** (min. 2A)
7. **Step-Down měnič** (např. Mini MP1584EN z 12V na 5V pro napájení ESP32)
8. **Spojovací materiál:** Šroubky M3 se zápustnou hlavou do rohů víka. Šroubky M2,5 a matičky přišroubovaní peristalu.
9. **Silikonová hadička:** Vnější průměr 6 mm (4/6 mm).

---

## 🖨️ 3D Printing / Tiskové soubory
Soubory najdete ve složce `/3d_models`:
- `dosing_station_box.stl` – Tělo krabičky (tisk bez podpěr)
- `dosing_station_lid.stl` – Horní víko se zapuštěním pro šrouby M3
- `rim_tube_holder_15mm.stl` – Držák hadiček na 15mm sklo
- `.scad` zdrojové soubory pro úpravu parametrů v programu OpenSCAD.

*Doporučený materiál:* **PETG** (chemická a mechanická odolnost).

---

## 🔌 Wiring / Zapojení
- **Napájení:** 12V adaptér -> DC Jack -> Svorky MOSFETu (Power IN) + Vstup Step-Downu.
- **ESP32:** Výstup ze Step-Downu (5V) -> VIN / 5V svorka Expansion boardu.
- **Řízení MOSFETů:** GPIO výstupy ESP32 -> IN1 až IN4 na MOSFET modulu.
- **OLED Displej:** SPI piny ESP32 (VCC na 3.3V, GND, SCK/D0, MOSI/D1, RES, DC, CS).

---

## 📜 License
Tento projekt je šířen pod licencí **MIT**. Můžete jej volně upravovat a stavět.
