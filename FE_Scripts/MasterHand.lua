-- Go to line 23 and change it to your name. LOCAL SCRIPT!!!!!
wt = 0.05
s = script
it = Instance.new
v3 = Vector3.new
c3 = Color3.new
ud = UDim2.new
cf = CFrame.new
ca = CFrame.Angles
pi = math.pi
rd = math.rad
bc = BrickColor.new
ab = math.abs
de = math.deg
ts = tostring
tn = tonumber
ti = table.insert
tr = table.remove
cr = coroutine.resume
cc = coroutine.create
asset = "http://www.roblox.com/asset/?id="
sr = string.reverse
sl = string.lower
su = string.upper
Serv = {}
Serv.p = game:GetService(sr("sreyalP"))
Serv.l = game:GetService(sr("gnithgiL"))
Serv.is = game:GetService(sr("ecivreStresnI"))
if game:findFirstChild(sr("revreSkrowteN")) then
    Serv.ns = game:GetService(sr("revreSkrowteN"))
else
    NetworkServer = nil
end
Serv.sg = game:GetService(sr("iuGretratS"))
Serv.sp = game:GetService(sr("kcaPretratS"))
Serv.d = game:GetService(sr("sirbeD"))
Decs = {}
Decs.Crack = "49173398"
Decs.Cloud = "1095708"
Decs.Spike = "1033714"
Decs.Rock = "1290033"
Decs.Crown = "1323306"
function ft(tablez, item)
    if not tablez or not item then return nil end
    for i = 1, #tablez do if tablez == item then return i end end
    return nil
end
function re(par, obj)
    if type(par) ~= "userdata" or type(obj) ~= "string" then return nil end
    if par:findFirstChild(obj) then par[obj]:Remove() end
end
function pa(pa, sh, x, y, z, c, a, tr, re, bc2)
    local fp = nil
    if sh ~= "Wedge" and sh ~= "CornerWedge" then
        fp = it("Part", pa)
        fp.Shape = sh
        fp.formFactor = "Custom"
    elseif sh == "Wedge" then
        fp = it("WedgePart", pa)
        fp.formFactor = "Custom"
    elseif sh == "CornerWedge" then
        fp = it("CornerWedgePart", pa)
    end
    fp.Size = v3(x, y, z)
    fp.CanCollide = c
    fp.Anchored = false
    fp.BrickColor = bc(bc2)
    fp.Transparency = tr
    fp.Reflectance = re
    fp.BottomSurface = 0
    fp.TopSurface = 0
    fp.CFrame = t.CFrame + Vector3.new(0, 50, 0)
    fp.Velocity = Vector3.new(0, 10, 0)
    fp:BreakJoints()
    return fp
end
function clearit(tab) for xx = 1, #tab do tab[xx]:Remove() end end
function weld(pa, p0, p1, x, y, z, a, b, c)
    local fw = it("Weld", pa)
    fw.Part0 = p0
    fw.Part1 = p1
    fw.C0 = cf(x, y, z) * ca(a, b, c)
    return fw
end
function spm(ty, pa, ss)
    local sp = it("SpecialMesh", pa)
    sp.MeshType = ty
    sp.Scale = Vector3.new(ss, ss, ss)
end
function mbm(pa, sx, sy, sz)
    local bm = Instance.new("BlockMesh", pa)
    bm.Scale = Vector3.new(sx, sy, sz)
end
function ra(mn, mx, dc)
    local tms = 1
    if dc == nil then dc = 0 end
    if type(dc) == "number" and dc > 5 then dc = 5 end
    for zx = 1, dc do tms = tms * 10 end
    return math.random(mn * tms, mx * tms) / tms
end
p = Serv.p.Dark_Eccentric
bp = p.Backpack
pg = p.PlayerGui
c = p.Character
he = c.Head
t = c.Torso
hu = c.Humanoid
mou = nil
re(c, "Hand")
s = 2

-- tool var
Equip = false
HTrans = 0
HRef = 0
HCol = "a"
LaserCol = "Really black"
LaserCol2 = "Really  red"
LaserCol3 = "Really black"
Posing = "Follow"
Facing = "Owner"
Anim = {}
Anim.a = "None"
Anim.b = "None"
Anim.Welding = 0
local fingwide = 1.5 * s
local finghei = 2.8
local tiphei = 2.55
handoffset = v3(5, 18, -8) * s
bgx, bgy, bgz = -90, 0, 0
w = {}
Button = false
--
BlastMesh = it("FileMesh")
BlastMesh.MeshId = "http://www.roblox.com/asset/?id=20329976"
RingMesh = it("FileMesh")
RingMesh.MeshId = "http://www.roblox.com/asset/?id=3270017"
RockMesh = it("FileMesh")
DiamondMesh = it("FileMesh")
DiamondMesh.MeshId = "http://www.roblox.com/Asset/?id=9756362"

m = Instance.new("Model", c)
m.Name = "Hand"
Palm = pa(m, "Block", 6 * s, 7 * s, fingwide * 2, true, false, HTrans, HRef,
          HCol)
mbm(Palm, 1, 1, 0.6)
local x, y, z = Palm.Size.x, Palm.Size.y, Palm.Size.z
bPoint1 = pa(m, "Block", 0, 0, 0, false, false, HTrans, HRef, HCol)
Point1 =
    weld(bPoint1, Palm, bPoint1, -x / 2 + (fingwide / 2), y / 2, 0, 0, 0, 0)
pPoint1 = pa(m, "Block", fingwide, finghei * s, fingwide, true, false, HTrans,
             HRef, HCol)
mbm(pPoint1, 0.9, 1, 0.9)
wPoint1 = weld(pPoint1, bPoint1, pPoint1, 0, pPoint1.Size.y / 2, 0, 0, 0, 0)
bPoint2 = pa(m, "Block", 0, 0, 0, false, false, HTrans, HRef, HCol)
Point2 = weld(bPoint2, pPoint1, bPoint2, 0, pPoint1.Size.y / 2, 0, 0, 0, 0)
pPoint2 = pa(m, "Block", fingwide, finghei * s, fingwide, true, false, HTrans,
             HRef, HCol)
mbm(pPoint2, 0.9, 1, 0.9)
wPoint2 = weld(pPoint2, bPoint2, pPoint2, 0, pPoint1.Size.y / 2, 0, 0, 0, 0)
bPoint3 = pa(m, "Block", 0, 0, 0, false, false, HTrans, HRef, HCol)
Point3 = weld(bPoint3, pPoint2, bPoint3, 0, pPoint2.Size.y / 2, 0, 0, 0, 0)
pPoint3 = pa(m, "Block", fingwide, tiphei * s, fingwide, true, false, HTrans,
             HRef, HCol)
mbm(pPoint3, 0.9, 1, 0.9)
wPoint3 = weld(pPoint3, bPoint3, pPoint3, 0, pPoint3.Size.y / 2, 0, 0, 0, 0)
bMid1 = pa(m, "Block", 0, 0, 0, false, false, HTrans, HRef, HCol)
Mid1 = weld(bMid1, Palm, bMid1, -x / 2 + ((fingwide / 2) + ((fingwide) * 1)),
            y / 2, 0, 0, 0, 0)
pMid1 = pa(m, "Block", fingwide, (finghei * 1.1) * s, fingwide, true, false,
           HTrans, HRef, HCol)
mbm(pMid1, 0.9, 1, 0.9)
wMid1 = weld(pMid1, bMid1, pMid1, 0, pMid1.Size.y / 2, 0, 0, 0, 0)
bMid2 = pa(m, "Block", 0, 0, 0, false, false, HTrans, HRef, HCol)
Mid2 = weld(bMid2, pMid1, bMid2, 0, pMid1.Size.y / 2, 0, 0, 0, 0)
pMid2 = pa(m, "Block", fingwide, (finghei * 1.1) * s, fingwide, true, false,
           HTrans, HRef, HCol)
