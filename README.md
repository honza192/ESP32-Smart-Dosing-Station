# 🧪 ESP32 Smart Dosing Station (4-Channel)

Kompletní open-source 4kanálová dávkovací stanice pro akvária a hydroponii postavená na ESP32, 4kanálovém MOSFET modulu, peristaltických čerpadlech INTLLAB a ESPHome (Home Assistant).

A complete open-source 4-channel dosing station for aquariums and hydroponics powered by ESP32, 4-channel MOSFET driver, INTLLAB peristaltic pumps, and ESPHome (Home Assistant).

---

## ✨ Features / Vlastnosti
- **4× Peristaltické čerpadlo INTLLAB** (12V) s plynulým dávkováním.
- **ESP32 s Expansion Boardem** (snadné zapojení bez pájení na šroubovací svorky).
- **0.96" OLED displej (I2C)** umístěný na čelním panelu pro snadnou čitelnost zespodu z police.
- **Držák hadiček na sklo 15 mm** s úhlem 20° (hadičky se nelámou) a zacvakávacím profilem (drop-in).
- **Plná integrace do Home Assistantu** přes ESPHome (nastavení časů, dávek, kalibrace i ruční sepnutí).
- Plně parametrické 3D modely vytvořené v **OpenSCAD**.

---

## 🛒 Bill of Materials / Seznam komponent
1. **ESP32 DevKit + Expansion Board** (30/38 pin dle verze se svorkovnicemi)
2. **4-kanálový MOSFET modul** (např. 4x IRF540)
3. **4× INTLLAB peristaltické čerpadlo** (12V do panelu / s konzolou)
4. **0.96" OLED displej SSD1306** (I2C, 4 piny: VCC, GND, SCL, SDA)
5. **DC napájecí konektor do panelu** (5.5 / 2.1 mm, montážní otvor 8 mm)
6. **Napájecí adaptér 12V DC** (min. 2A)
7. **Step-Down měnič** (např. Mini MP1584EN z 12V na 5V pro napájení ESP32)
8. **Spojovací materiál:** 
   - 4× šroub M3 se zápustnou hlavou do rohů víka
   - 8× šroubek M2,5 s maticemi na přišroubování čerpadel
9. **Silikonová hadička:** Vnější průměr 6 mm (rozměr 4/6 mm).

---

## 🖨️ 3D Printing / Tiskové soubory
Soubory najdete ve složce `/3d_models`:
- `dosing_station_box.stl` – Tělo krabičky (tisk bez podpěr)
- `dosing_station_lid.stl` – Horní víko se zapuštěním pro šrouby M3
- `rim_tube_holder_15mm.stl` – Držák hadiček na 15mm sklo
- `.scad` – Zdrojové soubory pro snadnou úpravu parametrů v programu OpenSCAD.

*Doporučený materiál:* **PETG** (chemická odolnost vůči hnojivům a pružnost klipů).

---

## 🔌 Wiring / Zapojení
- **Napájení / Power:** 12V adaptér -> DC Jack -> Svorky MOSFETu (Power IN) + Vstup Step-Down měniče.
- **ESP32 napájení:** Výstup Step-Downu (5V) -> VIN svorka Expansion boardu + GND.
- **Řízení MOSFETů (GPIO):**
  - Čerpadlo 1 -> **GPIO 25**
  - Čerpadlo 2 -> **GPIO 26**
  - Čerpadlo 3 -> **GPIO 27**
  - Čerpadlo 4 -> **GPIO 33**
- **OLED Displej (I2C):**
  - SDA -> **GPIO 21**
  - SCL -> **GPIO 22**
  - VCC -> 3.3V, GND -> GND

---

## ⚖️ Calibration / Kalibrace

Systém využívá jednoduchou a přesnou 10sekundovou kalibraci přímo z Home Assistantu:
1. Výstupní hadičku kalibrovaného čerpadla vložte do odměrného válce nebo injekční stříkačky.
2. V Home Assistantu stiskněte tlačítko **„Čerpadlo X - Kalibrace (10s)“**.
3. Čerpadlo poběží přesně 10 vteřin.
4. Změřte, kolik ml reálně nateklo, a tuto hodnotu zadejte do pole **„Čerpadlo X - Kalibrace (ml/10s)“**.
5. ESP32 si automaticky přepočítá přesný čas běhu pro jakoukoliv zadanou dávku v ml.

The system uses a simple 10-second calibration routine for each individual pump:
1. Place the dosing tube into a measuring cylinder or syringe.
2. In Home Assistant, press the **"Pump X - Calibration (10s)"** button.
3. The pump runs for exactly 10 seconds.
4. Measure the delivered liquid in ml and enter this value into **"Pump X - Calibration (ml/10s)"**.
5. ESP32 automatically calculates the exact runtime for any target dose.

---

## ☕ Support / Podpora
Pokud se vám projekt líbí a ušetřil vám čas nebo peníze za drahý komerční dávkovač, můžete mě podpořit a pozvat mě na virtuální kafe!

If you like this project and it saved you time or money, consider supporting me!

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/honza192)

---

## 📜 License
Tento projekt je šířen pod licencí **MIT**. Můžete jej volně upravovat, stavět a šířit.
