// =========================================================================
// DRŽÁK 4x HADIČKY NA SKLO 15mm - SPRÁVNĚ V OSE SRAŽENÝ NÁBĚH (20°)
// =========================================================================

/* [Nastavení hadiček a sklonu] */
uhel_sklonu = 20.0;         // Sklon 20° směrem do akvária
pocet_hadicek = 4;
hadicka_vnejsi_d = 6.2;     // Kruhové lůžko pro 6mm hadičku
hadicka_zarez_w = 4.2;      // Zúžení pro zacvaknutí silikonu
roztec_hadicek = 12.0;      // Rozteč mezi hadičkami
odsazeni_od_skla = 13.0;    // Odsazení od vnitřní stěny skla

/* [Parametry skla] */
tloustka_skla = 15.0;       // Tloušťka skla
vule_skla = 0.4;            // Šachta 15.4 mm
hloubka_nasunuti = 26.0;    // Hloubka sedla na sklo

/* [Konstrukce] */
stena_klipu = 4.0;
vyska_vedeni = 22.0;

// Pomocné rozměry
sachta_sklo = tloustka_skla + vule_skla;
sirka_drzaku = (pocet_hadicek - 1) * roztec_hadicek + 20.0; // cca 56 mm
vyloha_celkova_y = odsazeni_od_skla + hadicka_vnejsi_d + stena_klipu + 4.0;

$fn = 50;

// ==========================================
// VYKRESLENÍ
// ==========================================
drzak_hadicek_final();

module drzak_hadicek_final() {
    difference() {
        // 1. ZÁKLADNÍ TĚLO
        union() {
            // Sedlo přes sklo
            cube([sirka_drzaku, sachta_sklo + 2 * stena_klipu, hloubka_nasunuti + stena_klipu]);
            
            // Konzola pro hadičky směřující do akvária
            translate([0, sachta_sklo + stena_klipu, 0])
                cube([sirka_drzaku, vyloha_celkova_y, vyska_vedeni + stena_klipu]);
        }

        // 2. ŠACHTA PRO SKLO (15.4 mm)
        translate([-1, stena_klipu, stena_klipu])
            cube([sirka_drzaku + 2, sachta_sklo, hloubka_nasunuti + 10]);

        // Náběhové zkosení pro nasunutí na sklo zespodu
        translate([-1, stena_klipu, hloubka_nasunuti + stena_klipu])
            rotate([45, 0, 0]) cube([sirka_drzaku + 2, 3, 3]);

        translate([-1, stena_klipu + sachta_sklo, hloubka_nasunuti + stena_klipu])
            rotate([45, 0, 0]) cube([sirka_drzaku + 2, 3, 3]);

        // 3. ŠIKMÉ ZACVAKÁVACÍ KANÁLY SE SPRÁVNÝM NÁBĚHEM V OSE
        hadicky_stred_y = sachta_sklo + stena_klipu + odsazeni_od_skla + (hadicka_vnejsi_d / 2);
        stred_vysky = (vyska_vedeni + stena_klipu) / 2;
        delka_rezu = vyska_vedeni + stena_klipu + 15;
        
        for (i = [0 : pocet_hadicek - 1]) {
            hadicka_x = (sirka_drzaku - (pocet_hadicek - 1) * roztec_hadicek) / 2 + (i * roztec_hadicek);

            translate([hadicka_x, hadicky_stred_y, stred_vysky]) {
                rotate([-uhel_sklonu, 0, 0]) {
                    
                    // A) Hladký průchozí C-profil (lůžko + drážka + trychtýř)
                    linear_extrude(height = delka_rezu, center = true) {
                        profil_hadicky_2d();
                    }

                    // B) Plnohodnotný náběhový kužel PŘESNĚ V OSE KANÁLU
                    // Začíná bezpečně nad šikmou rovinou a plynule přechází do 6.2 mm otvoru
                    translate([0, 0, -17.0])
                        cylinder(d1 = 10.2, d2 = hadicka_vnejsi_d, h = 5.5);
                }
            }
        }
    }
}

// ==========================================
// HLADKÝ 2D PROFIL PRO ZACVAKNUTÍ HADIČKY
// ==========================================
module profil_hadicky_2d() {
    // A) Kruhové lůžko pro hadičku
    circle(d = hadicka_vnejsi_d);
    
    // B) Plynulý zářez s trychtýřem na čele
    polygon(points = [
        [-hadicka_zarez_w / 2, 0],
        [ hadicka_zarez_w / 2, 0],
        [ hadicka_zarez_w / 2, 8.5],
        [ 4.25, 8.5 + 3.0],          // náběh trychtýře (šířka 8.5 mm)
        [ 4.25, 25.0],               // průchod ven z čela
        [-4.25, 25.0],
        [-4.25, 8.5 + 3.0],
        [-hadicka_zarez_w / 2, 8.5]
    ]);
}