mbm(pMid2, 0.9, 1, 0.9)
wMid2 = weld(pMid2, bMid2, pMid2, 0, pMid1.Size.y / 2, 0, 0, 0, 0)
bMid3 = pa(m, "Block", 0, 0, 0, false, false, HTrans, HRef, HCol)
Mid3 = weld(bMid3, pMid2, bMid3, 0, pMid2.Size.y / 2, 0, 0, 0, 0)
pMid3 = pa(m, "Block", fingwide, (tiphei * 1.1) * s, fingwide, true, false,
           HTrans, HRef, HCol)
mbm(pMid3, 0.9, 1, 0.9)
wMid3 = weld(pMid3, bMid3, pMid3, 0, pMid3.Size.y / 2, 0, 0, 0, 0)
bRing1 = pa(m, "Block", 0, 0, 0, false, false, HTrans, HRef, HCol)
Ring1 = weld(bRing1, Palm, bRing1, -x / 2 + ((fingwide / 2) + ((fingwide) * 2)),
             y / 2, 0, 0, 0, 0)
pRing1 = pa(m, "Block", fingwide, (finghei * 0.98) * s, fingwide, true, false,
            HTrans, HRef, HCol)
mbm(pRing1, 0.9, 1, 0.9)
wRing1 = weld(pRing1, bRing1, pRing1, 0, pRing1.Size.y / 2, 0, 0, 0, 0)
bRing2 = pa(m, "Block", 0, 0, 0, false, false, HTrans, HRef, HCol)
Ring2 = weld(bRing2, pRing1, bRing2, 0, pRing1.Size.y / 2, 0, 0, 0, 0)
pRing2 = pa(m, "Block", fingwide, (finghei * 0.98) * s, fingwide, true, false,
            HTrans, HRef, HCol)
mbm(pRing2, 0.9, 1, 0.9)
wRing2 = weld(pRing2, bRing2, pRing2, 0, pRing1.Size.y / 2, 0, 0, 0, 0)
bRing3 = pa(m, "Block", 0, 0, 0, false, false, HTrans, HRef, HCol)
Ring3 = weld(bRing3, pRing2, bRing3, 0, pRing2.Size.y / 2, 0, 0, 0, 0)
pRing3 = pa(m, "Block", fingwide, (tiphei * 0.98) * s, fingwide, true, false,
            HTrans, HRef, HCol)
mbm(pRing3, 0.9, 1, 0.9)
wRing3 = weld(pRing3, bRing3, pRing3, 0, pRing3.Size.y / 2, 0, 0, 0, 0)
bPinkie1 = pa(m, "Block", 0, 0, 0, false, false, HTrans, HRef, HCol)
Pinkie1 = weld(bPinkie1, Palm, bPinkie1,
               -x / 2 + ((fingwide / 2) + ((fingwide) * 3)), y / 2, 0, 0, 0, 0)
pPinkie1 = pa(m, "Block", fingwide, (finghei * 0.8) * s, fingwide, true, false,
              HTrans, HRef, HCol)
mbm(pPinkie1, 0.9, 1, 0.9)
wPinkie1 =
    weld(pPinkie1, bPinkie1, pPinkie1, 0, pPinkie1.Size.y / 2, 0, 0, 0, 0)
bPinkie2 = pa(m, "Block", 0, 0, 0, false, false, HTrans, HRef, HCol)
Pinkie2 = weld(bPinkie2, pPinkie1, bPinkie2, 0, pPinkie1.Size.y / 2, 0, 0, 0, 0)
pPinkie2 = pa(m, "Block", fingwide, (finghei * 0.8) * s, fingwide, true, false,
              HTrans, HRef, HCol)
mbm(pPinkie2, 0.9, 1, 0.9)
wPinkie2 =
    weld(pPinkie2, bPinkie2, pPinkie2, 0, pPinkie1.Size.y / 2, 0, 0, 0, 0)
bPinkie3 = pa(m, "Block", 0, 0, 0, false, false, HTrans, HRef, HCol)
Pinkie3 = weld(bPinkie3, pPinkie2, bPinkie3, 0, pPinkie2.Size.y / 2, 0, 0, 0, 0)
pPinkie3 = pa(m, "Block", fingwide, (tiphei * 0.8) * s, fingwide, true, false,
              HTrans, HRef, HCol)
mbm(pPinkie3, 0.9, 1, 0.9)
wPinkie3 =
    weld(pPinkie3, bPinkie3, pPinkie3, 0, pPinkie3.Size.y / 2, 0, 0, 0, 0)
bThumb1 = pa(m, "Block", 0, 0, 0, false, false, HTrans, HRef, HCol)
Thumb1 = weld(bThumb1, Palm, bThumb1, -x / 2 + (fingwide / 7), -y * 0.1,
              -fingwide * 0.25, 0, 0, 0)
pThumb1 = pa(m, "Block", fingwide * 1.4, (finghei * 1) * s, fingwide * 1.4,
             true, false, HTrans, HRef, HCol)
mbm(pThumb1, 0.9, 1, 0.9)
wThumb1 = weld(pThumb1, bThumb1, pThumb1, 0, pThumb1.Size.y / 2, 0, 0, 0, 0)
bThumb2 = pa(m, "Block", 0, 0, 0, false, false, HTrans, HRef, HCol)
Thumb2 = weld(bThumb2, pThumb1, bThumb2, 0, pThumb1.Size.y / 2, 0, 0, 0, 0)
pThumb2 = pa(m, "Block", fingwide * 1.3, (finghei * 1) * s, fingwide * 1.3,
             true, false, HTrans, HRef, HCol)
mbm(pThumb2, 0.9, 1, 0.9)
wThumb2 = weld(pThumb2, bThumb2, pThumb2, 0, pThumb1.Size.y / 2, 0, 0, 0, 0)
bThumb3 = pa(m, "Block", 0, 0, 0, false, false, HTrans, HRef, HCol)
Thumb3 = weld(bThumb3, pThumb2, bThumb3, 0, pThumb2.Size.y / 2, 0, 0, 0, 0)
pThumb3 = pa(m, "Block", fingwide * 1.25, (tiphei * 1) * s, fingwide * 1.25,
             true, false, HTrans, HRef, HCol)
mbm(pThumb3, 0.9, 1, 0.9)
wThumb3 = weld(pThumb3, bThumb3, pThumb3, 0, pThumb3.Size.y / 2, 0, 0, 0, 0)

w["a1"] = Pinkie1
w["a2"] = Pinkie2
w["a3"] = Pinkie3
w["b1"] = Ring1
w["b2"] = Ring2
w["b3"] = Ring3
w["c1"] = Mid1
w["c2"] = Mid2
w["c3"] = Mid3
w["d1"] = Point1
w["d2"] = Point2
w["d3"] = Point3
w["e1"] = Thumb1
w["e2"] = Thumb2
w["e3"] = Thumb3
w.e1.C1 = ca(0, rd(35), rd(-20))
w.e2.C1 = ca(rd(20), 0, 0)
w.e3.C1 = ca(rd(20), 0, 0)
w.d1.C1 = ca(0, 0, rd(-3))
w.c1.C1 = ca(0, 0, rd(-1))
w.b1.C1 = ca(0, 0, rd(1))
w.a1.C1 = ca(0, 0, rd(3))
function c1(wexx, smmx, xx, yy, zz)
    coroutine.resume(coroutine.create(function()
        local xx2, yy2, zz2 = wexx.C1:toEulerAnglesXYZ()
        local aa, bb, cc = wexx.C0.x, wexx.C0.y, wexx.C0.z
        local twa = smmx / wt
        Anim.Welding = Anim.Welding + 1
        for i = 0, twa, 1 do
            wexx.C0 = cf(aa, bb, cc)
            wexx.C1 = ca(xx2 - (((xx2 - rd(xx)) / twa) * i),
                         yy2 - (((yy2 - rd(yy)) / twa) * i),
                         zz2 - (((zz2 - rd(zz)) / twa) * i))
            wait()
        end
        Anim.Welding = Anim.Welding - 1
    end))
