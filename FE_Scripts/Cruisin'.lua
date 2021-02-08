return (function(h, a, p)
    local k = string.char;
    local e = string.sub;
    local l = table.concat;
    local o = math.ldexp;
    local q = getfenv or function() return _ENV end;
    local n = select;
    local g = unpack or table.unpack;
    local j = tonumber;
    local function m(h)
        local b, c, f = "", "", {}
        local d = 256;
        local g = {}
        for a = 0, d - 1 do g[a] = k(a) end
        local a = 1;
        local function i()
            local b = j(e(h, a, a), 36)
            a = a + 1;
            local c = j(e(h, a, a + b - 1), 36)
            a = a + b;
            return c
        end
        b = k(i())
        f[1] = b;
        while a < #h do
            local a = i()
            if g[a] then
                c = g[a]
            else
                c = b .. e(b, 1, 1)
            end
            g[d] = b .. e(c, 1, 1)
            f[#f + 1], b, d = c, c, d + 1
        end
        return table.concat(f)
    end
    local i = m(
                  '25426827526B26I27526823W23Z23L23O24324424223T23Y23R26B26C27923R23L23X23P26B26F27924O24424424024N23P24426B25D27923L22W25B21O24C21F23J1P25F22025825V26025W1K24X21Z26T1H23Z22J25724424823D26222926P23A23J24C22623M26B26J27924Y24523Y25C24Z23P24224623T23N27R26H27U23P23L24224423M29I28126E28423Y23T23X23T23O26B26V27924223M24823L24324328029U26225R25R25X25S25Z26126125X25U25S25V25W26B26B27924023W24227S27924W23W23L24929A24329227924S23Z23N23L23W2AS2AU29A26B26Z27923M24224523S23X23Z27Q23Y27G23T23R23S24423S23L2BO2BQ2BQ2BP26B29G27524J2BO24223L23N2442B726A27923N23Q26B26O27U24523X23L23Y23Z29U24Y23Z23Z24424W29J29O27924J24M2BZ27Q26B26927928126D27925023Z24224323Z26B2C42752D126B26M2942BK2BM29823S23Z24523W23O2C327923W2AX26L2AZ23P23Q2442DD2DF2DH2DJ2D623S2BU2DA2BL2DR24O23T2402D42DK2DX26G2DO2DQ25C2E22E42CU27523Y27L27924U23P23N23V2E52D623U2DY2752CH2CJ24Q2CF2BI2EH2D624323N25S2EN26824J2F127M2752DL2F02EX26824223S2F92F627A2FD2F529Y23U2F92AL2EF2FL27N2FO2EF23P24726B2CX2752D02EZ2F12FV26823Z2F82FZ2792D02FH2FU2G523W2G72G02D02FK2FI2FW23Y2F929P27523N2DF2BI25U2EE27926825524G2EQ2682CC2482GL29624425U2AQ2BW23Z23Y23Y2EK28127827527Z24424V23M23U2H72432GP2791G2672G827524723L23T2H02FA2CD29S2H226823V2DQ2CJ23M23W2HM2682402HP2D72932HA2802BX23T2DH24223P2EG2FM26824P24324H26B2E827524R23P24923Q2CR27R2FF25029S27R27T27523R2802H62482CW2C52GM2442HI2GQ2FA23N2BY2FA23S2JE2E72CA2CC2CE29U2IL27924H29R2CC2442D026B2GJ2682CL2ID2BI26826B26X2792HB2B524927I23R2JN29S23L24423T2H42502BZ2EL2AX2FF24Z2JQ2E42FF2HO2HQ2HS24323O2C72GP2462F224S27K2D526824Y2KW2AZ23X2F224Y2L22KX2CZ2F224O29V2G024027H2EW2BV2682KD2CD24323Q2D02L22J92JT27F2LD27K2IG24324523M2J81023Z2GT25F27926H1S25N22426N1922821I24Z21525R24N25925223H26722X24623I26A23825L26T26N22E26H142591S21925W23E25O23124Y2J822O24H24G2J827524G2FF26P2792JS2J52GZ2GO2GQ2752HK2GU2GW2GY2GN2F22D72LF2LH23Y2LJ2LL2FA24S29A2KK29Y2FY2F22DL2FA2G32NM2DX2FF2FC2F92KX2GA2O12G72GP2IF2792GH2F12KX2422EP2O52GE2GQ24L27926Q23M2792GP25C2NF2682C426Q2GQ2GP2OX2OR2OO2752CU2IG2JT2682E82CU2CU26C25R2792P82682PB27924K2682CU26Q2622792FF26Q23U2PJ2PF2792OT2PR2CU2CX2PU2P926829P2P02AL2IY2682P027M2OZ2752CX2IG2PN2PS2G02PR27M2C42C92792CX2PK2GQ2IM2Q52P32P72PT2QP2PW2682PY2PR2Q12762682LF2Q62PR2752P02QA2OU27M27M2QE2PA2OV2682QI2Q92PR2P02752H92QO2PR2RI2QV2QT2RM2Q02RJ2AL2I72RJ2Q72P22682R52NF2R72RW2OY2PS2QH2GQ2QK2RJ27526K2RV2CU2S82752RO2PX2QS2RP2Q22682DN2R32752RU2SK2S02QB2SL2QD2S12QG2RC2S42RF2GQ2D92SN2CU2SY2QU2SF2SE2PV2SG2QY26N2RV2SM2RJ2RX2GQ2RZ2R92S22SU2QJ2SW2792RD2P02CU2RD2SD2T22T52QX2JY2682N92SN2TA2R42TT2RY2SR2P12ST2RD2S02EE25A2P12TI2P323E23D2UC2UC22H2HL2KL2HP2J72OU25G2N42OU2HK2N524K24G2GQ2TV26825I2Q427T2PZ2PG2752UX2S72R22PT2402T52OW25J2TT2QB24Y2PR2AL2PA2PC2752C92PK2V82RA2SC29X2KX2CX26Q2V82AL2FF26C24S2PR2VH2V22QE2QU2V52CX2CX2V726827T2VA2S02V126C24U2PR2932U62U82PJ2RI2FA29L23W25V2I22I423T2D72T12HB24K23P2EZ2IE23O2CD2442AX2IG2II2IK2FF24W23Z2A42NB2752LP2K52AK2792LT2912FF24U27P23P2N52NH2JT2CP2IS2GQ25G2GQ24N2V32SZ2V32TM2RB2SC2752KX2QB2C42SP2V32VR2GQ2732PR25C2V529P2CX27M2VP2QQ2QE24I2RP2E82C426E26U2RP2DN2UY2VF2SI2QF2YO2Y52PK2PM29P2OZ25L2W42RP2XW2YY27T27T2PU2E82CX2E82P029G2R02RH2QZ2OU27T2782OW2752E82JT2Z42QQ2Z327529G2Z62TQ2782ZP2792782RL2752932ZS2ZW2682RS2PD31002XV2V02YY2E82ZK2CX2RI2RP27T2ZI24X2PR2V12C42UZ2YY2YT2T527925N2PR2KX2682U72QP2P32G02CT2C52N52GS2I229K24223Y2462N52762LB2I52432GQ29X2R325W2RB2KX2P02C42Q82RB2PO2XX2TZ2RJ2C42VY311L2NF2C4310H2PS2P22CU26E2452WB2PR2YA2YO2WC2PF2YO2OX2EE2Y527T2S52PL2QQ2GP26E24V2YY31252QQ310I312G26831272U52Q5263310J2OO312O2TC26E310E2C42PE310H2YO2PE312A2Y02GQ310N311R2GQ310R2V326A22Y2EE26Q2472WE2XU2KX2RO2AL2R12FF27929P2FF2D529P2P6275313O2OU313R2QL2QQ2VB2SN29G24Z2PT2C42Z92LG2Q52AL278313Z2Z02ZU2682672GQ31012RJ2S82662RV2DN2512RV2D925V2QC2682S826W2R22552SU310A314S2N92T82792412SU31342F331032T82QI24J31032C92T82W9314O2QO2VI315B2522OO2V82DN314M2792462682D92JT2YC2T8315J2PF2VU2DN2572Y624C2TU2SU314M25C2K02N92N92532TQ3163268315R2QO2QN27926R2YY2NF26S2ZC2NF26T2YZ2GQ2YK2U427529X316N268316G2VM2GQ316G293316G2GR268316J2LF2YP2YK2SB3119315Y2NF314Q2UT279316J314Q310P316J293316J27929X316X2GQ314Q317G2XV29X311A3175317P317H26829X315D2K0315R2YC26Y268314G27526M23Y318026824M2PR29X310I31872T03184314G318B268314Q318A2Y624B2682B929X27425C318K270318G26827426E314M2B9314G2CU318R310I318Y275317Z31942682K0312K268271317T318L2QU2613199319F274279272318S318R2PU319J319J318O2752K02K0319H275314Q319J2NF29X319A2SQ27925X2QW312E29X24P2PR318H2YO31A62EE314S29X314Q3182318D31432CU31892YO250318J319C318N315M31AG312E2CU2B9310I31AR3193268319531972Y5318R29X2B925C314G318R318R318O29X319R318T27531AC268318R2SL31A9314R268316D317Z279314S316G2B92G5315M2RY2YO2742EE25K31BJ3103316D2S02Z731BX315A2DN319A31AB2TT316B314S27M317123Z311T2PN2YO25B2R224A2PS2HI24T2QF2OU2GQ310P2SF2RG31042PU2SV31CT313K2RJ2CU2QN2XU2Q4313E2QR2T52782RO2932XU2ZA2PR2LF2RO2DN2XU317431DE31D32PZ2T82RO2C92XU2T131DG2Z02PZ2OX2XU2UT31DS31DH2PR316G2XU31BZ31CX31762TQ2PZ2YK2XU317M31DU31DP31A731E0317P31E731E22PR317Z2XU319731E02UT2RO318R2XU31BP31E031742RO31DJ2SF319J2XU319Z31E031DZ2RO2OT2XU2Y52XS317M31EY31E02832XS317P31F42XU25E2S9319631DV2CU31EZ2QP2M02XS31EV31F92QP2XO2XS31EN31FL2PR25H31FC2TO2SF2V82P12CU2ZG2PR25I31FC31EX2SF31FG2PR31BW31F231FE2T22XU2YX31F731G931G52CU25M31FC31EH31FQ2CU310N31FJ31GE31E025O31FC31FP31G42Q52D92CU25P31FC31242QP25Q31GY31FC25S31FC313F2T331ED311V31H826825T2OV23S311P27531GQ2P42TJ31FY31G925U2RQ316E2S12AL2C42RO314M31D0313K31AL2PZ2PZ2S62GQ26Q312O2CU311C2M12XR312N2PR31A22XX31HE31HK2R3314J2CU25Y31FC25Z2RV2C42Q42PU313426031CO31HF2Y231CD26821M2Y62Y82S0319E2YC2E82PM2792YF29P2YH2Q02YK29P21G2T5310I31J92VE27931IU310K29P31I92QU23R2YY2CX312O2P02E831IG2NF2ZO2OU31J5310P29P310C2Q0310E2CU21A310O312327931K131FY31IB311L26Q2YV26826431FC318131E026531H531G931D52SF29331DC31E0314B2XS31H631D42QU311G311Y25C24E2T52DN2RO24H31HA2YF2XU2UR2XS31L426831H42PR31562PI2XU31II2SN2C431KO2TQ313431L031IM2RB2ON2682ZF311P23L31IR310I1N31IV2RP2CX31872682442RP31KT312T2PR1L31K2310I31M4310K2CU2XQ27931652PZ2YI2YK2CU1U31JA2YO31MH31JD27522X26931M826831LD2Q52PM2C431JI2FB31K22VR2YO22U31MO31MS2RP31KC2R3313Z27T31JI31JO26831KG2NF31J42RB2P029P24O2RV31JH2RV27T31NH31NC310B2RJ29P31A62SN31NQ31D3313R24Q2Q02ZI2Q531N131BG2OO31N1312A31NT2SC2YI2RP31NW31I12RP31FI31N231O531KS2RP29P24R31NX2RP26X31O031K3319Q31O32YU2IH314031OG26831OI31OA29P31FB2R331OQ31NR31OF313R2VU26E31NY25C31OM310I31P731JG31OR31O631OT2VU31OW26831F631OD31PC31P22RP31CL2YJ2RP25H31N131ML26831PQ31PS25K31OP2RP31P125C31O729P31CL31PG31F131PJ31PZ31Q12682WA31PO29P25P31PR31ON26831QD31PS25S31PX31OE31Q031OT2WA31PG31FN31Q631OS313R312E31P52RP25Z31P82YO31QX31PB31Q731OT312E31PG31FS2R32V829P31KE26Q31FB29P31H131NS2JU31NK26831NM2GQ29P31KT31NF31RI31RH31NB31RK31NO31RN31L831NP31RO31RF31RQ31O426831I42Q527431NL2RV2E831RQ2792Z22QQ31CW31RM313Q31L731NI26831RE31RV31PZ31SD29P31NW2GJ29P24Z31QY27931SP31PB31LG25C24D31OT2OX2PU313R31EF310531SJ2Z126831NW2QI29P310E27T31RZ31R2313R31OI31QV29P25931SQ27531TH31ST2PT31SW313R31SY31SK318S2P027T31T331S931OI31T726831T931QR31PD31P331OJ29P23R31TI26831U531TL2SC31TN2T631SZ2RP31E431T231D331S92VU31TX31TZ31TB31QS31PM31U326824131U631UR31U92QU31UB2QX31UD29P31DX31UG2Z031S931CL31UK312F31P031UN29P31QA31NY24B31U631VC31UU31SV31OT31ER31OT31ET31V12TQ31S92WA31V531TA31V731U12RP31QU31J726822O31QE310I31VX31PS31N031VF31UW2QO31UY31BE2RJ31TT31UH2YY312E31VP31JY310O31N1312X27926A31N1310I1P2R231362HI');
    local a = (bit or bit32);
    local d = a and a.bxor or function(a, c)
        local b, d, e = 1, 0, 10
        while a > 0 and c > 0 do
            local e, f = a % 2, c % 2
            if e ~= f then d = d + b end
            a, c, b = (a - e) / 2, (c - f) / 2, b * 2
        end
        if a < c then a = c end
        while a > 0 do
            local c = a % 2
            if c > 0 then d = d + b end
            a, b = (a - c) / 2, b * 2
        end
        return d
    end
    local function c(c, a, b)
        if b then
            local a = (c / 2 ^ (a - 1)) % 2 ^ ((b - 1) - (a - 1) + 1);
            return a - a % 1;
        else
            local a = 2 ^ (a - 1);
            return (c % (a + a) >= a) and 1 or 0;
        end
    end
    local a = 1;
    local function b()
        local f, c, e, b = h(i, a, a + 3);
        f = d(f, 224)
        c = d(c, 224)
        e = d(e, 224)
        b = d(b, 224)
        a = a + 4;
        return (b * 16777216) + (e * 65536) + (c * 256) + f;
    end
    local function j()
        local b = d(h(i, a, a), 224);
        a = a + 1;
        return b;
    end
    local function f()
        local b, c = h(i, a, a + 2);
        b = d(b, 224)
        c = d(c, 224)
        a = a + 2;
        return (c * 256) + b;
    end
    local function s()
        local a = b();
        local b = b();
        local e = 1;
        local d = (c(b, 1, 20) * (2 ^ 32)) + a;
        local a = c(b, 21, 31);
        local b = ((-1) ^ c(b, 32));
        if (a == 0) then
            if (d == 0) then
                return b * 0;
            else
                a = 1;
                e = 0;
            end
        elseif (a == 2047) then
            return (d == 0) and (b * (1 / 0)) or (b * (0 / 0));
        end
        return o(b, a - 1023) * (e + (d / (2 ^ 52)));
    end
    local m = b;
    local function r(b)
        local c;
        if (not b) then
            b = m();
            if (b == 0) then return ''; end
        end
        c = e(i, a, a + b - 1);
        a = a + b;
        local b = {}
        for a = 1, #c do b[a] = k(d(h(e(c, a, a)), 224)) end
        return l(b);
    end
    local a = b;
    local function o(...) return {...}, n('#', ...) end
    local function m()
        local i = {};
        local d = {};
        local a = {};
        local h = {
            [#{"1 + 1 = 111", "1 + 1 = 111"}] = d,
            [#{"1 + 1 = 111", {156, 49, 87, 66}, "1 + 1 = 111"}] = nil,
            [#{"1 + 1 = 111", "1 + 1 = 111", "1 + 1 = 111", "1 + 1 = 111"}] = a,
            [#{"1 + 1 = 111"}] = i
        };
        local a = b()
        local e = {}
        for c = 1, a do
            local b = j();
            local a;
            if (b == 2) then
                a = (j() ~= 0);
            elseif (b == 1) then
                a = s();
            elseif (b == 3) then
                a = r();
            end
            e[c] = a;
        end
        for a = 1, b() do d[a - 1] = m(); end
        for h = 1, b() do
            local a = j();
            if (c(a, 1, 1) == 0) then
                local d = c(a, 2, 3);
                local g = c(a, 4, 6);
                local a = {f(), f(), nil, nil};
                if (d == 0) then
                    a[3] = f();
                    a[4] = f();
                elseif (d == 1) then
                    a[3] = b();
                elseif (d == 2) then
                    a[3] = b() - (2 ^ 16)
                elseif (d == 3) then
                    a[3] = b() - (2 ^ 16)
                    a[4] = f();
                end
                if (c(g, 1, 1) == 1) then a[2] = e[a[2]] end
                if (c(g, 2, 2) == 1) then a[3] = e[a[3]] end
                if (c(g, 3, 3) == 1) then a[4] = e[a[4]] end
                i[h] = a;
            end
        end
        h[3] = j();
        return h;
    end
    local function k(a, l, e)
        a = (a == true and m()) or a;
        return (function(...)
            local d = a[1];
            local f = a[3];
            local m = a[2];
            local j = o
            local b = 1;
            local h = -1;
            local q = {};
            local o = {...};
            local i = n('#', ...) - 1;
            local n = {};
            local c = {};
            for a = 0, i do
                if (a >= f) then
                    q[a - f] = o[a + 1];
                else
                    c[a] = o[a + #{"1 + 1 = 111"}];
                end
            end
            local a = i - f + 1
            local a;
            local f;
            while true do
                a = d[b];
                f = a[1];
                if f <= 62 then
                    if f <= 30 then
                        if f <= 14 then
                            if f <= 6 then
                                if f <= 2 then
                                    if f <= 0 then
                                        local a = a[2]
                                        c[a] = c[a]()
                                    elseif f > 1 then
                                        c[a[2]] = c[a[3]][a[4]];
                                    else
                                        c[a[2]] = a[3];
                                    end
                                elseif f <= 4 then
                                    if f == 3 then
                                        local h;
                                        local g;
                                        local f;
                                        c[a[2]] = e[a[3]];
                                        b = b + 1;
                                        a = d[b];
                                        c[a[2]] = c[a[3]][a[4]];
                                        b = b + 1;
                                        a = d[b];
                                        c[a[2]] = {};
                                        b = b + 1;
                                        a = d[b];
                                        c[a[2]] = a[3];
                                        b = b + 1;
                                        a = d[b];
                                        c[a[2]] = a[3];
                                        b = b + 1;
                                        a = d[b];
                                        c[a[2]] = a[3];
                                        b = b + 1;
                                        a = d[b];
                                        f = a[2];
                                        g = c[f]
                                        h = c[f + 2];
                                        if (h > 0) then
                                            if (g > c[f + 1]) then
                                                b = a[3];
                                            else
                                                c[f + 3] = g;
                                            end
                                        elseif (g < c[f + 1]) then
                                            b = a[3];
                                        else
                                            c[f + 3] = g;
                                        end
                                    else
                                        if (c[a[2]] <= c[a[4]]) then
                                            b = a[3];
                                        else
                                            b = b + 1;
                                        end
                                    end
                                elseif f > 5 then
                                    e[a[3]] = c[a[2]];
                                    b = b + 1;
                                    a = d[b];
                                    c[a[2]] = a[3];
                                    b = b + 1;
                                    a = d[b];
                                    e[a[3]] = c[a[2]];
                                    b = b + 1;
                                    a = d[b];
                                    c[a[2]] = e[a[3]];
                                    b = b + 1;
                                    a = d[b];
                                    c[a[2]] = c[a[3]][a[4]];
                                    b = b + 1;
                                    a = d[b];
                                    c[a[2]] = c[a[3]][a[4]];
                                    b = b + 1;
                                    a = d[b];
                                    c[a[2]] = c[a[3]][a[4]];
                                    b = b + 1;
                                    a = d[b];
                                    e[a[3]] = c[a[2]];
                                    b = b + 1;
                                    a = d[b];
                                    c[a[2]] = e[a[3]];
                                    b = b + 1;
                                    a = d[b];
                                    c[a[2]] = c[a[3]][a[4]];
                                else
                                    local d = a[3];
                                    local b = c[d]
                                    for a = d + 1, a[4] do
                                        b = b .. c[a];
                                    end
                                    c[a[2]] = b;
                                end
                            elseif f <= 10 then
                                if f <= 8 then
                                    if f == 7 then
                                        if (c[a[2]] < a[4]) then
                                            b = b + 1;
                                        else
                                            b = a[3];
                                        end
                                    else
                                        if c[a[2]] then
                                            b = b + 1;
                                        else
                                            b = a[3];
                                        end
                                    end
                                elseif f > 9 then
                                    local a = a[2]
                                    local d, b = j(c[a](c[a + 1]))
                                    h = b + a - 1
                                    local b = 0;
                                    for a = a, h do
                                        b = b + 1;
                                        c[a] = d[b];
                                    end
                                else
                                    c[a[2]] = {};
                                end
                            elseif f <= 12 then
                                if f == 11 then
                                    c[a[2]] = c[a[3]] % a[4];
                                else
                                    c[a[2]] = l[a[3]];
                                end
                            elseif f == 13 then
                                local e;
                                c[a[2]] = c[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]];
                                b = b + 1;
                                a = d[b];
                                e = a[2]
                                c[e] = c[e](g(c, e + 1, a[3]))
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]][c[a[4]]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]];
                            else
                                local f;
                                local g;
                                e[a[3]] = c[a[2]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = a[3];
                                b = b + 1;
                                a = d[b];
                                e[a[3]] = c[a[2]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = a[3];
                                b = b + 1;
                                a = d[b];
                                e[a[3]] = c[a[2]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = e[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]][a[4]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]][a[4]];
                                b = b + 1;
                                a = d[b];
                                g = a[2];
                                f = c[a[3]];
                                c[g + 1] = f;
                                c[g] = f[a[4]];
                            end
                        elseif f <= 22 then
                            if f <= 18 then
                                if f <= 16 then
                                    if f > 15 then
                                        local b = a[2]
                                        local e = {c[b](c[b + 1])};
                                        local d = 0;
                                        for a = b, a[4] do
                                            d = d + 1;
                                            c[a] = e[d];
                                        end
                                    else
                                        local a = a[2]
                                        c[a] = c[a](g(c, a + 1, h))
                                    end
                                elseif f == 17 then
                                    local d = a[2];
                                    local f = c[d + 2];
                                    local e = c[d] + f;
                                    c[d] = e;
                                    if (f > 0) then
                                        if (e <= c[d + 1]) then
                                            b = a[3];
                                            c[d + 3] = e;
                                        end
                                    elseif (e >= c[d + 1]) then
                                        b = a[3];
                                        c[d + 3] = e;
                                    end
                                else
                                    c[a[2]] = c[a[3]];
                                end
                            elseif f <= 20 then
                                if f > 19 then
                                    c[a[2]][c[a[3]]] = c[a[4]];
                                else
                                    if (c[a[2]] < c[a[4]]) then
                                        b = b + 1;
                                    else
                                        b = a[3];
                                    end
                                end
                            elseif f > 21 then
                                if not c[a[2]] then
                                    b = b + 1;
                                else
                                    b = a[3];
                                end
                            else
                                local d = a[2];
                                local f = a[4];
                                local e = d + 2
                                local d = {c[d](c[d + 1], c[e])};
                                for a = 1, f do
                                    c[e + a] = d[a];
                                end
                                local d = d[1]
                                if d then
                                    c[e] = d
                                    b = a[3];
                                else
                                    b = b + 1;
                                end
                            end
                        elseif f <= 26 then
                            if f <= 24 then
                                if f == 23 then
                                    c[a[2]] = c[a[3]] * a[4];
                                else
                                    c[a[2]] = c[a[3]][a[4]];
                                    b = b + 1;
                                    a = d[b];
                                    c[a[2]] = c[a[3]][a[4]];
                                    b = b + 1;
                                    a = d[b];
                                    c[a[2]] = e[a[3]];
                                    b = b + 1;
                                    a = d[b];
                                    c[a[2]] = c[a[3]][a[4]];
                                    b = b + 1;
                                    a = d[b];
                                    c[a[2]][a[3]] = c[a[4]];
                                end
                            elseif f > 25 then
                                c[a[2]] = c[a[3]] + c[a[4]];
                            else
                                local e;
                                c[a[2]] = c[a[3]] % a[4];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]] + a[4];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]];
                                b = b + 1;
                                a = d[b];
                                e = a[2]
                                c[e] = c[e](g(c, e + 1, a[3]))
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]][c[a[4]]];
                            end
                        elseif f <= 28 then
                            if f == 27 then
                                c[a[2]]();
                            else
                                local a = a[2]
                                c[a] = c[a](c[a + 1])
                            end
                        elseif f == 29 then
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]][a[3]] = c[a[4]];
                        else
                            local h = m[a[3]];
                            local g;
                            local f = {};
                            g = p({}, {
                                __index = function(b, a)
                                    local a = f[a];
                                    return a[1][a[2]];
                                end,
                                __newindex = function(c, a, b)
                                    local a = f[a]
                                    a[1][a[2]] = b;
                                end
                            });
                            for e = 1, a[4] do
                                b = b + 1;
                                local a = d[b];
                                if a[1] == 18 then
                                    f[e - 1] = {c, a[3]};
                                else
                                    f[e - 1] = {l, a[3]};
                                end
                                n[#n + 1] = f;
                            end
                            c[a[2]] = k(h, g, e);
                        end
                    elseif f <= 46 then
                        if f <= 38 then
                            if f <= 34 then
                                if f <= 32 then
                                    if f > 31 then
                                        c[a[2]] = c[a[3]][a[4]];
                                        b = b + 1;
                                        a = d[b];
                                        c[a[2]] = c[a[3]][a[4]];
                                        b = b + 1;
                                        a = d[b];
                                        c[a[2]] = e[a[3]];
                                        b = b + 1;
                                        a = d[b];
                                        c[a[2]] = c[a[3]][a[4]];
                                        b = b + 1;
                                        a = d[b];
                                        c[a[2]][a[3]] = c[a[4]];
                                    else
                                        c[a[2]] = c[a[3]] - c[a[4]];
                                    end
                                elseif f > 33 then
                                    local f;
                                    e[a[3]] = c[a[2]];
                                    b = b + 1;
                                    a = d[b];
                                    c[a[2]] = e[a[3]];
                                    b = b + 1;
                                    a = d[b];
                                    c[a[2]] = e[a[3]];
                                    b = b + 1;
                                    a = d[b];
                                    f = a[2]
                                    c[f](c[f + 1])
                                    b = b + 1;
                                    a = d[b];
                                    c[a[2]] = e[a[3]];
                                    b = b + 1;
                                    a = d[b];
                                    c[a[2]] = e[a[3]];
                                    b = b + 1;
                                    a = d[b];
                                    c[a[2]] = c[a[3]] - c[a[4]];
                                    b = b + 1;
                                    a = d[b];
                                    e[a[3]] = c[a[2]];
                                    b = b + 1;
                                    a = d[b];
                                    c[a[2]] = e[a[3]];
                                    b = b + 1;
                                    a = d[b];
                                    e[a[3]] = c[a[2]];
                                else
                                    c[a[2]]();
                                end
                            elseif f <= 36 then
                                if f > 35 then
                                    c[a[2]] = k(m[a[3]], nil, e);
                                else
                                    local b = a[2];
                                    local d = c[a[3]];
                                    c[b + 1] = d;
                                    c[b] = d[a[4]];
                                end
                            elseif f == 37 then
                                c[a[2]] = c[a[3]][a[4]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]][a[4]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = e[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]][a[4]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]][a[3]] = c[a[4]];
                            else
                                local b = a[2]
                                local d, a = j(c[b](g(c, b + 1, a[3])))
                                h = a + b - 1
                                local a = 0;
                                for b = b, h do
                                    a = a + 1;
                                    c[b] = d[a];
                                end
                            end
                        elseif f <= 42 then
                            if f <= 40 then
                                if f == 39 then
                                    c[a[2]] = a[3];
                                else
                                    c[a[2]] = c[a[3]][c[a[4]]];
                                end
                            elseif f == 41 then
                                local h;
                                local i;
                                local f;
                                c[a[2]] = e[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]][a[4]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]][a[4]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = a[3];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = a[3];
                                b = b + 1;
                                a = d[b];
                                f = a[2]
                                c[f] = c[f](g(c, f + 1, a[3]))
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = e[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]][a[4]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]][a[4]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]][a[4]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = #c[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]][a[4]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = #c[a[3]];
                                b = b + 1;
                                a = d[b];
                                f = a[2]
                                c[f] = c[f](g(c, f + 1, a[3]))
                                b = b + 1;
                                a = d[b];
                                i = a[3];
                                h = c[i]
                                for a = i + 1, a[4] do
                                    h = h .. c[a];
                                end
                                c[a[2]] = h;
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]][a[4]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]][c[a[3]]] = c[a[4]];
                            else
                                c[a[2]] = c[a[3]][a[4]];
                            end
                        elseif f <= 44 then
                            if f > 43 then
                                local h;
                                local f;
                                f = a[2]
                                c[f](g(c, f + 1, a[3]))
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = e[a[3]];
                                b = b + 1;
                                a = d[b];
                                f = a[2];
                                h = c[a[3]];
                                c[f + 1] = h;
                                c[f] = h[a[4]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = e[a[3]];
                                b = b + 1;
                                a = d[b];
                                f = a[2]
                                c[f] = c[f](g(c, f + 1, a[3]))
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]][a[4]];
                                b = b + 1;
                                a = d[b];
                                e[a[3]] = c[a[2]];
                            else
                                do return c[a[2]] end
                            end
                        elseif f > 45 then
                            if (a[2] < c[a[4]]) then
                                b = b + 1;
                            else
                                b = a[3];
                            end
                        else
                            if c[a[2]] then
                                b = b + 1;
                            else
                                b = a[3];
                            end
                        end
                    elseif f <= 54 then
                        if f <= 50 then
                            if f <= 48 then
                                if f > 47 then
                                    if (c[a[2]] <= c[a[4]]) then
                                        b = a[3];
                                    else
                                        b = b + 1;
                                    end
                                else
                                    b = a[3];
                                end
                            elseif f > 49 then
                                c[a[2]][a[3]] = a[4];
                            else
                                if (c[a[2]] < a[4]) then
                                    b = b + 1;
                                else
                                    b = a[3];
                                end
                            end
                        elseif f <= 52 then
                            if f > 51 then
                                local f;
                                local h;
                                local g;
                                c[a[2]] = a[3];
                                b = b + 1;
                                a = d[b];
                                e[a[3]] = c[a[2]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = a[3];
                                b = b + 1;
                                a = d[b];
                                e[a[3]] = c[a[2]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = e[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]];
                                b = b + 1;
                                a = d[b];
                                g = a[2]
                                h = {c[g](c[g + 1])};
                                f = 0;
                                for a = g, a[4] do
                                    f = f + 1;
                                    c[a] = h[f];
                                end
                                b = b + 1;
                                a = d[b];
                                b = a[3];
                            else
                                if (c[a[2]] ~= c[a[4]]) then
                                    b = b + 1;
                                else
                                    b = a[3];
                                end
                            end
                        elseif f == 53 then
                            local a = a[2]
                            local d, b = j(c[a](c[a + 1]))
                            h = b + a - 1
                            local b = 0;
                            for a = a, h do
                                b = b + 1;
                                c[a] = d[b];
                            end
                        else
                            c[a[2]][a[3]] = c[a[4]];
                        end
                    elseif f <= 58 then
                        if f <= 56 then
                            if f == 55 then
                                c[a[2]] = e[a[3]];
                            else
                                c[a[2]] = c[a[3]][c[a[4]]];
                            end
                        elseif f > 57 then
                            c[a[2]] = e[a[3]];
                        else
                            c[a[2]] = c[a[3]] / a[4];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]] - c[a[4]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]] / a[4];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]] * a[4];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]];
                            b = b + 1;
                            a = d[b];
                            b = a[3];
                        end
                    elseif f <= 60 then
                        if f == 59 then
                            e[a[3]] = c[a[2]];
                        else
                            b = a[3];
                        end
                    elseif f == 61 then
                        do return c[a[2]] end
                    else
                        c[a[2]] = c[a[3]] / a[4];
                    end
                elseif f <= 94 then
                    if f <= 78 then
                        if f <= 70 then
                            if f <= 66 then
                                if f <= 64 then
                                    if f > 63 then
                                        h = a[2];
                                    else
                                        c[a[2]] = c[a[3]] + a[4];
                                    end
                                elseif f == 65 then
                                    local d = a[3];
                                    local b = c[d]
                                    for a = d + 1, a[4] do
                                        b = b .. c[a];
                                    end
                                    c[a[2]] = b;
                                else
                                    local b = a[2]
                                    c[b] = c[b](g(c, b + 1, a[3]))
                                end
                            elseif f <= 68 then
                                if f > 67 then
                                    local d = a[2]
                                    local e = {c[d](g(c, d + 1, h))};
                                    local b = 0;
                                    for a = d, a[4] do
                                        b = b + 1;
                                        c[a] = e[b];
                                    end
                                else
                                    c[a[2]][c[a[3]]] = c[a[4]];
                                end
                            elseif f == 69 then
                                local d = a[2];
                                local e = c[d]
                                local f = c[d + 2];
                                if (f > 0) then
                                    if (e > c[d + 1]) then
                                        b = a[3];
                                    else
                                        c[d + 3] = e;
                                    end
                                elseif (e < c[d + 1]) then
                                    b = a[3];
                                else
                                    c[d + 3] = e;
                                end
                            else
                                c[a[2]] = l[a[3]];
                            end
                        elseif f <= 74 then
                            if f <= 72 then
                                if f == 71 then
                                    local f;
                                    local i;
                                    local k, m;
                                    local l;
                                    local f;
                                    c[a[2]] = {};
                                    b = b + 1;
                                    a = d[b];
                                    e[a[3]] = c[a[2]];
                                    b = b + 1;
                                    a = d[b];
                                    c[a[2]] = e[a[3]];
                                    b = b + 1;
                                    a = d[b];
                                    f = a[2];
                                    l = c[a[3]];
                                    c[f + 1] = l;
                                    c[f] = l[a[4]];
                                    b = b + 1;
                                    a = d[b];
                                    f = a[2]
                                    k, m = j(c[f](c[f + 1]))
                                    h = m + f - 1
                                    i = 0;
                                    for a = f, h do
                                        i = i + 1;
                                        c[a] = k[i];
                                    end
                                    b = b + 1;
                                    a = d[b];
                                    f = a[2]
                                    k = {c[f](g(c, f + 1, h))};
                                    i = 0;
                                    for a = f, a[4] do
                                        i = i + 1;
                                        c[a] = k[i];
                                    end
                                    b = b + 1;
                                    a = d[b];
                                    b = a[3];
                                else
                                    c[a[2]] = c[a[3]] - c[a[4]];
                                end
                            elseif f == 73 then
                                c[a[2]] = c[a[3]] - a[4];
                            else
                                if (c[a[2]] ~= c[a[4]]) then
                                    b = b + 1;
                                else
                                    b = a[3];
                                end
                            end
                        elseif f <= 76 then
                            if f == 75 then
                                c[a[2]][a[3]] = c[a[4]];
                            else
                                local d = a[2];
                                local e = c[d]
                                local f = c[d + 2];
                                if (f > 0) then
                                    if (e > c[d + 1]) then
                                        b = a[3];
                                    else
                                        c[d + 3] = e;
                                    end
                                elseif (e < c[d + 1]) then
                                    b = a[3];
                                else
                                    c[d + 3] = e;
                                end
                            end
                        elseif f > 77 then
                            local d = a[2];
                            local f = c[d + 2];
                            local e = c[d] + f;
                            c[d] = e;
                            if (f > 0) then
                                if (e <= c[d + 1]) then
                                    b = a[3];
                                    c[d + 3] = e;
                                end
                            elseif (e >= c[d + 1]) then
                                b = a[3];
                                c[d + 3] = e;
                            end
                        else
                            local i;
                            local l, k;
                            local f;
                            f = a[2]
                            l, k = j(c[f](g(c, f + 1, a[3])))
                            h = k + f - 1
                            i = 0;
                            for a = f, h do
                                i = i + 1;
                                c[a] = l[i];
                            end
                            b = b + 1;
                            a = d[b];
                            f = a[2]
                            c[f] = c[f](g(c, f + 1, h))
                            b = b + 1;
                            a = d[b];
                            c[a[2]]();
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = a[3];
                            b = b + 1;
                            a = d[b];
                            e[a[3]] = c[a[2]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            e[a[3]] = c[a[2]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            e[a[3]] = c[a[2]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            e[a[3]] = c[a[2]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            e[a[3]] = c[a[2]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            e[a[3]] = c[a[2]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            e[a[3]] = c[a[2]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            e[a[3]] = c[a[2]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            e[a[3]] = c[a[2]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            e[a[3]] = c[a[2]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            e[a[3]] = c[a[2]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            e[a[3]] = c[a[2]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            e[a[3]] = c[a[2]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            e[a[3]] = c[a[2]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            e[a[3]] = c[a[2]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            e[a[3]] = c[a[2]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            e[a[3]] = c[a[2]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            f = a[2]
                            c[f] = c[f]()
                            b = b + 1;
                            a = d[b];
                            e[a[3]] = c[a[2]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            e[a[3]] = c[a[2]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            e[a[3]] = c[a[2]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            e[a[3]] = c[a[2]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            e[a[3]] = c[a[2]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            e[a[3]] = c[a[2]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                        end
                    elseif f <= 86 then
                        if f <= 82 then
                            if f <= 80 then
                                if f > 79 then
                                    e[a[3]] = c[a[2]];
                                else
                                    if (c[a[2]] < c[a[4]]) then
                                        b = b + 1;
                                    else
                                        b = a[3];
                                    end
                                end
                            elseif f == 81 then
                                local d = a[2];
                                local f = a[4];
                                local e = d + 2
                                local d = {c[d](c[d + 1], c[e])};
                                for a = 1, f do
                                    c[e + a] = d[a];
                                end
                                local d = d[1]
                                if d then
                                    c[e] = d
                                    b = a[3];
                                else
                                    b = b + 1;
                                end
                            else
                                local b = a[2]
                                c[b](g(c, b + 1, a[3]))
                            end
                        elseif f <= 84 then
                            if f == 83 then
                                local f;
                                c[a[2]] = e[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = e[a[3]];
                                b = b + 1;
                                a = d[b];
                                f = a[2]
                                c[f] = c[f](g(c, f + 1, a[3]))
                                b = b + 1;
                                a = d[b];
                                e[a[3]] = c[a[2]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = e[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = e[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]][c[a[4]]];
                                b = b + 1;
                                a = d[b];
                                e[a[3]] = c[a[2]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = e[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]][a[4]];
                            else
                                local h = m[a[3]];
                                local g;
                                local f = {};
                                g = p({}, {
                                    __index = function(b, a)
                                        local a = f[a];
                                        return a[1][a[2]];
                                    end,
                                    __newindex = function(c, a, b)
                                        local a = f[a]
                                        a[1][a[2]] = b;
                                    end
                                });
                                for e = 1, a[4] do
                                    b = b + 1;
                                    local a = d[b];
                                    if a[1] == 18 then
                                        f[e - 1] = {c, a[3]};
                                    else
                                        f[e - 1] = {l, a[3]};
                                    end
                                    n[#n + 1] = f;
                                end
                                c[a[2]] = k(h, g, e);
                            end
                        elseif f > 85 then
                            c[a[2]] = c[a[3]] / c[a[4]];
                        else
                            local f;
                            local i;
                            local k, m;
                            local l;
                            local f;
                            e[a[3]] = c[a[2]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            f = a[2];
                            l = c[a[3]];
                            c[f + 1] = l;
                            c[f] = l[a[4]];
                            b = b + 1;
                            a = d[b];
                            f = a[2]
                            k, m = j(c[f](c[f + 1]))
                            h = m + f - 1
                            i = 0;
                            for a = f, h do
                                i = i + 1;
                                c[a] = k[i];
                            end
                            b = b + 1;
                            a = d[b];
                            f = a[2]
                            k = {c[f](g(c, f + 1, h))};
                            i = 0;
                            for a = f, a[4] do
                                i = i + 1;
                                c[a] = k[i];
                            end
                            b = b + 1;
                            a = d[b];
                            b = a[3];
                        end
                    elseif f <= 90 then
                        if f <= 88 then
                            if f > 87 then
                                local f;
                                c[a[2]] = e[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = e[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]] - c[a[4]];
                                b = b + 1;
                                a = d[b];
                                f = a[2]
                                c[f](c[f + 1])
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = e[a[3]];
                                b = b + 1;
                                a = d[b];
                                e[a[3]] = c[a[2]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = e[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]][a[4]];
                                b = b + 1;
                                a = d[b];
                                if c[a[2]] then
                                    b = b + 1;
                                else
                                    b = a[3];
                                end
                            else
                                local a = a[2]
                                c[a] = c[a]()
                            end
                        elseif f > 89 then
                            c[a[2]][a[3]] = a[4];
                        else
                            c[a[2]] = c[a[3]];
                        end
                    elseif f <= 92 then
                        if f == 91 then
                            local b = a[2]
                            c[b] = c[b](g(c, b + 1, a[3]))
                        else
                            c[a[2]] = (a[3] ~= 0);
                        end
                    elseif f > 93 then
                        do return end
                    else
                        local a = a[2]
                        c[a](c[a + 1])
                    end
                elseif f <= 110 then
                    if f <= 102 then
                        if f <= 98 then
                            if f <= 96 then
                                if f > 95 then
                                    c[a[2]] = #c[a[3]];
                                else
                                    c[a[2]] = c[a[3]] / c[a[4]];
                                end
                            elseif f > 97 then
                                c[a[2]] = e[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]] + a[4];
                                b = b + 1;
                                a = d[b];
                                e[a[3]] = c[a[2]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = e[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = e[a[3]];
                                b = b + 1;
                                a = d[b];
                                if (c[a[2]] <= c[a[4]]) then
                                    b = a[3];
                                else
                                    b = b + 1;
                                end
                            else
                                local d = a[2]
                                local e = {c[d](g(c, d + 1, h))};
                                local b = 0;
                                for a = d, a[4] do
                                    b = b + 1;
                                    c[a] = e[b];
                                end
                            end
                        elseif f <= 100 then
                            if f > 99 then
                                do return end
                            else
                                c[a[2]] = c[a[3]] * a[4];
                            end
                        elseif f == 101 then
                            c[a[2]] = c[a[3]] + c[a[4]];
                        else
                            c[a[2]] = {};
                        end
                    elseif f <= 106 then
                        if f <= 104 then
                            if f == 103 then
                                local f;
                                c[a[2]] = c[a[3]][a[4]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = e[a[3]];
                                b = b + 1;
                                a = d[b];
                                c[a[2]] = c[a[3]];
                                b = b + 1;
                                a = d[b];
                                f = a[2]
                                c[f] = c[f](c[f + 1])
                                b = b + 1;
                                a = d[b];
                                c[a[2]][c[a[3]]] = c[a[4]];
                            else
                                c[a[2]] = k(m[a[3]], nil, e);
                            end
                        elseif f > 105 then
                            local h;
                            local f;
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            f = a[2];
                            h = c[a[3]];
                            c[f + 1] = h;
                            c[f] = h[a[4]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]] / c[a[4]];
                            b = b + 1;
                            a = d[b];
                            f = a[2]
                            c[f] = c[f](g(c, f + 1, a[3]))
                            b = b + 1;
                            a = d[b];
                            c[a[2]][a[3]] = c[a[4]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            f = a[2];
                            h = c[a[3]];
                            c[f + 1] = h;
                            c[f] = h[a[4]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]] / c[a[4]];
                            b = b + 1;
                            a = d[b];
                            f = a[2]
                            c[f] = c[f](g(c, f + 1, a[3]))
                            b = b + 1;
                            a = d[b];
                            c[a[2]][a[3]] = c[a[4]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            f = a[2];
                            h = c[a[3]];
                            c[f + 1] = h;
                            c[f] = h[a[4]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]] / c[a[4]];
                            b = b + 1;
                            a = d[b];
                            f = a[2]
                            c[f] = c[f](g(c, f + 1, a[3]))
                            b = b + 1;
                            a = d[b];
                            c[a[2]][a[3]] = c[a[4]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            f = a[2];
                            h = c[a[3]];
                            c[f + 1] = h;
                            c[f] = h[a[4]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]] / c[a[4]];
                            b = b + 1;
                            a = d[b];
                            f = a[2]
                            c[f] = c[f](g(c, f + 1, a[3]))
                            b = b + 1;
                            a = d[b];
                            c[a[2]][a[3]] = c[a[4]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            f = a[2];
                            h = c[a[3]];
                            c[f + 1] = h;
                            c[f] = h[a[4]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]] / c[a[4]];
                            b = b + 1;
                            a = d[b];
                            f = a[2]
                            c[f] = c[f](g(c, f + 1, a[3]))
                            b = b + 1;
                            a = d[b];
                            c[a[2]][a[3]] = c[a[4]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            f = a[2];
                            h = c[a[3]];
                            c[f + 1] = h;
                            c[f] = h[a[4]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]] / c[a[4]];
                            b = b + 1;
                            a = d[b];
                            f = a[2]
                            c[f] = c[f](g(c, f + 1, a[3]))
                            b = b + 1;
                            a = d[b];
                            c[a[2]][a[3]] = c[a[4]];
                        else
                            local b = a[2]
                            local d, a = j(c[b](g(c, b + 1, a[3])))
                            h = a + b - 1
                            local a = 0;
                            for b = b, h do
                                a = a + 1;
                                c[b] = d[a];
                            end
                        end
                    elseif f <= 108 then
                        if f > 107 then
                            local b = a[2]
                            c[b](g(c, b + 1, a[3]))
                        else
                            c[a[2]] = c[a[3]] / a[4];
                        end
                    elseif f > 109 then
                        if (a[2] < c[a[4]]) then
                            b = b + 1;
                        else
                            b = a[3];
                        end
                    else
                        local a = a[2]
                        c[a] = c[a](g(c, a + 1, h))
                    end
                elseif f <= 118 then
                    if f <= 114 then
                        if f <= 112 then
                            if f == 111 then
                                h = a[2];
                            else
                                local d = a[2];
                                local b = c[a[3]];
                                c[d + 1] = b;
                                c[d] = b[a[4]];
                            end
                        elseif f == 113 then
                            local a = a[2]
                            c[a] = c[a](c[a + 1])
                        else
                            local d = a[2]
                            local e = {c[d](c[d + 1])};
                            local b = 0;
                            for a = d, a[4] do
                                b = b + 1;
                                c[a] = e[b];
                            end
                        end
                    elseif f <= 116 then
                        if f > 115 then
                            local a = a[2]
                            c[a](c[a + 1])
                        else
                            if (c[a[2]] < c[a[4]]) then
                                b = a[3];
                            else
                                b = b + 1;
                            end
                        end
                    elseif f > 117 then
                        c[a[2]] = #c[a[3]];
                    else
                        if (c[a[2]] < c[a[4]]) then
                            b = a[3];
                        else
                            b = b + 1;
                        end
                    end
                elseif f <= 122 then
                    if f <= 120 then
                        if f == 119 then
                            local g;
                            local f;
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            f = a[2];
                            g = c[a[3]];
                            c[f + 1] = g;
                            c[f] = g[a[4]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = a[3];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = a[3];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                        else
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = e[a[3]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]] = c[a[3]][a[4]];
                            b = b + 1;
                            a = d[b];
                            c[a[2]][a[3]] = c[a[4]];
                        end
                    elseif f == 121 then
                        c[a[2]] = c[a[3]] + a[4];
                    else
                        c[a[2]] = (a[3] ~= 0);
                    end
                elseif f <= 124 then
                    if f == 123 then
                        c[a[2]] = c[a[3]] % a[4];
                    else
                        c[a[2]] = c[a[3]] - a[4];
                    end
                elseif f > 125 then
                    local f;
                    local g;
                    c[a[2]] = c[a[3]][a[4]];
                    b = b + 1;
                    a = d[b];
                    c[a[2]] = c[a[3]][a[4]];
                    b = b + 1;
                    a = d[b];
                    c[a[2]] = c[a[3]][a[4]];
                    b = b + 1;
                    a = d[b];
                    e[a[3]] = c[a[2]];
                    b = b + 1;
                    a = d[b];
                    c[a[2]] = e[a[3]];
                    b = b + 1;
                    a = d[b];
                    c[a[2]][a[3]] = a[4];
                    b = b + 1;
                    a = d[b];
                    c[a[2]] = e[a[3]];
                    b = b + 1;
                    a = d[b];
                    c[a[2]] = e[a[3]];
                    b = b + 1;
                    a = d[b];
                    c[a[2]] = c[a[3]][a[4]];
                    b = b + 1;
                    a = d[b];
                    g = a[2];
                    f = c[a[3]];
                    c[g + 1] = f;
                    c[g] = f[a[4]];
                else
                    c[a[2]] = c[a[3]][a[4]];
                    b = b + 1;
                    a = d[b];
                    c[a[2]] = c[a[3]][a[4]];
                    b = b + 1;
                    a = d[b];
                    c[a[2]] = e[a[3]];
                    b = b + 1;
                    a = d[b];
                    c[a[2]] = c[a[3]][a[4]];
                    b = b + 1;
                    a = d[b];
                    c[a[2]][a[3]] = c[a[4]];
                end
                b = b + 1;
            end
        end);
    end
    return k(true, {}, q())();
end)(string.byte, table.insert, setmetatable);
