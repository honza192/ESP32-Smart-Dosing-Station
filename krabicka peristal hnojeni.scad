// =========================================================================
// DÁVKOVAČ - FINÁLNÍ VERZE (OPRAVENÉ VÍKO + DISPLAY NA LEPENÍ)
// =========================================================================

/* [Zobrazení] */
zobrazit = "krabicka"; // Nastaveno rovnou na "viko" pro okamžitý tisk! ("krabicka", "viko", "vse_najednou")

/* [Typ uchycení víka] */
typ_uchyceni = "samorez"; // "samorez" (díra 2.8mm) nebo "vlozka_m3" (díra 4.2mm pro mosazné inserty)

/* [Hlavní rozměry skříně] */
vnitrni_x = 230; // Šířka
vnitrni_y = 155; // Hloubka
vnitrni_z = 98;  // Výška krabičky
tloustka = 2.5;  // Tloušťka stěn

/* [Rozměry čerpadel INTLLAB] */
prumer_tela = 30.0;
roztec_sroubu = 48.5;
prumer_sroubu = 3.4;
cerpadlo_stred_z = 28.0;

/* [OLED Displej 0.96" SPI - LŮŽKO PRO NALEPENÍ] */
oled_stred_x = vnitrni_x / 2;
oled_stred_z = 74.0;
oled_pcb_w = 28.0;            // Šířka lůžka
oled_pcb_h = 28.0;            // Výška lůžka
oled_kapsa_hloubka = 1.4;     // Zápustná kapsa zevnitř pro přesné vlepení
oled_sklo_w = 24.0;           // Průchozí okénko na obraz
oled_sklo_h = 13.0;
oled_offset_z = -2.0;

/* [Rozměry MOSFET modulu] */
mosfet_diry_dx = 60.0;
mosfet_diry_dy = 60.0;

/* [Rozměry ESP32 Expansion Boardu] */
esp_board_x = 78.0;
esp_board_y = 63.0;
esp_diry_dx = 73.0;
esp_diry_dy = 59.0;

/* [DC Konektor] */
dc_prumer = 8.0;

// Pomocné rozměry
vnejsi_x = vnitrni_x + 2 * tloustka;
vnejsi_y = vnitrni_y + 2 * tloustka;
vnejsi_z = vnitrni_z + tloustka;

prumer_diry_sloupek = (typ_uchyceni == "vlozka_m3") ? 4.2 : 2.8;
hloubka_diry_sloupek = (typ_uchyceni == "vlozka_m3") ? 8.0 : 16.0;

esp_start_x = vnejsi_x - tloustka - 4 - esp_board_x;
esp_start_y = tloustka + 72;

$fn = 40;

// ==========================================
// VYKRESLENÍ
// ==========================================
if (zobrazit == "krabicka") {
    hlavni_krabicka();
} else if (zobrazit == "viko") {
    viko();
} else if (zobrazit == "vse_najednou") {
    hlavni_krabicka();
    translate([0, vnejsi_y + 15, 0]) viko();
}

// ==========================================
// HORNÍ VÍKO (OPRAVENÉ ZAPUŠTĚNÍ ZVNĚJŠKU)
// ==========================================
module viko() {
    vyska_lem = 3.0;
    difference() {
        union() {
            // Hlavní deska víka (Z = 0 až 2.5 mm)
            cube([vnejsi_x, vnejsi_y, tloustka]);
            
            // Zápustný výztužný lem směřující do krabičky (Z = 2.5 až 5.5 mm)
            translate([tloustka + 0.4, tloustka + 0.4, tloustka])
                difference() {
                    cube([vnitrni_x - 0.8, vnitrni_y - 0.8, vyska_lem]);
                    translate([2, 2, -1])
                        cube([vnitrni_x - 0.8 - 4, vnitrni_y - 0.8 - 4, vyska_lem + 2]);
                        
                    // Výřezy v rozích pro sloupky
                    translate([-1, -1, -0.5]) cube([14, 14, vyska_lem + 1]);
                    translate([vnitrni_x - 13, -1, -0.5]) cube([14, 14, vyska_lem + 1]);
                    translate([-1, vnitrni_y - 13, -0.5]) cube([14, 14, vyska_lem + 1]);
                    translate([vnitrni_x - 13, vnitrni_y - 13, -0.5]) cube([14, 14, vyska_lem + 1]);
                }
        }
        
        // 4 ROHOVÉ OTVORY SE ZAPUŠTĚNÍM Z VNĚJŠÍ POHLEDOVÉ STRANY
        otvor_sroub_viko(tloustka + 6, tloustka + 6);
        otvor_sroub_viko(vnejsi_x - tloustka - 6, tloustka + 6);
        otvor_sroub_viko(tloustka + 6, vnejsi_y - tloustka - 6);
        otvor_sroub_viko(vnejsi_x - tloustka - 6, vnejsi_y - tloustka - 6);
    }
}

// Opravený modul otvoru - hlava šroubu zapuštěna shora
module otvor_sroub_viko(x, y) {
    // 1. Průchozí díra přes celou tloušťku víka i lemu
    translate([x, y, -1])
        cylinder(d = 3.4, h = tloustka + 6);
        