end
function CloseFing(fingz, spee)
    if spee == nil then spee = 1 end
    c1(w[fingz .. "1"], spee, 80, 0, 0)
    c1(w[fingz .. "2"], spee, 110, 0, 0)
    c1(w[fingz .. "3"], spee, 30, 0, 0)
end
function OpenFing(fingz, spee)
    if spee == nil then spee = 1 end
    c1(w[fingz .. "1"], spee, 2, 0, 0)
    c1(w[fingz .. "2"], spee, 2, 0, 0)
    c1(w[fingz .. "3"], spee, 2, 0, 0)
end
function HandSign(form, spee)
    form = form:lower()
    if spee == nil then spee = 1 end
    if form == "f" then
        CloseFing("d", spee)
        CloseFing("a", spee)
        CloseFing("b", spee)
        c1(w["c1"], spee, 0, 0, 0)
        c1(w["c2"], spee, 0, 0, 0)
        c1(w["c3"], spee, 0, 0, 0)
        c1(w["e1"], spee, 70, 40, -90)
        c1(w["e2"], spee, 50, 0, 0)
        c1(w["e3"], spee, 50, 0, 0)
    elseif form == "fist" then
        CloseFing("d", spee)
        CloseFing("a", spee)
        CloseFing("b", spee)
        CloseFing("c", spee)
        c1(w["e1"], spee, 70, 40, -90)
        c1(w["e2"], spee, 50, 0, 0)
        c1(w["e3"], spee, 50, 0, 0)
    elseif form == "pointer" then
        CloseFing("a", spee)
        CloseFing("b", spee)
        CloseFing("c", spee)
        c1(w["d1"], spee, 5, 0, 0)
        c1(w["d2"], spee, 5, 0, 0)
        c1(w["d3"], spee, 5, 0, 0)
        c1(w["e1"], spee, 70, 40, -90)
        c1(w["e2"], spee, 50, 0, 0)
        c1(w["e3"], spee, 50, 0, 0)
    elseif form == "v" then
        CloseFing("a", spee)
        CloseFing("b", spee)
        c1(w["c1"], spee, 1, 0, 15)
        c1(w["c2"], spee, 1, 0, 0)
        c1(w["c3"], spee, 1, 0, 0)
        c1(w["d1"], spee, 1, 0, -15)
        c1(w["d2"], spee, 1, 0, 0)
        c1(w["d3"], spee, 1, 0, 0)
        c1(w["e1"], spee, 70, 40, -90)
        c1(w["e2"], spee, 50, 0, 0)
        c1(w["e3"], spee, 50, 0, 0)
    elseif form == "free" or form == "five" then
        OpenFing("a", spee)
        OpenFing("b", spee)
        OpenFing("c", spee)
        OpenFing("d", spee)
        c1(w["e1"], spee, 0, 35, -20)
        c1(w["e2"], spee, 20, 0, 0)
        c1(w["e3"], spee, 20, 0, 0)
    elseif form == "ride" then
        c1(w["a1"], spee, 60, 0, 0)
        c1(w["a2"], spee, -30, 0, 0)
        c1(w["a3"], spee, -30, 0, 0)
        c1(w["b1"], spee, 30, 0, 0)
        c1(w["b2"], spee, 65, 0, 0)
        c1(w["b3"], spee, 60, 0, 0)
        c1(w["c1"], spee, 30, 0, 0)
        c1(w["c2"], spee, 65, 0, 0)
        c1(w["c3"], spee, 60, 0, 0)
        c1(w["d1"], spee, 30, 0, 0)
        c1(w["d2"], spee, 65, 0, 0)
        c1(w["d3"], spee, 60, 0, 0)
        c1(w["e1"], spee, -70, 185, 0)
        c1(w["e2"], spee, 30, 0, 0)
        c1(w["e3"], spee, 30, 0, 0)
    elseif form == "gun" then
        CloseFing("a", spee)
        CloseFing("b", spee)
        c1(w["c1"], spee, 0, 0, 1)
        c1(w["c2"], spee, 0, 0, 0)
        c1(w["c3"], spee, 0, 0, 0)
        c1(w["d1"], spee, 0, 0, -1)
        c1(w["d2"], spee, 0, 0, 0)
        c1(w["d3"], spee, 0, 0, 0)
        c1(w["e1"], spee, -60, 90, 0)
        c1(w["e2"], spee, 20, 0, 0)
        c1(w["e3"], spee, -20, 0, 0)
    elseif form == "wide" then
        c1(w["a1"], spee, -3, 0, 45)
        c1(w["a2"], spee, -3, 0, 0)
        c1(w["a3"], spee, -3, 0, 0)
        c1(w["b1"], spee, -3, 0, 15)
        c1(w["b2"], spee, -3, 0, 0)
        c1(w["b3"], spee, -3, 0, 0)
        c1(w["c1"], spee, -3, 0, -15)
        c1(w["c2"], spee, -3, 0, 0)
        c1(w["c3"], spee, -3, 0, 0)
        c1(w["d1"], spee, -3, 0, -45)
        c1(w["d2"], spee, -3, 0, 0)
        c1(w["d3"], spee, -3, 0, 0)
        c1(w["e1"], spee, -70, 90, 0)
        c1(w["e2"], spee, 10, 0, 0)
        c1(w["e3"], spee, -10, 0, 0)
    elseif form == "wide2" then
        c1(w["a1"], spee, -18, 0, 45)
        c1(w["a2"], spee, 36, 0, 0)
        c1(w["a3"], spee, 30, 0, 0)
        c1(w["b1"], spee, -18, 0, 15)
        c1(w["b2"], spee, 36, 0, 0)
        c1(w["b3"], spee, 30, 0, 0)
        c1(w["c1"], spee, -18, 0, -15)
        c1(w["c2"], spee, 36, 0, 0)
        c1(w["c3"], spee, 30, 0, 0)
        c1(w["d1"], spee, -18, 0, -45)
        c1(w["d2"], spee, 36, 0, 0)
        c1(w["d3"], spee, 30, 0, 0)
        c1(w["e1"], spee, -50, 90, -10)
        c1(w["e2"], spee, 5, 0, -30)
        c1(w["e3"], spee, -10, 0, -40)
    elseif form == "grab2" then
        c1(w["a1"], spee, -70, -65, 0)
        c1(w["a2"], spee, 40, 0, 0)
        c1(w["a3"], spee, 20, 0, 0)
        c1(w["b1"], spee, -70, -20, 0)
        c1(w["b2"], spee, 40, 0, 0)
        c1(w["b3"], spee, 20, 0, 0)
        c1(w["c1"], spee, -70, 20, -0)
        c1(w["c2"], spee, 40, 0, 0)
        c1(w["c3"], spee, 20, 0, 0)
        c1(w["d1"], spee, -70, 65, -0)
        c1(w["d2"], spee, 40, 0, 0)
        c1(w["d3"], spee, 20, 0, 0)
        c1(w["e1"], spee, -70, 150, 0)
        c1(w["e2"], spee, 30, 0, 0)
        c1(w["e3"], spee, 30, 0, 0)
    elseif form == "grab3" then
        c1(w["a1"], spee, -30, -40, 30)
        c1(w["a2"], spee, 50, 0, 0)
        c1(w["a3"], spee, 35, 0, 0)
        c1(w["b1"], spee, -30, -15, 12)
        c1(w["b2"], spee, 50, 0, 0)
        c1(w["b3"], spee, 35, 0, 0)
        c1(w["c1"], spee, -30, 15, -12)
        c1(w["c2"], spee, 50, 0, 0)
        c1(w["c3"], spee, 35, 0, 0)
        c1(w["d1"], spee, -30, 40, -30)
        c1(w["d2"], spee, 50, 0, 0)
        c1(w["d3"], spee, 35, 0, 0)
        c1(w["e1"], spee, -55, 205, 0)
        c1(w["e2"], spee, 30, 0, 0)
        c1(w["e3"], spee, 30, 0, 0)
    end
