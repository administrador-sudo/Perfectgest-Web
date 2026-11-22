((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,B,C={alA:function alA(d,e,f,g,h,i,j,k){var _=this
_.c=d
_.d=e
_.e=f
_.f=g
_.r=h
_.w=i
_.x=j
_.y=k
_.z=null
_.a=!1},alH:function alH(d,e,f,g,h,i,j){var _=this
_.c=d
_.d=e
_.e=f
_.f=g
_.r=h
_.w=i
_.x=j
_.y=null
_.a=!1},
b8W(d,e,f){var x,w,v,u,t,s,r
if(d==e)return d
if(d==null)return e.b1(f)
if(e==null)return d.b1(1-f)
x=A.b3B(d.a,d.nO(),e.a,e.nO(),f)
w=A.lY(d.d,e.d,f)
w.toString
v=A.a4(d.e,e.e,f)
v.toString
v=Math.max(0,v)
u=f<0.5
t=u?d.f:e.f
s=A.lY(d.r,e.r,f)
r=A.a4(d.w,e.w,f)
r.toString
r=Math.max(0,r)
u=u?d.c:e.c
return new C.jE(w,v,t,s,r,x.a,x.b,u)},
b9E(d,e,f){var x,w,v,u,t,s
if(d==e)return d
if(d==null)return e.b1(f)
if(e==null)return d.b1(1-f)
x=A.b3B(d.a,d.nO(),e.a,e.nO(),f)
w=A.lY(d.d,e.d,f)
w.toString
v=A.a4(d.e,e.e,f)
v.toString
v=Math.max(0,v)
u=A.a4(d.f,e.f,f)
u.toString
u=Math.max(0,u)
t=f<0.5
s=t?d.r:e.r
t=t?d.c:e.c
return new C.rb(w,v,u,s,x.a,x.b,t)},
jE:function jE(d,e,f,g,h,i,j,k){var _=this
_.d=d
_.e=e
_.f=f
_.r=g
_.w=h
_.a=i
_.b=j
_.c=k},
auV:function auV(d){this.a=d},
rb:function rb(d,e,f,g,h,i,j){var _=this
_.d=d
_.e=e
_.f=f
_.r=g
_.a=h
_.b=i
_.c=j},
aAF:function aAF(d){this.a=d},
HI:function HI(d,e,f,g,h,i,j){var _=this
_.cr=d
_.cZ=e
_.v=null
_.a5=f
_.av=g
_.A$=h
_.dy=i
_.b=_.fy=null
_.c=0
_.y=_.d=null
_.z=!0
_.Q=null
_.as=!1
_.at=null
_.ay=$
_.ch=j
_.CW=!1
_.cx=$
_.cy=!0
_.db=!1
_.dx=$},
UO:function UO(d,e,f,g){var _=this
_.e=d
_.f=e
_.c=f
_.a=g},
bm6(){return new C.uJ(null)},
uJ:function uJ(d){this.a=d},
asd:function asd(){},
ase:function ase(){},
bdu(d){var x=null,w=A.b([new A.bD(0,B.a4,B.h.af(0.5),B.k,6)],y.V)
return A.cX(x,A.cj(D.YX,B.h,x,d*0.72),B.t,x,x,new A.bd(x,x,x,x,w,D.asp,B.h7),x,d,x,x,x,x,d)},
Ye:function Ye(d){this.a=d},
Yd:function Yd(d,e){this.c=d
this.a=e},
a4H:function a4H(d){this.a=d},
a6e:function a6e(d){this.a=d},
a8c:function a8c(d){this.a=d},
a4I:function a4I(d){this.a=d},
a6f:function a6f(d){this.a=d},
abT:function abT(d){this.a=d}},D
J=c[1]
A=c[0]
B=c[2]
C=a.updateHolder(c[6],C)
D=c[15]
C.alA.prototype={
gSq(){var x,w,v,u,t,s,r,q,p,o,n=this,m=null,l=n.z
if(l==null){x=A.b3t(n.e)
w=new Float32Array(A.h7(n.f))
l=n.x
if(l!=null)v=l.j(0,n.c)&&n.y===0
else v=!0
u=n.c
t=n.d
s=n.r
r=n.w
q=u.a
u=u.b
if(v){$.a3()
l=new A.tw()
v=$.by.cg().Shader
u=A.aeW(q,u)
q=A.b0a(w)
s=A.afi(s)
r=r!=null?A.afh(r):m
l.a=A.fi(v,"MakeRadialGradient",[u,t,x,q,s,r==null?m:r,0])
$.afz().jI(n,l,l)
n.z=l}else{$.a3()
v=l.a
l=l.b
p=new A.tw()
o=$.by.cg().Shader
l=A.aeW(v,l)
u=A.aeW(q,u)
q=A.b0a(w)
s=A.afi(s)
v=r!=null?A.afh(r):m
if(v==null)v=m
p.a=A.fi(o,"MakeTwoPointConicalGradient",[l,n.y,u,t,x,q,s,v,0])
$.afz().jI(n,p,p)
n.z=p
l=p}}return l}}
C.alH.prototype={
gSq(){var x,w,v,u,t,s,r,q=this,p=q.y
if(p==null){x=A.b3t(q.d)
w=new Float32Array(A.h7(q.e))
$.a3()
p=q.c
v=q.x
u=new A.tw()
t=$.by.cg().Shader
s=A.b0a(w)
r=A.afi(q.f)
v=v!=null?A.afh(v):null
if(v==null)v=null
u.a=A.fi(t,"MakeSweepGradient",[p.a,p.b,x,s,r,v,0,q.r*180/3.141592653589793,q.w*180/3.141592653589793])
$.afz().jI(q,u,u)
q.y=u
p=u}return p}}
C.jE.prototype={
wf(d,e){var x,w,v=this,u=v.d.X(e).CR(d),t=d.geR(),s=v.a,r=v.nO()
v.Q9(d,e)
x=v.r
x=x==null?null:x.X(e).CR(d)
w=d.geR()
A.b3R(s,r)
return new C.alA(u,v.e*t,s,r,v.f,null,x,v.w*w)},
tc(d){return this.wf(d,null)},
b1(d){var x=this,w=x.a,v=A.a8(w).i("am<1,y>")
w=A.a2(new A.am(w,new C.auV(d),v),v.i("aE.E"))
return new C.jE(x.d,x.e,x.f,x.r,x.w,w,x.b,x.c)},
Iv(d){var x=this
return new C.jE(x.d,x.e,x.f,x.r,x.w,A.bL(x.a.length,d,!1,y.G),x.b,x.c)},
dT(d,e){if(y.q.b(d))return C.b8W(d,this,e)
return this.Mv(d,e)},
dU(d,e){if(y.q.b(d))return C.b8W(this,d,e)
return this.Mw(d,e)},
j(d,e){var x=this
if(e==null)return!1
if(x===e)return!0
if(J.a_(e)!==A.K(x))return!1
return e instanceof C.jE&&e.d.j(0,x.d)&&e.e===x.e&&e.f===x.f&&A.cZ(e.a,x.a)&&A.cZ(e.b,x.b)&&J.e(e.r,x.r)&&e.w===x.w},
gE(d){var x=this,w=A.bV(x.a),v=x.b
v=v==null?null:A.bV(v)
return A.U(x.d,x.e,x.f,x.c,w,v,x.r,x.w,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
k(d){var x=this,w=A.b(["center: "+x.d.k(0),"radius: "+A.hW(x.e),"colors: "+A.i(x.a)],y.s),v=x.b
if(v!=null)w.push("stops: "+A.i(v))
w.push("tileMode: "+x.f.k(0))
v=x.r
if(v!=null)w.push("focal: "+v.k(0))
w.push("focalRadius: "+A.hW(x.w))
return"RadialGradient("+B.c.bX(w,", ")+")"}}
C.rb.prototype={
wf(d,e){var x=this,w=x.d.X(e).CR(d),v=x.a,u=x.nO()
x.Q9(d,e)
A.b3R(v,u)
return new C.alH(w,v,u,x.r,x.e,x.f,null)},
b1(d){var x=this,w=x.a,v=A.a8(w).i("am<1,y>")
w=A.a2(new A.am(w,new C.aAF(d),v),v.i("aE.E"))
return new C.rb(x.d,x.e,x.f,x.r,w,x.b,x.c)},
Iv(d){var x=this
return new C.rb(x.d,x.e,x.f,x.r,A.bL(x.a.length,d,!1,y.G),x.b,x.c)},
dT(d,e){if(y.c.b(d))return C.b9E(d,this,e)
return this.Mv(d,e)},
dU(d,e){if(y.c.b(d))return C.b9E(this,d,e)
return this.Mw(d,e)},
j(d,e){var x=this
if(e==null)return!1
if(x===e)return!0
if(J.a_(e)!==A.K(x))return!1
return e instanceof C.rb&&e.d.j(0,x.d)&&e.e===x.e&&e.f===x.f&&e.r===x.r&&A.cZ(e.a,x.a)&&A.cZ(e.b,x.b)},
gE(d){var x=this,w=A.bV(x.a),v=x.b
v=v==null?null:A.bV(v)
return A.U(x.d,x.e,x.f,x.r,x.c,w,v,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
k(d){var x=this,w=A.b(["center: "+x.d.k(0),"startAngle: "+A.hW(x.e),"endAngle: "+A.hW(x.f),"colors: "+A.i(x.a)],y.s),v=x.b
if(v!=null)w.push("stops: "+A.i(v))
w.push("tileMode: "+x.r.k(0))
return"SweepGradient("+B.c.bX(w,", ")+")"}}
C.HI.prototype={
sYy(d){if(this.cr===d)return
this.cr=d
this.aa()},
sVg(d){if(this.cZ===d)return
this.cZ=d
this.aa()},
zh(d){var x=d.b*this.cr,w=d.d*this.cZ
return new A.a0(x,x,w,w)},
bV(d){var x,w,v=this,u=v.A$
if(u==null)x=v.a_w(d)
else{w=v.cZ
x=u.am(B.b8,d*w,u.gcf())}u=v.cr
return x/u},
bT(d){var x,w,v=this,u=v.A$
if(u==null)x=v.a_u(d)
else{w=v.cZ
x=u.am(B.aL,d*w,u.gbZ())}u=v.cr
return x/u},
bU(d){var x,w,v=this,u=v.A$
if(u==null)x=v.a_v(d)
else{w=v.cr
x=u.am(B.bh,d*w,u.gci())}u=v.cZ
return x/u},
bS(d){var x,w,v=this,u=v.A$
if(u==null)x=v.a_t(d)
else{w=v.cr
x=u.am(B.bM,d*w,u.gcu())}u=v.cZ
return x/u},
dd(d){var x=this.A$
if(x!=null)return d.bK(x.am(B.a1,this.zh(d),x.gcG()))
return d.bK(this.zh(d).bK(B.a_))},
dS(d,e){var x,w,v,u,t=this,s=t.A$
if(s==null)return null
x=t.zh(d)
w=s.eP(x,e)
if(w==null)return null
v=s.am(B.a1,x,s.gcG())
u=t.am(B.a1,d,t.gcG())
return w+t.gCA().jH(y.H.a(u.a9(0,v))).b},
c5(){var x=this,w=x.A$,v=y.k
if(w!=null){w.cT(x.zh(v.a(A.t.prototype.ga0.call(x))),!0)
x.fy=v.a(A.t.prototype.ga0.call(x)).bK(x.A$.gt())
x.Ai()}else x.fy=v.a(A.t.prototype.ga0.call(x)).bK(x.zh(v.a(A.t.prototype.ga0.call(x))).bK(B.a_))}}
C.UO.prototype={
ba(d){var x=new C.HI(this.e,this.f,B.J,A.dm(d),null,new A.aX(),A.an())
x.b8()
x.sbF(null)
return x},
be(d,e){e.sfV(B.J)
e.sYy(this.e)
e.sVg(this.f)
e.sck(A.dm(d))}}
C.uJ.prototype={
B(d){var x=null,w=A.b([new A.bD(4,B.a4,B.bC.af(0.55),B.k,42),new A.bD(0,B.a4,B.h.af(0.2),D.ali,18),new A.bD(0,B.a4,B.p.af(0.7),D.akG,28)],y.V),v=y.p
return A.fN(x,B.aV,A.eZ(B.bN,A.b([D.ajU,A.hM(!0,A.cy(A.et(new A.ci(B.o8,A.ag(A.b([A.cy(A.cX(x,A.o_("imagens/brasao_perfectgestdev.png",B.J,x,x,x,B.c4,B.di,x,240),B.t,x,x,new A.bd(x,x,x,x,w,x,B.H),x,x,x,x,x,x,x),x,x),B.r,A.j("Refer\xeancia (render 3D)",x,x,x,x,A.bo().$2$color$fontSize(B.cC,11),x,x,x),B.dw,new C.Yd(A.ag(A.b([A.bw(A.b([A.c3(A.ag(A.b([A.b_a("Perfect Gest Dev",30,4),A.bw(A.b([A.bds("DEV",22,3.5),B.fL,C.bdu(24)],v),B.e4,x,B.j,B.l,0)],v),B.G,B.j,B.l),1),A.dO(!1,x,x,x,A.cj(B.pQ,B.h.af(0.95),x,x),x,x,new C.asd(),x,x,x,"Voltar ao site")],v),B.z,x,B.j,B.l,0),B.aa,A.j("Amostra v3 \u2014 UI com o mesmo brilho",x,x,x,x,A.bo().$4$color$fontSize$letterSpacing$shadows(B.bD,12,0.5,A.b_e(1)),x,x,x),B.bK,A.bw(A.b([A.b_a("PLAY",20,3),B.d9,C.bdu(20),B.jY,A.c3(A.b_a("Codificando o Amanh\xe3",20,3),1)],v),B.z,x,B.j,B.l,0),B.M,A.j("Cromado com bandas de luz, cobre polido, ouro ambiente e verniz \u2014 mais perto da vividez do badge acima.",x,x,x,x,A.bo().$5$color$fontSize$fontWeight$height$shadows(B.bD.af(0.95),14,B.aM,1.55,A.b_e(1.2)),x,x,x),B.eT,A.bdt(x,"Bot\xe3o cromado envernizado",new C.ase()),B.bs,A.j("Teste local (8080). Aprovar antes de aplicar ao site completo.",x,x,x,x,A.bo().$3$color$fontSize$fontStyle(B.cC,11,B.dL),x,x,x)],v),B.S,B.j,B.l),x)],v),B.z,B.j,B.l),x),x,B.vw,B.a8),x,x),!1,B.ad,!0)],v),B.u,B.k2,x),x,x,x,x)}}
C.Ye.prototype={
B(d){var x=null,w=y.O
return A.eZ(B.bN,A.b([D.Vs,A.cA(x,new A.bd(x,x,x,x,x,new C.jE(D.Py,0.95,B.b5,x,0,A.b([B.bC.af(0.42),B.a2.af(0.18),B.v],w),D.yr,x),B.H),B.ah),A.cA(x,new A.bd(x,x,x,x,x,new C.jE(D.Pt,0.7,B.b5,x,0,A.b([B.h.af(0.06),B.v],w),x,x),B.H),B.ah),new A.ct(B.cV,x,x,new C.UO(1,0.38,A.cA(x,new A.bd(x,x,x,x,x,new A.eH(B.cm,B.cV,B.b5,A.b([B.v,B.bC.af(0.12),B.p.af(0.75)],w),B.AL,x),B.H),B.ah),x),x),D.ajR,D.aEK],y.p),B.u,B.k2,x)}}
C.Yd.prototype={
B(d){var x=null,w=A.bi(22),v=A.b([new A.bD(2,B.a4,B.bC.af(0.5),B.Ic,48),new A.bD(0,B.a4,B.a2.af(0.35),B.mN,28),new A.bD(0,B.a4,B.p.af(0.85),D.akD,24)],y.V),u=y.O
return A.cX(x,A.l2(A.bi(18.88),A.eZ(B.bN,A.b([A.auJ(0,A.cA(x,new A.bd(x,x,x,x,x,new C.jE(D.Pu,1.05,B.b5,x,0,A.b([D.Ua,B.uy,B.aV],u),x,x),B.H),B.ah)),D.anz,D.anA,A.ia(x,A.cA(x,new A.bd(x,x,x,x,x,new A.eH(B.cm,B.cV,B.b5,A.b([B.h.af(0.42),B.h.af(0.16),B.h.af(0.04),B.v],u),D.abS,x),B.H),B.ah),165,x,0,0,0,x),A.ia(x,A.cX(x,x,B.t,x,x,new A.bd(x,x,x,A.bi(50),x,new C.jE(B.J,0.5,B.b5,x,0,A.b([B.h.af(0.72),B.h.af(0.22),B.v],u),D.yr,x),B.H),x,68,x,x,x,x,130),x,x,10,x,6,x),D.anx,A.auJ(0,A.cA(x,new A.bd(x,x,x,x,x,new A.eH(D.Pw,D.Pv,B.b5,A.b([B.h.af(0.22),B.v,B.v,B.p.af(0.35)],u),D.a8i,x),B.H),B.ah)),A.ia(0,A.cA(x,new A.bd(x,x,x,x,x,new A.eH(B.cm,B.cV,B.b5,A.b([B.v,B.p.af(0.45)],u),x,x),B.H),B.ah),90,x,0,0,x,x),new A.a1(B.vz,this.c,x)],y.p),B.u,B.ca,x),B.br),B.t,x,x,new A.bd(x,x,x,w,v,B.wT,B.H),x,x,x,D.Xh,x,x,x)}}
C.a4H.prototype={
B(d){var x=null
return new A.er(!0,A.hg(x,x,x,new C.a4I(x),B.jX),x)}}
C.a6e.prototype={
B(d){var x=null
return new A.er(!0,A.hg(x,x,x,new C.a6f(x),B.jX),x)}}
C.a8c.prototype={
B(d){var x=null
return new A.er(!0,A.hg(x,x,x,new C.abT(x),B.jX),x)}}
C.a4I.prototype={
b3(d,e){var x,w,v=new A.f(e.a*0.5,e.b*0.42),u=e.geR()*0.55
for(x=8;x<u;x+=5.5){$.a3()
w=new A.ji(B.co,B.c7,B.dU,B.ek,B.cM)
w.b=B.bJ
w.c=0.9
w.r=B.h.af(0.028+B.e.ac(x,22)*0.001).gq()
d.m2(v,x,w)}},
eS(d){return!1}}
C.a6f.prototype={
b3(d,e){var x,w,v,u=null,t=new A.ch($.a3().r,B.ae,u,u,A.b([],y.v)),s=e.b
t.aM(new A.eW(0,s*0.08))
x=e.a
t.aM(new A.cC(x*0.42,0))
t.aM(new A.cC(0,0))
t.aM(new A.tA())
w=A.b7()
w.sr_(new A.eH(B.bA,B.dB,B.b5,A.b([B.h.af(0.55),B.h.af(0.08),B.v],y.O),u,u).tc(new A.z(0,0,0+x*0.5,0+s*0.2)))
d.ic(t,w)
v=A.b7()
v.r=B.h.af(0.35).gq()
v.c=1.5
v.b=B.bJ
d.ld(new A.f(4,4),new A.f(x*0.35,4),v)},
eS(d){return!1}}
C.abT.prototype={
b3(d,e){var x,w,v,u=e.a,t=e.b,s=[new A.f(u*0.15,t*0.22),new A.f(u*0.82,t*0.18),new A.f(u*0.7,t*0.75)]
for(u=y.O,x=0;x<3;++x){w=s[x]
$.a3()
v=new A.ji(B.co,B.c7,B.dU,B.ek,B.cM)
v.sr_(new C.jE(B.J,0.5,B.b5,null,0,A.b([B.h.af(0.12),B.v],u),null,null).tc(A.ou(w,40)))
d.m2(w,40,v)}},
eS(d){return!1}}
var z=a.updateTypes(["M(M)"])
C.auV.prototype={
$1(d){var x=A.N(null,d,this.a)
x.toString
return x},
$S:68}
C.aAF.prototype={
$1(d){var x=A.N(null,d,this.a)
x.toString
return x},
$S:68}
C.asd.prototype={
$0(){return A.b4i()},
$S:0}
C.ase.prototype={
$0(){},
$S:0};(function installTearOffs(){var x=a._instance_1u
var w
x(w=C.HI.prototype,"gcf","bV",0)
x(w,"gbZ","bT",0)
x(w,"gci","bU",0)
x(w,"gcu","bS",0)})();(function inheritance(){var x=a.inheritMany,w=a.inherit
x(A.Un,[C.alA,C.alH])
x(A.Fa,[C.jE,C.rb])
x(A.l4,[C.auV,C.aAF])
w(C.HI,A.Hx)
w(C.UO,A.bc)
x(A.X,[C.uJ,C.Ye,C.Yd,C.a4H,C.a6e,C.a8c])
x(A.l5,[C.asd,C.ase])
x(A.E8,[C.a4I,C.a6f,C.abT])})()
A.wG(b.typeUniverse,JSON.parse('{"HI":{"E":[],"aU":["E"],"t":[],"ar":[]},"UO":{"bc":[],"az":[],"c":[]},"uJ":{"X":[],"c":[]},"Ye":{"X":[],"c":[]},"Yd":{"X":[],"c":[]},"a4H":{"X":[],"c":[]},"a6e":{"X":[],"c":[]},"a8c":{"X":[],"c":[]},"a4I":{"aj":[]},"a6f":{"aj":[]},"abT":{"aj":[]}}'))
var y=(function rtii(){var x=A.ab
return{k:x("a0"),G:x("y"),V:x("A<bD>"),O:x("A<y>"),v:x("A<dR>"),s:x("A<m>"),p:x("A<c>"),n:x("A<M>"),H:x("f"),q:x("jE?"),c:x("rb?")}})();(function constants(){var x=a.makeConstList
D.Pt=new A.e5(-0.85,0.2)
D.Pu=new A.e5(0.5,0.38)
D.Pv=new A.e5(0.7,0.65)
D.Pw=new A.e5(-1.1,-1)
D.Py=new A.e5(0.5,-0.35)
D.Ua=new A.y(1,0.22745098039215686,0.22745098039215686,0.22745098039215686,B.i)
D.Ps=new A.e5(0.55,0.95)
D.TX=new A.y(1,0.4196078431372549,0.3058823529411765,0.07058823529411765,B.i)
D.Tt=new A.y(1,0.10196078431372549,0.0784313725490196,0.03137254901960784,B.i)
D.a73=x([D.TX,D.Tt,B.aV,B.p],y.O)
D.a4_=x([0,0.28,0.55,1],y.n)
D.anJ=new C.jE(D.Ps,1.45,B.b5,null,0,D.a73,D.a4_,null)
D.Qx=new A.bd(null,null,null,null,null,D.anJ,B.H)
D.Vs=new A.k9(D.Qx,B.ah,null,null)
D.Xh=new A.W(5.2,5.2,5.2,5.2)
D.YX=new A.aQ(983200,"MaterialIcons",!1)
D.yr=x([0,0.35,1],y.n)
D.a8i=x([0,0.32,0.68,1],y.n)
D.abS=x([0,0.25,0.55,1],y.n)
D.ajR=new A.yU(0.55,null)
D.ajU=new C.Ye(null)
D.akD=new A.f(0,10)
D.akG=new A.f(0,14)
D.ali=new A.f(-3,-4)
D.aEg=new C.a6e(null)
D.anx=new A.jD(0,0,0,0,null,null,D.aEg,null)
D.aE3=new C.a4H(null)
D.anz=new A.jD(0,0,0,0,null,null,D.aE3,null)
D.ajS=new A.yU(1.1,null)
D.anA=new A.jD(0,0,0,0,null,null,D.ajS,null)
D.a8_=x([B.h,B.bC,B.a2,B.cC],y.O)
D.asp=new C.rb(B.J,0,6.283185307179586,B.b5,D.a8_,null,null)
D.aEK=new C.a8c(null)})()};
(a=>{a["P2xpFXbcqEnQXQOvyVsO274+MYw="]=a.current})($__dart_deferred_initializers__);