    // 2. Zapuštění pro hlavičku z VNĚJŠÍ strany (Z = -0.1 až 1.6 mm)
    // Průměr 6.5 mm pojme jak válcovou, tak zápustnou hlavičku M3
    translate([x, y, -0.1])
        cylinder(d = 6.5, h = 1.6);
}

// ==========================================
// HLAVNÍ KRABIČKA (SLOUPKY PRO DISPLAY ODSTRANĚNY)
// ==========================================
module hlavni_krabicka() {
    difference() {
        union() {
            // Základní tělo
            difference() {
                cube([vnejsi_x, vnejsi_y, vnejsi_z]);
                translate([tloustka, tloustka, tloustka])
                    cube([vnitrni_x, vnitrni_y, vnitrni_z + 1]);
            }
            
            // Rohové sloupky pro víko (12x12 mm)
            rohovy_sloupek(tloustka, tloustka);
            rohovy_sloupek(vnejsi_x - tloustka - 12, tloustka);
            rohovy_sloupek(tloustka, vnejsi_y - tloustka - 12);
            rohovy_sloupek(vnejsi_x - tloustka - 12, vnejsi_y - tloustka - 12);

            // Sloupky MOSFET (vlevo vzadu)
            translate([tloustka + 35, tloustka + 75, tloustka]) {
                dno_sloupek(0, 0);
                dno_sloupek(mosfet_diry_dx, 0);
                dno_sloupek(0, mosfet_diry_dy);
                dno_sloupek(mosfet_diry_dx, mosfet_diry_dy);
            }

            // Sloupky ESP32 Expansion (vpravo vzadu)
            translate([esp_start_x + (esp_board_x - esp_diry_dx)/2, esp_start_y + (esp_board_y - esp_diry_dy)/2, tloustka]) {
                dno_sloupek(0, 0);
                dno_sloupek(esp_diry_dx, 0);
                dno_sloupek(0, esp_diry_dy);
                dno_sloupek(esp_diry_dx, esp_diry_dy);
            }
        }

        // 4x čerpadla dole na čele
        roztec_mezi_cerpadly = vnitrni_x / 4;
        for (i = [0:3]) {
            stred_x = tloustka + (i * roztec_mezi_cerpadly) + (roztec_mezi_cerpadly / 2);
            translate([stred_x, tloustka / 2, tloustka + cerpadlo_stred_z])
                otvor_pro_cerpadlo_s_konzolou();
        }

        // OLED: Průchozí okénko na obraz zvenku
        translate([tloustka + oled_stred_x - oled_sklo_w/2, -1, tloustka + oled_stred_z + oled_offset_z - oled_sklo_h/2])
            cube([oled_sklo_w, tloustka + 2, oled_sklo_h]);

        // OLED: Přesné lůžko pro vložení a přilepení displeje zevnitř
        translate([tloustka + oled_stred_x - oled_pcb_w/2, tloustka - oled_kapsa_hloubka, tloustka + oled_stred_z - oled_pcb_h/2])
            cube([oled_pcb_w, oled_kapsa_hloubka + 0.1, oled_pcb_h]);

        // DC konektor vzadu
        translate([tloustka + 20, vnejsi_y + 1, tloustka + 20])
            rotate([90, 0, 0])
                cylinder(d = dc_prumer, h = tloustka + 4);

        // Větrací mřížka vzadu
        for (j = [0:6]) {
            translate([tloustka + 45 + (j * 8), vnejsi_y + 1, tloustka + 30])
                cube([3.5, tloustka + 4, 35]);
        }

        // USB otvor v pravé boční stěně
        translate([vnejsi_x - tloustka - 1, esp_start_y + (esp_board_y / 2) - 7, tloustka + 14])
            cube([tloustka + 4, 14, 10]);
            
        // Rohové díry pro šrouby víka
        dira_pro_sroub_v_krabicce(tloustka + 6, tloustka + 6);
        dira_pro_sroub_v_krabicce(vnejsi_x - tloustka - 6, tloustka + 6);
        dira_pro_sroub_v_krabicce(tloustka + 6, vnejsi_y - tloustka - 6);
        dira_pro_sroub_v_krabicce(vnejsi_x - tloustka - 6, vnejsi_y - tloustka - 6);
    }
}

// ==========================================
// POMOCNÉ MODULY
// ==========================================
module otvor_pro_cerpadlo_s_konzolou() {
    rotate([90, 0, 0]) {
        cylinder(d = prumer_tela, h = tloustka + 4, center = true);
        translate([-roztec_sroubu / 2, 0, 0])
            cylinder(d = prumer_sroubu, h = tloustka + 4, center = true);
        translate([roztec_sroubu / 2, 0, 0])
            cylinder(d = prumer_sroubu, h = tloustka + 4, center = true);
    }
}

module rohovy_sloupek(x, y) {
    translate([x, y, tloustka]) cube([12, 12, vnitrni_z]);
}

module dira_pro_sroub_v_krabicce(x, y) {
    translate([x, y, vnejsi_z - hloubka_diry_sloupek + 0.1])
        cylinder(d = prumer_diry_sloupek, h = hloubka_diry_sloupek + 1);
}

module dno_sloupek(x, y) {
    translate([x, y, 0])
        difference() {
            cylinder(d = 6.5, h = 4.0);
            translate([0, 0, -0.5]) cylinder(d = 2.5, h = 5.0);
        }
}