end
function ColFings(iscol)
    pPinkie1.CanCollide = iscol
    pPinkie2.CanCollide = iscol
    pPinkie3.CanCollide = iscol
    pRing1.CanCollide = iscol
    pRing2.CanCollide = iscol
    pRing3.CanCollide = iscol
    pMid1.CanCollide = iscol
    pMid2.CanCollide = iscol
    pMid3.CanCollide = iscol
    pPoint1.CanCollide = iscol
    pPoint2.CanCollide = iscol
    pPoint3.CanCollide = iscol
    pThumb1.CanCollide = iscol
    pThumb2.CanCollide = iscol
    pThumb3.CanCollide = iscol
end
function ray(Pos, Dir)
    return Workspace:FindPartOnRay(Ray.new(Pos, Dir.unit * 999), c)
end
function Earthsplosion(pos, siz, dmg, rndmg, forc, eos)
    local colz22 = "Really red"
    if eos == nil or eos == "earth" then
        eos = "earth"
    else
        colz22 = "Really black"
        eos = "sand"
    end
    coroutine.resume(coroutine.create(function()
        if eos == "earth" then
            local cr = pa(m, "Block", ((14 * siz) / 10) * s, 0,
                          ((14 * siz) / 10) * s, false, false, 1, 0, "")
            cr.Anchored = true
            cr.CFrame = pos * ca(rd(0), rd(ra(-360, 360)), rd(0))
            cr.CFrame = cr.CFrame +
                            v3(ra(-siz * 10, siz * 10) / 22, 0,
                               ra(-siz * 10, siz * 10) / 22)
            local de = it("Decal", cr)
            de.Face = "Top"
            de.Texture = asset .. Decs.Crack
            Serv.d:AddItem(cr, 25)
        end
        for i = 1, 4 do
            coroutine.resume(coroutine.create(
                                 function()
                    local sw = pa(m, "Block", (siz / 3) * s, (siz * 1.3) * s,
                                  (siz / 3) * s, true, true, 0, 0, colz22)
                    sw.Anchored = true
                    sw.CFrame = pos *
                                    cf(ra(-3 * s, 3 * s), 0, ra(-3 * s, 3 * s)) *
                                    ca(rd(ra(-27, 27)), rd(ra(-360, 360)),
                                       rd(ra(-27, 27)))
                    local swm = it("SpecialMesh", sw)
                    if eos == "earth" then
                        swm.MeshType = "FileMesh"
                        swm.MeshId = asset .. Decs.Spike
                    else
                        swm.MeshType = "Sphere"
                    end
                    if eos == "earth" then
                        swm.Scale = v3(sw.Size.x / 1.3, sw.Size.y * 1.2,
                                       sw.Size.z / 1.3)
                    else
                        swm.Scale = v3(sw.Size.x / 10, sw.Size.y / 37,
                                       sw.Size.z / 10)
                    end
                    sw.CFrame = sw.CFrame +
                                    v3(ra(-0.3 * siz * s, 0.3 * siz * s, 7), 0,
                                       ra(-0.3 * siz * s, 0.3 * siz * s))
                    sw.CFrame = sw.CFrame * cf(0, -sw.Size.y / 1.4, 0)
                    Dustplosion(cf(pos.p + v3(0, 2 * s, 0)), 18 * s,
                                {"Really  red", "Really black", "Really red"}, 1)
                    if eos == "earth" then
                        for x = 1, 8 do
                            sw.CFrame = sw.CFrame * cf(0, sw.Size.y / 8, 0)
                            wait()
                        end
                        wait(ra(1, 5))
                        for x = 1, 20 do
                            sw.CFrame = sw.CFrame * cf(0, -sw.Size.y / 20, 0)
                            wait()
                        end
                        sw:Remove()
                    else
                        for x = 1, 25 do
                            sw.CFrame = sw.CFrame * cf(0, sw.Size.y / 25, 0)
                            sw.Transparency = x / 25 - 0.1
                            swm.Scale = swm.Scale + v3(0.025, 0.025, 0.025)
                            wait()
                        end
                    end
                    sw:Remove()
                end))
        end
        wait(0.3)
        DmgHumanoidsNear(pos.p, dmg, rndmg, 5.5 * s * (siz / 4), forc)
    end))
end

function Dustplosion(onb, scale, col, cls)
    coroutine.resume(coroutine.create(function()
        for x = 1, cls do
            coroutine.resume(coroutine.create(
                                 function()
                    local sw = pa(m, "Block", 1 * s, 0, 1 * s, false, false,
                                  0.2, 0, col[ra(1, #col)])
                    sw.Anchored = true
                    sw.CFrame = onb *
                                    ca(rd(ra(-35, 35)), rd(ra(-360, 360)),
                                       rd(ra(-35, 35)))
                    local swm = it("SpecialMesh", sw)
                    swm.MeshType = "FileMesh"
                    swm.MeshId = asset .. Decs.Cloud
                    sw.CFrame = sw.CFrame +
                                    v3(ra(-scale, scale) / 8,
                                       ra(-scale, scale) / 8,
                                       ra(-scale, scale) / 8)
                    for i = 1, scale, 0.25 do
                        swm.Scale = v3(i * 1.5, i * 1, i * 1.5)
                        sw.Transparency = ((i / scale) / 2) + 0.45
                        wait()
                    end
                    sw:Remove()
                end))
        end
    end))
end
function ShockWave(onb, scale, col)
    coroutine.resume(coroutine.create(function()
        local sw = pa(m, "Block", 1 * s, 0, 1 * s, false, false, 0.2, 0, col)
        sw.Anchored = true
        sw.CFrame = onb * ca(rd(90), 0, 0)
        local swm = it("SpecialMesh", sw)
        swm.MeshType = "FileMesh"
        swm.MeshId = RingMesh.MeshId
        for i = 1, scale, 0.75 do
            swm.Scale = v3(i * 1.5, i * 1.5, i * 1.5)
            sw.Transparency = (i / scale) + 0
            wait()
        end
        sw:Remove()
    end))
end
function BlastWave(onb, scale, ymes, col)
    coroutine.resume(coroutine.create(function()
        local sw = pa(m, "Block", 1 * s, 0, 1 * s, false, false, 0.2, 0, col)
        sw.Anchored = true
        sw.CFrame = onb * ca(rd(0), 0, 0)
        local swm = it("SpecialMesh", sw)
        swm.MeshType = "FileMesh"
        swm.MeshId = BlastMesh.MeshId
        for i = 1, scale, scale / 11 do
            swm.Scale = v3(i * 1.25, i * ymes, i * 1.25)
            sw.CFrame = sw.CFrame * ca(0, rd(720 * (i / scale)), 0)
            sw.Transparency = (i / scale) + 0
            wait()
        end
        sw:Remove()
    end))
end
function Explode(onb, scale, col)
    local Torm = m
    coroutine.resume(coroutine.create(function()
        local e1 = Instance.new("Part")
        e1.Anchored = true
        e1.formFactor = "Custom"
        e1.CanCollide = false
        e1.Size = Vector3.new(1, 1, 1)
        e1.BrickColor = BrickColor.new(col)
        e1.Transparency = 0.6
        e1.TopSurface = 0
        e1.BottomSurface = 0
        e1.Parent = Torm
        e1.CFrame = onb
        local e1m = Instance.new("SpecialMesh")
        e1m.MeshType = "Sphere"
        e1m.Parent = e1
        local r1 = Instance.new("Part")
        r1.Anchored = true
        r1.formFactor = "Custom"
        r1.CanCollide = false
        r1.Size = Vector3.new(1, 1, 1)
        r1.BrickColor = BrickColor.new(col)
        r1.Transparency = 0.6
        r1.TopSurface = 0
        r1.BottomSurface = 0
        r1.Parent = Torm
        r1.CFrame = e1.CFrame * CFrame.Angles(math.rad(180), 0, 0)
        local r1m = Instance.new("SpecialMesh")
        r1m.MeshType = "FileMesh"
        r1m.Scale = Vector3.new(3, 3, 3)
        r1m.Parent = r1
        r1m.MeshId = RingMesh.MeshId
        local r2 = Instance.new("Part")
        r2.Anchored = true
        r2.formFactor = "Custom"
        r2.CanCollide = false
        r2.Size = Vector3.new(1, 1, 1)
        r2.BrickColor = BrickColor.new(col)
        r2.Transparency = 0.6
        r2.TopSurface = 0
        r2.BottomSurface = 0
        r2.Parent = Torm
        r2.CFrame = e1.CFrame * CFrame.Angles(0, math.rad(180), 0)
        local r2m = Instance.new("SpecialMesh")
        r2m.MeshType = "FileMesh"
        r2m.Parent = r2
        r2m.Scale = Vector3.new(3, 3, 3)
        r2m.MeshId = RingMesh.MeshId
        local bla = Instance.new("Part")
        bla.Anchored = true
        bla.formFactor = "Custom"
        bla.CanCollide = false
        bla.Size = Vector3.new(1, 1, 1)
        bla.BrickColor = BrickColor.new(col)
        bla.Transparency = 0.6
        bla.TopSurface = 0
        bla.BottomSurface = 0
        bla.Parent = Torm
        bla.CFrame = onb
        local blam = Instance.new("SpecialMesh")
        blam.MeshType = "FileMesh"
        blam.Parent = bla
        blam.Scale = Vector3.new(5, 5, 5)
        blam.MeshId = BlastMesh.MeshId
        for i = 1, 30 do
            local pluscal = scale / 38
            e1m.Scale = e1m.Scale + Vector3.new(pluscal, pluscal, pluscal)
            r1m.Scale = r1m.Scale + Vector3.new(pluscal, pluscal, pluscal)
            r2m.Scale = r1m.Scale + Vector3.new(pluscal, pluscal, pluscal)
            blam.Scale = blam.Scale + Vector3.new(pluscal, pluscal / 2, pluscal)
            bla.CFrame = bla.CFrame * CFrame.Angles(0, math.rad(12), 0)
            r1.CFrame = r1.CFrame * CFrame.Angles(math.rad(6), 0, 0)
            r2.CFrame = r2.CFrame * CFrame.Angles(0, math.rad(6), 0)
            wait()
        end
        for i = 1, 30 do
            local pluscal = scale / 38
            e1m.Scale = e1m.Scale + Vector3.new(pluscal, pluscal, pluscal)
            r1m.Scale = r1m.Scale + Vector3.new(pluscal, pluscal, pluscal)
            r2m.Scale = r1m.Scale + Vector3.new(pluscal, pluscal, pluscal)
            blam.Scale = blam.Scale +
                             Vector3.new(pluscal / 3, pluscal / 3, pluscal / 3)
            bla.CFrame = bla.CFrame * CFrame.Angles(0, math.rad(12), 0)
            r1.CFrame = r1.CFrame * CFrame.Angles(math.rad(6), 0, 0)
            r2.CFrame = r2.CFrame * CFrame.Angles(0, math.rad(6), 0)
            bla.Transparency = bla.Transparency + 0.1
            e1.Transparency = e1.Transparency + 0.1
            r1.Transparency = r1.Transparency + 0.1
            r2.Transparency = r2.Transparency + 0.1
            wait()
        end
        e1:Remove()
        r1:Remove()
        r2:Remove()
    end))
end

function Hurtsplosion(pos, dmg, rndmg, siz, forc)
    coroutine.resume(coroutine.create(function()
        local boomcol = {"Really red", "Really black", "Really red"}
        for i = 1, 3 do
            coroutine.resume(coroutine.create(
                                 function()
                    local plos = pa(m, "Block", 1 * s * siz, 1.5 * s * siz,
                                    0.7 * s * siz, false, false, 0.3, 0, boomcol)
                    spm("Sphere", plos, 1)
                    plos.Anchored = true
                    plos.CFrame = cf(pos + v3(0, 0, 0)) *
                                      ca(rd(ra(-360, 360)), rd(ra(-360, 360)),
                                         rd(ra(-360, 360)))
                    plos.Mesh.Scale = v3(0.1, 0.1, 0.1)
                    for i = 0.3, 1, 0.03 do
                        local plc = plos.CFrame
                        plos.Mesh.Scale = v3(i * 6, i * 6, i * 6)
                        plos.Transparency = i
                        plos.CFrame = plc * ca(rd(3), rd(3), 0)
                        wait()
                    end
                    plos:Remove()
                end))
        end
    end))
    wait(0.1)
    DmgHumanoidsNear(pos, dmg, rndmg, 5.5 * s * siz, forc)
end

function DmgHumanoidsNear(pos, dmg, rndmg, mag, forc)
    local function kidive(ob)
        for i, v in pairs(ob:children()) do
            if v:IsA("BasePart") and v.Parent.Parent:findFirstChild("Humanoid") ==
                nil and v.Parent:findFirstChild("Humanoid") == nil and
                (v.Position - pos).magnitude < mag * 1.3 and v.Anchored == false and
                v:GetMass() < 150 then
                v:BreakJoints()
                v.Velocity = cf(pos, v.Position).lookVector * forc
            end
            if v:IsA("Humanoid") and v ~= hu and
                v.Parent:findFirstChild("Torso") then
                if (pos - v.Parent.Torso.Position).magnitude < mag then
                    local tdmg = dmg * ra(1, rndmg)
                    if v.Parent:findFirstChild("Hh") == nil then
                        local hh = Instance.new("NumberValue", v.Parent)
                        hh.Name = "Hh"
                        hh.Value = v.Health - tdmg
                    else
                        v.Parent.Hh.Value = v.Health - (tdmg * 3.5)
                    end
                    v.Health = v.Parent.Hh.Value
                    if v.Parent.Hh.Value < 1 then
                        v.Parent:BreakJoints()
                    end
                end
            end
            if v:IsA("Model") or v:IsA("Workspace") then kidive(v) end
        end
    end
    kidive(workspace)
end
function Fire(bullet, typez, siz, dmg, rndmg, forc)
    if typez == 1 then
        bullet.Anchored = true
        local bullethit = false
        local tyms = 0
        repeat
            tyms = tyms + 2
            local bhit, bpos = ray(bullet.Position, bullet.Position -
                                       (bullet.CFrame * cf(0, 0, -1)).p)
            if bpos ~= nil and (bpos - bullet.Position).magnitude < 7 then
                bullethit = true
            else
                bullet.CFrame = bullet.CFrame * cf(0, 0, -1 * s) *
                                    ca(rd(-0.0025), rd(0), 0)
            end
            if tyms % 32 == 0 then wait() end
        until bullethit or bullet.Position.y < -300 or tyms > 800
        bullet.CFrame = bullet.CFrame * cf(0, 0, 8)
        bullet:Remove()
        if bullet.Position.y < -300 then
        else
            Hurtsplosion(bullet.Position, dmg, rndmg, siz, forc)
        end
    elseif typez == 2 then
        bullet.Anchored = true
        local bullethit = false
        local tyms = 0
        local ming = 0.001
        repeat
            if tyms > 70 and (ming == 0.001 or ming == -2.5) then
                ming = -2.5
                local bpos = (bullet.CFrame * cf(0, 0, -300)).p
                if (bpos - v3(Palm.Position.x, bpos.y, Palm.Position.z)).magnitude <
                    25 * s then ming = 0 end
            end
            tyms = tyms + 2
            local bhit, bpos = ray(bullet.Position, bullet.Position -
                                       (bullet.CFrame * cf(0, 0, -1)).p)
            if bpos ~= nil and (bpos - bullet.Position).magnitude < 7 then
                bullethit = true
            else
                bullet.CFrame = bullet.CFrame * cf(0, 0, -0.5) *
                                    ca(rd(ming), rd(0), 0)
            end
            if tyms % 16 == 0 then wait() end
        until bullethit or bullet.Position.y < -300 or tyms > 500
        bullet.CFrame = bullet.CFrame * cf(0, 0, 8)
        bullet:Remove()
        if bullet.Position.y < -300 then
        else
            Hurtsplosion(bullet.Position, dmg, rndmg, siz, forc)
        end
    elseif typez == 3 then
    end
end
function ShortifiedAnim(theanim)
    if theanim == "Beam" then
        local crom = pa(m, "Block", 0, 0, 0, true, true, 0.5, 0, LaserCol3)
        local cromm = it("SpecialMesh", crom)
        cromm.MeshType = "FileMesh"
        cromm.MeshId = asset .. Decs.Crown
        cromm.Scale = v3(15 * s, 5 * s, 15 * s)
        crom.Anchored = true -- local cromw  = weld(crom,Palm,crom,0,Palm.Size.y/3.6,-Palm.Size.z*1.8,rd(-90),0,0)
        dias = {}
        loldiv = 360 / 8
        for x = 0, 360, loldiv do
            local dia = pa(m, "Block", 0, 0, 0, false, false, 0, 0, LaserCol2)
            dia.Anchored = true
            local diam = it("SpecialMesh", dia)
            diam.MeshType = "FileMesh"
            diam.MeshId = DiamondMesh.MeshId
            diam.Scale = v3(3 * s, 9 * s, 3 * s)
            table.insert(dias, dia)
        end
        Button = true
        coroutine.resume(coroutine.create(
                             function()
                local tardz = 0
                repeat
                    wait()
                    tardz = tardz + 15
                    crom.CFrame = Palm.CFrame * ca(rd(-90), 0, 0) *
                                      cf(0, 5.5 * s, 2 * s) *
                                      ca(0, rd(tardz), 0)
                    for rofl = 1, #dias do
                        dias[rofl].CFrame =
                            crom.CFrame * ca(0, rd(rofl * loldiv), 0) *
                                cf(0, -19 * s, 0) * ca(rd(25), 0, 0) *
                                cf(0, 32 * s, 0)
                    end
                until not Button
                for x2 = 0.5, 1, 0.05 do
                    wait()
                    crom.Transparency = x2
                end
            end))
        coroutine.resume(coroutine.create(
                             function()
                for xk = 1, 0.5, -0.02 do
                    wait()
                    for i = 1, #dias do
                        dias.Transparency = xk
                    end
                end
            end))
        wait(1)
        local beamoffset = v3(0, 0, 0)
        local b1 = pa(m, "Ball", 10 * s, 10 * s, 10 * s, false, false, 0.1, 0,
                      LaserCol)
        b1.Anchored = true
        local b2 = pa(m, "Block", 10 * s, 1, 10 * s, false, false, 0.1, 0,
                      LaserCol)
        b2.Anchored = true
        local b2m = it("CylinderMesh", b2)
        local b3 = pa(m, "Ball", 10 * s, 10 * s, 10 * s, false, false, 0.1, 0,
                      LaserCol)
        b3.Anchored = true
        local bpos = nil
        local bhit = nil
        local ts = 0
        repeat
            beamoffset = v3(ra(-2 * s, 2 * s), ra(-2 * s, 2 * s),
                            ra(-2 * s, 2 * s))
            ts = ts + 1
            bhit, bpos = ray(Palm.Position,
                             Palm.Position - (Palm.CFrame * cf(0, 0, 1)).p)
            if bhit == nil or (Palm.Position - bpos).magnitude > 1500 then
                break
            end
            b1.CFrame = Palm.CFrame * cf(0, 3 * s, -11 * s)
            b3.CFrame = cf(bpos)
            local lenz = (b1.Position - b3.Position).magnitude
            b2.CFrame = cf(b1.Position, b3.Position) * ca(rd(90), 0, 0) *
                            cf(0, -lenz / 2, 0)
            b2m.Scale = v3(1, lenz, 1)
            b1.CFrame = b1.CFrame + beamoffset
            b2.CFrame = b2.CFrame + beamoffset
            b3.CFrame = b3.CFrame + beamoffset
            if ts % 10 == 0 then
                DmgHumanoidsNear(b3.Position, 3, 10, (14 * s) + 2, 100)
                Explode(b3.CFrame * cf(0, b3.Size.y / 3, 0), 25 * s, LaserCol2)
            end
            wait()
        until not Button or ts > 600
        coroutine.resume(coroutine.create(
                             function()
                for xk = 0.1, 1.1, 0.08 do
                    wait()
                    b1.Transparency = xk
                    b2.Transparency = xk
                    b3.Transparency = xk
                end
                b1:Remove()
                b2:Remove()
                b3:Remove()
            end))
        coroutine.resume(coroutine.create(
                             function()
                for xk = 0.5, 1.1, 0.02 do
                    wait()
                    for i = 1, #dias do
                        dias.Transparency = xk
                    end
                end
            end))
        wait(1)
        clearit(dias)
        crom:Remove()
    end
end
PalmLev = it("BodyPosition", Palm)
PalmFace = it("BodyGyro", Palm)
PalmFace.maxTorque = v3(0, 0, 0)
coroutine.resume(coroutine.create(function()
    PalmLev.position = (t.CFrame * cf(handoffset)).p
    local yspi = 0
    while true do
        yspi = yspi + 8
        if Anim.a == "Gun" or Anim.a == "Ride" or Anim.a == "Pound" then
            Facing = "Mouse"
            bgx = -90
            bgy = 90
            bgz = 0
        elseif Anim.a == "Fu" or Anim.a == "Fist" or Anim.a == "GroundGrip" then
            Facing = "Mouse"
            bgx = -90
            bgy = 0
            bgz = 0
        elseif Anim.a == "Splat" or Anim.a == "Beam" then
            Facing = "Mouse"
            bgx = 0
            bgy = 0
            bgz = 0
        elseif Anim.a == "None" then
            Facing = "Owner"
            bgx = -90
            bgy = 0
            bgz = 0
            Posing = "Follow"
        elseif Anim.a == "Shower" then
            Facing = "None"
            bgx = 0
            bgy = 0
            bgz = 0
            Posing = "TopOwner"
        end
        if Posing == "Follow" then
            PalmLev.maxForce = v3(1 / 0, 1 / 0, 1 / 0)
            PalmLev.position = (t.CFrame * cf(handoffset) * cf(0, 0, 0)).p
        elseif Posing == "TopOwner" then
            PalmLev.maxForce = v3(1 / 0, 1 / 0, 1 / 0)
            PalmLev.position = (t.CFrame * cf(0, 12 * s, 0)).p
        end
        if Facing == "Owner" then
            PalmFace.maxTorque = v3(1 / 0, 1 / 0, 1 / 0)
            PalmFace.cframe = cf(Palm.Position, he.Position) *
                                  ca(rd(bgx), rd(bgy), rd(bgz))
        elseif Facing == "Mouse" and mou ~= nil and Equip then
            if Anim.a == "Gun" or Anim.a == "Beam" or Anim.a == "Ride" or Anim.a ==
                "GroundGrip" or Anim.a == "Fu" or Anim.a == "Pound" or Anim.a ==
                "Splat" or Anim.a == "Fist" then
                if Anim.b == "None" or Anim.a == "Beam" or Anim.a == "Ride" then
                    PalmFace.cframe = cf(Palm.Position, mou.Hit.p) *
                                          ca(rd(bgx), rd(bgy), rd(bgz))
                    wait(0.05)
                end
            end
        end
        wait(0.05)
    end
end))
function FireFinger(lasercol, ffingz, targ, typez, siz, dmg, rndmg, forc)
    coroutine.resume(coroutine.create(function()
        local laser = pa(m, "Block", fingwide * 1.3, fingwide * 1.3,
                         fingwide * 2.5, true, false, 0, 0, lasercol)
        spm("Sphere", laser, 1 + (siz / 5.5))
        laser.Name = "Projectile"
        local lw = weld(laser, ffingz, laser, 0,
                        ffingz.Size.y / 0.8 + (siz / 2.5), 0, rd(90), 0, 0)
        for i = 1, 0.4, -0.05 do
            laser.Transparency = i
            wait()
        end
        BlastWave(ffingz.CFrame * cf(0, ffingz.Size.y * 1.3, 0) * ca(0, 0, 0),
                  ffingz.Size.x * 1.6, 1.8, LaserCol2)
        lw:Remove()
        laser.CFrame = cf(laser.Position, targ)
        Fire(laser, typez, siz, dmg, rndmg, forc)
    end))
end
GrabWeld = it("Weld", m)
Palm.Touched:connect(function(touch)
    if Anim.a == "Ride" and GrabWeld.Part1 == nil and
        touch.Parent:findFirstChild("Torso") and
        touch.Parent:findFirstChild("Humanoid") then
        local tor = touch.Parent.Torso
        touch.Parent.Humanoid.PlatformStand = true
        GrabWeld.Part0 = Palm
        GrabWeld.Part1 = tor
        GrabWeld.C0 = cf(-3 * s, 4.5 * s, -Palm.Size.x / 2)
        GrabWeld.C1 = ca(0, rd(90), rd(-90)) * ca(0, rd(0), 0)
    end
end)
re(bp, "Hand")
hb = it("HopperBin", bp)
hb.Name = "Hand"
hb.Selected:connect(function(mouse)
    mou = mouse
    Equip = true
    mouse.KeyDown:connect(function(k)
        k = k:lower()
        if Anim.a == "Ride" and k == "f" then
            FireFinger(LaserCol, pPinkie3, mouse.Hit.p, 1, 2.25, 1, 18, 30)
        end
        if Anim.b ~= "None" or Anim.Welding ~= 0 then return end
        if Anim.a == "None" then
            if k == "f" then -- on anim on
                Anim.a = "Gun"
                HandSign("Gun", 0.7)
            elseif k == "p" then
                Anim.a = "Fu"
                HandSign("f", 1)
            elseif k == "g" then
                Anim.a = "Fist"
                HandSign("fist", 1)
            elseif k == "c" then
                Anim.a = "Splat"
                HandSign("wide", 1)
            elseif k == "r" then
                Anim.a = "Ride"
                HandSign("ride", 1)
                Posing = "None"
            elseif k == "v" then
                Anim.a = "Shower"
                HandSign("grab2", 1)
                PalmFace.cframe = cf(0, 0, 0) * ca(0, 0, 0)
            elseif k == "b" then
                Anim.a = "Pound"
                HandSign("fist", 1)
            elseif k == "x" then
                Anim.a = "GroundGrip"
                HandSign("grab2", 1)
            elseif k == "z" then
                Anim.a = "Beam"
                HandSign("wide2", 1)
            end
        else
            if k == "f" and Anim.a == "Gun" then --  on anim off
                Anim.a = "None"
                HandSign("five", 0.8)
            elseif k == "p" and Anim.a == "Fu" then
                Anim.a = "None"
                HandSign("five", 0.8)
            elseif k == "g" and Anim.a == "Fist" then
                Anim.a = "None"
                HandSign("five", 0.8)
            elseif k == "c" and Anim.a == "Splat" then
                Anim.a = "None"
                HandSign("five", 0.8)
            elseif k == "r" and Anim.a == "Ride" then
                Anim.a = "None"
                HandSign("five", 0.8)
                GrabWeld.Part0 = nil
                Anim.b = "None"
                Posing = "Follow"
                Facing = "Owner"
                if GrabWeld.Part1 ~= nil and
                    GrabWeld.Part1.Parent:findFirstChild("Humanoid") ~= nil then
                    GrabWeld.Part1.Parent.Humanoid.PlatformStand = false
                end
                GrabWeld.Part1 = nil
            elseif k == "v" and Anim.a == "Shower" then
                Anim.a = "None"
                HandSign("five", 0.8)
                Posing = "Follow"
                Facing = "Owner"
            elseif k == "b" and Anim.a == "Pound" then
                Anim.a = "None"
                HandSign("five", 0.8)
            elseif k == "x" and Anim.a == "GroundGrip" then
                Anim.a = "None"
                HandSign("five", 0.8)
            elseif k == "z" and Anim.a == "Beam" then
                Anim.a = "None"
                HandSign("five", 0.8)
            end
        end
    end)
    mouse.Button1Down:connect(function()
        if Anim.a == "None" or Anim.b ~= "None" then return end
        if Anim.a == "Gun" then
            Anim.b = "Gun"
            FireFinger(LaserCol, pPoint3, mouse.Hit.p, 1, 2.25, 1, 10, 60)
            FireFinger(LaserCol, pMid3, mouse.Hit.p, 1, 2.25)
            wait(1)
            Anim.b = "None"
        elseif Anim.a == "Fu" then
            Anim.b = "Fu"
            FireFinger(LaserCol, pMid3, mouse.Hit.p, 1, 3.65, 2, 14, 95)
            wait(0.25)
            Anim.b = "None"
        elseif Anim.a == "Fist" then
            local bhit, bpos = ray(Palm.Position, Palm.Position -
                                       (Palm.CFrame * cf(0, -1, 0)).p)
            if bhit == nil or (Palm.Position - bpos).magnitude > 500 then
                return
            end
            Anim.b = "Fist"
            Posing = "None"
            PalmFace.cframe = cf(Palm.Position, bpos) * ca(rd(-90), 0, 0)
            PalmLev.position = (Palm.CFrame * cf(0, -15 * s, 0)).p
            wait(0.45)
            PalmLev.position = bpos +
                                   ((Palm.CFrame * cf(0, 1 * s, 0)).p -
                                       Palm.Position)
            local tz = 0
            repeat
                wait()
                BlastWave(Palm.CFrame * ca(rd(180), 0, 0), 8 * s, 3.5, HCol)
                tz = tz + wait()
            until (PalmLev.position - Palm.Position).magnitude < 8 * s or tz > 1
            Explode(Palm.CFrame * cf(0, 6 * s, 0) * ca(rd(180), 0, 0), 15 * s,
                    ts(bhit.BrickColor))
            DmgHumanoidsNear((Palm.CFrame * cf(0, 8, 0)).p, 3, 10, (12 * s) + 2,
                             105)
            if not bhit.Anchored then
                PalmLev.position = (Palm.CFrame * cf(0, 12 * s, 0)).p
                wait(0.5)
            end
            wait(1)
            Posing = "Follow"
            Anim.b = "None"
        elseif Anim.a == "Splat" then
            if mouse.Target == nil and (Palm.Position - mouse.Hit.p).magnitude >
                500 then return end
            local bpos = mouse.Hit.p
            Anim.b = "Splat"
            Posing = "None"
            local ya, yb, yc = PalmFace.cframe:toEulerAnglesXYZ()
            PalmFace.cframe = cf(0, 0, 0) * ca(0, yb, 0) * ca(rd(-90), 0, 0)
            PalmLev.position = bpos + v3(0, 10 * s, 0)
            local tz = 0
            repeat
                wait()
                tz = tz + wait()
            until (PalmLev.position - Palm.Position).magnitude < 5 * s or tz >
                1.3
            for i = -90, 0, 5 do
                PalmLev.position = PalmLev.position + v3(0, 2 * s, 0)
                PalmFace.cframe = cf(0, 0, 0) * ca(0, yb, 0) * ca(rd(i), 0, 0)
                wait()
            end
            wait(0.2)
            for i = 0, -100, -10 do
                local lewd = i
                if lewd < -50 then lewd = -95 end
                PalmLev.position = PalmLev.position - v3(0, 4.7 * s, 0)
                PalmFace.cframe = cf(0, 0, 0) * ca(0, yb, 0) *
                                      ca(rd(lewd), 0, 0)
                wait()
            end
            wait(0.2)
            local cr = pa(m, "Block", 16 * s, 0, 16 * s, false, false, 1, 0, "")
            cr.Anchored = true
            cr.CFrame = cf(bpos) * ca(0, rd(ra(-360, 360)), 0)
            local de = it("Decal", cr)
            de.Face = "Top"
            de.Texture = asset .. Decs.Crack
            Serv.d:AddItem(cr, 16)
            DmgHumanoidsNear((Palm.CFrame * cf(0, 0, -1)).p, 3, 20,
                             (15 * s) + 2, 110)
            ShockWave(Palm.CFrame * ca(rd(90), 0, 0), 25 * s, LaserCol)
            wait(1)
            Posing = "Follow"
            Anim.b = "None"
        elseif Anim.a == "Ride" and Button == false then
            Posing = "None"
            Anim.b = "Ride"
            Button = true
            repeat
                PalmLev.position = (Palm.CFrame * cf(0, 10, 0)).p
                wait()
            until Button == false
            Anim.b = "None"
        elseif Anim.a == "Shower" and Button == false then
            Anim.b = "Shower"
            Button = true
            repeat
                local targz = Palm.Position + v3(0, 20 * s, 0)
                if ra(1, 12) == 1 then
                    FireFinger(LaserCol, pPinkie3, targz, 2, 4, 1, 18, 55)
                end
                if ra(1, 13) == 1 then
                    FireFinger(LaserCol, pRing3, targz, 2, 4, 1, 18, 60)
                end
                if ra(1, 12) == 1 then
                    FireFinger(LaserCol, pMid3, targz, 2, 4, 1, 18, 65)
                end
                if ra(1, 13) == 1 then
                    FireFinger(LaserCol, pPoint3, targz, 2, 4, 1, 18, 70)
                end
                if ra(1, 12) == 1 then
                    FireFinger(LaserCol, pThumb3, targz, 2, 4, 1, 18, 80)
                end
                PalmFace.cframe = PalmFace.cframe * ca(0, rd(10), 0)
                wait()
            until Button == false
            Anim.b = "None"
        elseif Anim.a == "Pound" and Anim.b == "None" then
            Posing = "None"
            Anim.b = "Pound"
            local bhit, bpos = ray(Palm.Position, Palm.Position -
                                       (Palm.CFrame * cf(0, -1, 0)).p)
            if bhit == nil or (Palm.Position - bpos).magnitude > 500 then
                return
            end
            PalmLev.position = bpos + v3(0, 15 * s, 0)
            local ya, yb, yc = PalmFace.cframe:toEulerAnglesXYZ()
            PalmFace.cframe = ca(ya, yb, yc)
            local tz = 0
            repeat
                wait()
                tz = tz + wait()
            until (PalmLev.position - Palm.Position).magnitude < 5 * s or tz >
                1.3
            wait(0.1)
            for i = -90, -10, 10 do
                PalmFace.cframe = ca(ya, yb, yc) * ca(0, 0, rd(i + 90))
                PalmLev.position = PalmLev.position + v3(0, 2.5 * s, 0)
                wait()
            end
            wait(0.25)
            local realcf = cf(v3(he.Position.x, 0, he.Position.z),
                              v3(Palm.Position.x, 0, Palm.Position.z))
            for i = -10, -90, -10 do
                PalmFace.cframe = ca(ya, yb, yc) * ca(0, 0, rd(i + 90))
                PalmLev.position = PalmLev.position - v3(0, 4 * s, 0)
                wait()
            end
            PalmFace.cframe = realcf * ca(rd(-90), rd(90), 0)
            wait(0.25)
            local cr = pa(m, "Block", 22 * s, 0, 22 * s, false, false, 1, 0, "")
            cr.Anchored = true
            cr.CFrame = cf(bpos) * ca(0, rd(ra(-360, 360)), 0)
            local de = it("Decal", cr)
            de.Face = "Top"
            de.Texture = asset .. Decs.Crack
            Serv.d:AddItem(cr, 16)
            Dustplosion(Palm.CFrame * cf(2 * s, 0, 0) * ca(rd(90), 0, rd(90)),
                        30 * s, {"Really red", "Really black", "Really  red"}, 3)
            ShockWave(Palm.CFrame * cf(2 * s, 0, 0) * ca(rd(90), 0, rd(90)),
                      20 * s, ts(bhit.BrickColor))
            DmgHumanoidsNear((Palm.CFrame * cf(0, 1, 0)).p, 1, 20, (15 * s) + 2,
                             90)
            wait(0.2)
            local palmcf = cf(bpos)
            local earthsplos = ra(5, 8)
            palmcf = Palm.CFrame * ca(0, rd(90), 0) * ca(rd(-90), 0, rd(0))
            for i = 1, earthsplos do
                Earthsplosion(palmcf * cf(0, -2 * s, ((i * 7) + 7) * s), 10, 1,
                              20, 75)
                wait(0.1)
            end
            Earthsplosion(palmcf *
                              cf(0, -2 * s, (((earthsplos + 1) * 7) + 7) * s),
                          16, 2, 25, 75)
            wait(1)
            Posing = "Follow"
            wait(0.25)
            Anim.b = "None"
        elseif Anim.a == "GroundGrip" then
            Posing = "None"
            Anim.b = "GroundGrip"
            local bhit, bpos = ray(Palm.Position, Palm.Position -
                                       (Palm.CFrame * cf(0, -1, 0)).p)
            if bhit == nil or (Palm.Position - bpos).magnitude > 500 then
                return
            end
            PalmLev.position = bpos + v3(0, 27 * s, 0)
            ColFings(false)
            local tz = 0
            repeat
                wait()
                tz = tz + wait()
            until (PalmLev.position - Palm.Position).magnitude < 8 * s or tz >
                1.3
            wait(0.1)
            local thepos = (Palm.CFrame * cf(0, -0.1 * s, 0)).p - Palm.Position
            PalmFace.cframe = cf(Palm.Position, bpos + thepos) *
                                  ca(rd(-90), 0, 0)
            for i = 27, 1, -3 do
                PalmLev.position = bpos + v3(0, i * s, 0)
                wait(0.07)
            end
            HandSign("grab3", 0.4)
            wait(0.55)
            local ro = pa(m, "Ball", 0, 0, 0, false, false, 0, 0, "Earth green")
            ro.Name = "Rock"
            local row = it("SpecialMesh", ro)
            row.MeshType = "FileMesh"
            row.MeshId = asset .. Decs.Rock
            local rowe = weld(ro, Palm, ro, 0, Palm.Size.y, -Palm.Size.z * 1.2,
                              0, 0, 0)
            row.Scale = v3(9 * s, 10 * s, 9 * s)
            coroutine.resume(coroutine.create(
                                 function()
                    for xz = 1, 70, 7 do
                        PalmLev.position = bpos + v3(0, xz * s, 0)
                        wait(0.06)
                    end
                end))
            wait(0.25)
            Dustplosion(cf(bpos), 30 * s,
                        {"Really red", "Really black", "Really red"}, 3)
            local lolra = ra(-360, 360)
            Earthsplosion(cf(bpos), 25, 1, 20, 125, "sand")
            for yyy = 0, 360, 60 do
                coroutine.resume(coroutine.create(
                                     function()
                        for zzz = 1, 4 do
                            Earthsplosion(
                                cf(bpos) * ca(0, rd(yyy + lolra), 0) *
                                    cf(0, 0, zzz * 15 * s), 10, 1, 20, 75)
                            wait(0.14)
                        end
                        wait(0.25)
                        Earthsplosion(cf(bpos) * ca(0, rd(yyy + lolra), 0) *
                                          cf(0, 0, 5 * 18 * s), 25, 1, 20, 120)
                    end))
            end
            wait(0.3)
            HandSign("grab2", 0.5)
            wait(0.75)
            Serv.d:AddItem(ro, 20)
            rowe:Remove()
            ro.CanCollide = true
            local rocf = ro.CFrame
            ro.Size = v3(14 * s, 14 * s, 14 * s)
            ro.CFrame = rocf
            wait(0.75)
            ColFings(true)
            Posing = "Follow"
            Anim.b = "None"
        elseif Anim.a == "Beam" and not Button and Anim.b == "None" then
            Anim.b = "Beam"
            ShortifiedAnim("Beam")
            wait(0.5)
            Anim.b = "None"
        end
    end)
    mouse.Button1Up:connect(function() Button = false end)
    mouse.Move:connect(function() end)

end)
hb.Deselected:connect(function(mouse) Equip = false end)
