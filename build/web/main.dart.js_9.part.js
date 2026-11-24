((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,B,C={alE:function alE(d,e,f,g,h,i,j,k){var _=this
_.c=d
_.d=e
_.e=f
_.f=g
_.r=h
_.w=i
_.x=j
_.y=k
_.z=null
_.a=!1},alL:function alL(d,e,f,g,h,i,j){var _=this
_.c=d
_.d=e
_.e=f
_.f=g
_.r=h
_.w=i
_.x=j
_.y=null
_.a=!1},
b93(d,e,f){var x,w,v,u,t,s,r
if(d==e)return d
if(d==null)return e.b1(f)
if(e==null)return d.b1(1-f)
x=A.b3J(d.a,d.nP(),e.a,e.nP(),f)
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
b9M(d,e,f){var x,w,v,u,t,s
if(d==e)return d
if(d==null)return e.b1(f)
if(e==null)return d.b1(1-f)
x=A.b3J(d.a,d.nP(),e.a,e.nP(),f)
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
return new C.rc(w,v,u,s,x.a,x.b,t)},
jE:function jE(d,e,f,g,h,i,j,k){var _=this
_.d=d
_.e=e
_.f=f
_.r=g
_.w=h
_.a=i
_.b=j
_.c=k},
auZ:function auZ(d){this.a=d},
rc:function rc(d,e,f,g,h,i,j){var _=this
_.d=d
_.e=e
_.f=f
_.r=g
_.a=h
_.b=i
_.c=j},
aAJ:function aAJ(d){this.a=d},
HK:function HK(d,e,f,g,h,i,j){var _=this
_.cr=d
_.cZ=e
_.v=null
_.a5=f
_.av=g
_.B$=h
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
UQ:function UQ(d,e,f,g){var _=this
_.e=d
_.f=e
_.c=f
_.a=g},
bmd(){return new C.uK(null)},
uK:function uK(d){this.a=d},
ash:function ash(){},
asi:function asi(){},
bdB(d){var x=null,w=A.b([new A.bA(0,B.a3,B.h.af(0.5),B.k,6)],y.V)
return A.cX(x,A.ci(D.Z7,B.h,x,d*0.72),B.t,x,x,new A.b7(x,x,x,x,w,D.asH,B.h9),x,d,x,x,x,x,d)},
Yg:function Yg(d){this.a=d},
Yf:function Yf(d,e){this.c=d
this.a=e},
a4J:function a4J(d){this.a=d},
a6g:function a6g(d){this.a=d},
a8f:function a8f(d){this.a=d},
a4K:function a4K(d){this.a=d},
a6h:function a6h(d){this.a=d},
abX:function abX(d){this.a=d}},D
J=c[1]
A=c[0]
B=c[2]
C=a.updateHolder(c[6],C)
D=c[15]
C.alE.prototype={
gSq(){var x,w,v,u,t,s,r,q,p,o,n=this,m=null,l=n.z
if(l==null){x=A.b3B(n.e)
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
l=new A.tx()
v=$.bz.cg().Shader
u=A.af_(q,u)
q=A.b0h(w)
s=A.afm(s)
r=r!=null?A.afl(r):m
l.a=A.fi(v,"MakeRadialGradient",[u,t,x,q,s,r==null?m:r,0])
$.afD().jI(n,l,l)
n.z=l}else{$.a3()
v=l.a
l=l.b
p=new A.tx()
o=$.bz.cg().Shader
l=A.af_(v,l)
u=A.af_(q,u)
q=A.b0h(w)
s=A.afm(s)
v=r!=null?A.afl(r):m
if(v==null)v=m
p.a=A.fi(o,"MakeTwoPointConicalGradient",[l,n.y,u,t,x,q,s,v,0])
$.afD().jI(n,p,p)
n.z=p
l=p}}return l}}
C.alL.prototype={
gSq(){var x,w,v,u,t,s,r,q=this,p=q.y
if(p==null){x=A.b3B(q.d)
w=new Float32Array(A.h7(q.e))
$.a3()
p=q.c
v=q.x
u=new A.tx()
t=$.bz.cg().Shader
s=A.b0h(w)
r=A.afm(q.f)
v=v!=null?A.afl(v):null
if(v==null)v=null
u.a=A.fi(t,"MakeSweepGradient",[p.a,p.b,x,s,r,v,0,q.r*180/3.141592653589793,q.w*180/3.141592653589793])
$.afD().jI(q,u,u)
q.y=u
p=u}return p}}
C.jE.prototype={
wh(d,e){var x,w,v=this,u=v.d.W(e).CV(d),t=d.geR(),s=v.a,r=v.nP()
v.Q9(d,e)
x=v.r
x=x==null?null:x.W(e).CV(d)
w=d.geR()
A.b3Z(s,r)
return new C.alE(u,v.e*t,s,r,v.f,null,x,v.w*w)},
td(d){return this.wh(d,null)},
b1(d){var x=this,w=x.a,v=A.a9(w).i("am<1,r>")
w=A.a2(new A.am(w,new C.auZ(d),v),v.i("aE.E"))
return new C.jE(x.d,x.e,x.f,x.r,x.w,w,x.b,x.c)},
Iy(d){var x=this
return new C.jE(x.d,x.e,x.f,x.r,x.w,A.bL(x.a.length,d,!1,y.G),x.b,x.c)},
dT(d,e){if(y.q.b(d))return C.b93(d,this,e)
return this.Mv(d,e)},
dU(d,e){if(y.q.b(d))return C.b93(this,d,e)
return this.Mw(d,e)},
j(d,e){var x=this
if(e==null)return!1
if(x===e)return!0
if(J.a0(e)!==A.K(x))return!1
return e instanceof C.jE&&e.d.j(0,x.d)&&e.e===x.e&&e.f===x.f&&A.d_(e.a,x.a)&&A.d_(e.b,x.b)&&J.e(e.r,x.r)&&e.w===x.w},
gE(d){var x=this,w=A.bV(x.a),v=x.b
v=v==null?null:A.bV(v)
return A.U(x.d,x.e,x.f,x.c,w,v,x.r,x.w,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
k(d){var x=this,w=A.b(["center: "+x.d.k(0),"radius: "+A.hY(x.e),"colors: "+A.i(x.a)],y.s),v=x.b
if(v!=null)w.push("stops: "+A.i(v))
w.push("tileMode: "+x.f.k(0))
v=x.r
if(v!=null)w.push("focal: "+v.k(0))
w.push("focalRadius: "+A.hY(x.w))
return"RadialGradient("+B.c.bX(w,", ")+")"}}
C.rc.prototype={
wh(d,e){var x=this,w=x.d.W(e).CV(d),v=x.a,u=x.nP()
x.Q9(d,e)
A.b3Z(v,u)
return new C.alL(w,v,u,x.r,x.e,x.f,null)},
b1(d){var x=this,w=x.a,v=A.a9(w).i("am<1,r>")
w=A.a2(new A.am(w,new C.aAJ(d),v),v.i("aE.E"))
return new C.rc(x.d,x.e,x.f,x.r,w,x.b,x.c)},
Iy(d){var x=this
return new C.rc(x.d,x.e,x.f,x.r,A.bL(x.a.length,d,!1,y.G),x.b,x.c)},
dT(d,e){if(y.c.b(d))return C.b9M(d,this,e)
return this.Mv(d,e)},
dU(d,e){if(y.c.b(d))return C.b9M(this,d,e)
return this.Mw(d,e)},
j(d,e){var x=this
if(e==null)return!1
if(x===e)return!0
if(J.a0(e)!==A.K(x))return!1
return e instanceof C.rc&&e.d.j(0,x.d)&&e.e===x.e&&e.f===x.f&&e.r===x.r&&A.d_(e.a,x.a)&&A.d_(e.b,x.b)},
gE(d){var x=this,w=A.bV(x.a),v=x.b
v=v==null?null:A.bV(v)
return A.U(x.d,x.e,x.f,x.r,x.c,w,v,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
k(d){var x=this,w=A.b(["center: "+x.d.k(0),"startAngle: "+A.hY(x.e),"endAngle: "+A.hY(x.f),"colors: "+A.i(x.a)],y.s),v=x.b
if(v!=null)w.push("stops: "+A.i(v))
w.push("tileMode: "+x.r.k(0))
return"SweepGradient("+B.c.bX(w,", ")+")"}}
C.HK.prototype={
sYI(d){if(this.cr===d)return
this.cr=d
this.aa()},
sVg(d){if(this.cZ===d)return
this.cZ=d
this.aa()},
zh(d){var x=d.b*this.cr,w=d.d*this.cZ
return new A.a1(x,x,w,w)},
bV(d){var x,w,v=this,u=v.B$
if(u==null)x=v.a_G(d)
else{w=v.cZ
x=u.am(B.b8,d*w,u.gcf())}u=v.cr
return x/u},
bT(d){var x,w,v=this,u=v.B$
if(u==null)x=v.a_E(d)
else{w=v.cZ
x=u.am(B.aL,d*w,u.gbZ())}u=v.cr
return x/u},
bU(d){var x,w,v=this,u=v.B$
if(u==null)x=v.a_F(d)
else{w=v.cr
x=u.am(B.bh,d*w,u.gci())}u=v.cZ
return x/u},
bS(d){var x,w,v=this,u=v.B$
if(u==null)x=v.a_D(d)
else{w=v.cr
x=u.am(B.bM,d*w,u.gcu())}u=v.cZ
return x/u},
dd(d){var x=this.B$
if(x!=null)return d.bK(x.am(B.a1,this.zh(d),x.gcG()))
return d.bK(this.zh(d).bK(B.a_))},
dS(d,e){var x,w,v,u,t=this,s=t.B$
if(s==null)return null
x=t.zh(d)
w=s.eP(x,e)
if(w==null)return null
v=s.am(B.a1,x,s.gcG())
u=t.am(B.a1,d,t.gcG())
return w+t.gCE().jH(y.H.a(u.a9(0,v))).b},
c5(){var x=this,w=x.B$,v=y.k
if(w!=null){w.cT(x.zh(v.a(A.u.prototype.ga0.call(x))),!0)
x.fy=v.a(A.u.prototype.ga0.call(x)).bK(x.B$.gt())
x.Aj()}else x.fy=v.a(A.u.prototype.ga0.call(x)).bK(x.zh(v.a(A.u.prototype.ga0.call(x))).bK(B.a_))}}
C.UQ.prototype={
ba(d){var x=new C.HK(this.e,this.f,B.J,A.dn(d),null,new A.aX(),A.an())
x.b8()
x.sbF(null)
return x},
be(d,e){e.sfW(B.J)
e.sYI(this.e)
e.sVg(this.f)
e.sck(A.dn(d))}}
C.uK.prototype={
A(d){var x=null,w=A.b([new A.bA(4,B.a3,B.bC.af(0.55),B.k,42),new A.bA(0,B.a3,B.h.af(0.2),D.aly,18),new A.bA(0,B.a3,B.p.af(0.7),D.akW,28)],y.V),v=y.p
return A.fN(x,B.aW,A.eZ(B.bN,A.b([D.ak9,A.hO(!0,A.cy(A.eu(new A.cj(B.oc,A.af(A.b([A.cy(A.cX(x,A.nZ("imagens/brasao_perfectgestdev.png",B.J,x,x,x,B.bP,B.cO,x,240),B.t,x,x,new A.b7(x,x,x,x,w,x,B.H),x,x,x,x,x,x,x),x,x),B.r,A.j("Refer\xeancia (render 3D)",x,x,x,x,A.bo().$2$color$fontSize(B.cC,11),x,x,x),B.dy,new C.Yf(A.af(A.b([A.bq(A.b([A.c1(A.af(A.b([A.b_i("Perfect Gest Dev",30,4),A.bq(A.b([A.bdz("DEV",22,3.5),B.fN,C.bdB(24)],v),B.e5,x,B.j,B.l,0)],v),B.F,B.j,B.l),1),A.dO(!1,x,x,x,A.ci(B.pU,B.h.af(0.95),x,x),x,x,new C.ash(),x,x,x,"Voltar ao site")],v),B.z,x,B.j,B.l,0),B.aa,A.j("Amostra v3 \u2014 UI com o mesmo brilho",x,x,x,x,A.bo().$4$color$fontSize$letterSpacing$shadows(B.bD,12,0.5,A.b_m(1)),x,x,x),B.bK,A.bq(A.b([A.b_i("PLAY",20,3),B.cK,C.bdB(20),B.k_,A.c1(A.b_i("Codificando o Amanh\xe3",20,3),1)],v),B.z,x,B.j,B.l,0),B.M,A.j("Cromado com bandas de luz, cobre polido, ouro ambiente e verniz \u2014 mais perto da vividez do badge acima.",x,x,x,x,A.bo().$5$color$fontSize$fontWeight$height$shadows(B.bD.af(0.95),14,B.aM,1.55,A.b_m(1.2)),x,x,x),B.eU,A.bdA(x,"Bot\xe3o cromado envernizado",new C.asi()),B.bn,A.j("Teste local (8080). Aprovar antes de aplicar ao site completo.",x,x,x,x,A.bo().$3$color$fontSize$fontStyle(B.cC,11,B.dM),x,x,x)],v),B.P,B.j,B.l),x)],v),B.z,B.j,B.l),x),x,B.vz,B.a8),x,x),!1,B.af,!0)],v),B.u,B.k4,x),x,x,x,x)}}
C.Yg.prototype={
A(d){var x=null,w=y.O
return A.eZ(B.bN,A.b([D.Vz,A.cu(x,new A.b7(x,x,x,x,x,new C.jE(D.PC,0.95,B.b5,x,0,A.b([B.bC.af(0.42),B.a2.af(0.18),B.v],w),D.yv,x),B.H),B.ac),A.cu(x,new A.b7(x,x,x,x,x,new C.jE(D.Px,0.7,B.b5,x,0,A.b([B.h.af(0.06),B.v],w),x,x),B.H),B.ac),new A.cm(B.cY,x,x,new C.UQ(1,0.38,A.cu(x,new A.b7(x,x,x,x,x,new A.eH(B.cm,B.cY,B.b5,A.b([B.v,B.bC.af(0.12),B.p.af(0.75)],w),B.AP,x),B.H),B.ac),x),x),D.ak6,D.aF7],y.p),B.u,B.k4,x)}}
C.Yf.prototype={
A(d){var x=null,w=A.be(22),v=A.b([new A.bA(2,B.a3,B.bC.af(0.5),B.If,48),new A.bA(0,B.a3,B.a2.af(0.35),B.jx,28),new A.bA(0,B.a3,B.p.af(0.85),D.akT,24)],y.V),u=y.O
return A.cX(x,A.l2(A.be(18.88),A.eZ(B.bN,A.b([A.auN(0,A.cu(x,new A.b7(x,x,x,x,x,new C.jE(D.Py,1.05,B.b5,x,0,A.b([D.Uf,B.uA,B.aW],u),x,x),B.H),B.ac)),D.anQ,D.anR,A.ia(x,A.cu(x,new A.b7(x,x,x,x,x,new A.eH(B.cm,B.cY,B.b5,A.b([B.h.af(0.42),B.h.af(0.16),B.h.af(0.04),B.v],u),D.ac4,x),B.H),B.ac),165,x,0,0,0,x),A.ia(x,A.cX(x,x,B.t,x,x,new A.b7(x,x,x,A.be(50),x,new C.jE(B.J,0.5,B.b5,x,0,A.b([B.h.af(0.72),B.h.af(0.22),B.v],u),D.yv,x),B.H),x,68,x,x,x,x,130),x,x,10,x,6,x),D.anO,A.auN(0,A.cu(x,new A.b7(x,x,x,x,x,new A.eH(D.PA,D.Pz,B.b5,A.b([B.h.af(0.22),B.v,B.v,B.p.af(0.35)],u),D.a8v,x),B.H),B.ac)),A.ia(0,A.cu(x,new A.b7(x,x,x,x,x,new A.eH(B.cm,B.cY,B.b5,A.b([B.v,B.p.af(0.45)],u),x,x),B.H),B.ac),90,x,0,0,x,x),new A.Z(B.vC,this.c,x)],y.p),B.u,B.ca,x),B.bt),B.t,x,x,new A.b7(x,x,x,w,v,B.wX,B.H),x,x,x,D.Xr,x,x,x)}}
C.a4J.prototype={
A(d){var x=null
return new A.es(!0,A.hg(x,x,x,new C.a4K(x),B.jZ),x)}}
C.a6g.prototype={
A(d){var x=null
return new A.es(!0,A.hg(x,x,x,new C.a6h(x),B.jZ),x)}}
C.a8f.prototype={
A(d){var x=null
return new A.es(!0,A.hg(x,x,x,new C.abX(x),B.jZ),x)}}
C.a4K.prototype={
b3(d,e){var x,w,v=new A.f(e.a*0.5,e.b*0.42),u=e.geR()*0.55
for(x=8;x<u;x+=5.5){$.a3()
w=new A.jj(B.co,B.c7,B.dV,B.el,B.cP)
w.b=B.bJ
w.c=0.9
w.r=B.h.af(0.028+B.e.ac(x,22)*0.001).gq()
d.m4(v,x,w)}},
eS(d){return!1}}
C.a6h.prototype={
b3(d,e){var x,w,v,u=null,t=new A.ch($.a3().r,B.ag,u,u,A.b([],y.v)),s=e.b
t.aM(new A.eW(0,s*0.08))
x=e.a
t.aM(new A.cC(x*0.42,0))
t.aM(new A.cC(0,0))
t.aM(new A.tB())
w=A.b8()
w.sr0(new A.eH(B.bi,B.dC,B.b5,A.b([B.h.af(0.55),B.h.af(0.08),B.v],y.O),u,u).td(new A.z(0,0,0+x*0.5,0+s*0.2)))
d.ic(t,w)
v=A.b8()
v.r=B.h.af(0.35).gq()
v.c=1.5
v.b=B.bJ
d.ld(new A.f(4,4),new A.f(x*0.35,4),v)},
eS(d){return!1}}
C.abX.prototype={
b3(d,e){var x,w,v,u=e.a,t=e.b,s=[new A.f(u*0.15,t*0.22),new A.f(u*0.82,t*0.18),new A.f(u*0.7,t*0.75)]
for(u=y.O,x=0;x<3;++x){w=s[x]
$.a3()
v=new A.jj(B.co,B.c7,B.dV,B.el,B.cP)
v.sr0(new C.jE(B.J,0.5,B.b5,null,0,A.b([B.h.af(0.12),B.v],u),null,null).td(A.ot(w,40)))
d.m4(w,40,v)}},
eS(d){return!1}}
var z=a.updateTypes(["M(M)"])
C.auZ.prototype={
$1(d){var x=A.N(null,d,this.a)
x.toString
return x},
$S:71}
C.aAJ.prototype={
$1(d){var x=A.N(null,d,this.a)
x.toString
return x},
$S:71}
C.ash.prototype={
$0(){return A.b4q()},
$S:0}
C.asi.prototype={
$0(){},
$S:0};(function installTearOffs(){var x=a._instance_1u
var w
x(w=C.HK.prototype,"gcf","bV",0)
x(w,"gbZ","bT",0)
x(w,"gci","bU",0)
x(w,"gcu","bS",0)})();(function inheritance(){var x=a.inheritMany,w=a.inherit
x(A.Uq,[C.alE,C.alL])
x(A.Fc,[C.jE,C.rc])
x(A.l4,[C.auZ,C.aAJ])
w(C.HK,A.Hz)
w(C.UQ,A.bd)
x(A.X,[C.uK,C.Yg,C.Yf,C.a4J,C.a6g,C.a8f])
x(A.l5,[C.ash,C.asi])
x(A.E9,[C.a4K,C.a6h,C.abX])})()
A.wH(b.typeUniverse,JSON.parse('{"HK":{"E":[],"aU":["E"],"u":[],"ar":[]},"UQ":{"bd":[],"az":[],"c":[]},"uK":{"X":[],"c":[]},"Yg":{"X":[],"c":[]},"Yf":{"X":[],"c":[]},"a4J":{"X":[],"c":[]},"a6g":{"X":[],"c":[]},"a8f":{"X":[],"c":[]},"a4K":{"aj":[]},"a6h":{"aj":[]},"abX":{"aj":[]}}'))
var y=(function rtii(){var x=A.ab
return{k:x("a1"),G:x("r"),V:x("A<bA>"),O:x("A<r>"),v:x("A<dR>"),s:x("A<m>"),p:x("A<c>"),n:x("A<M>"),H:x("f"),q:x("jE?"),c:x("rc?")}})();(function constants(){var x=a.makeConstList
D.Px=new A.e6(-0.85,0.2)
D.Py=new A.e6(0.5,0.38)
D.Pz=new A.e6(0.7,0.65)
D.PA=new A.e6(-1.1,-1)
D.PC=new A.e6(0.5,-0.35)
D.Uf=new A.r(1,0.22745098039215686,0.22745098039215686,0.22745098039215686,B.i)
D.Pw=new A.e6(0.55,0.95)
D.U1=new A.r(1,0.4196078431372549,0.3058823529411765,0.07058823529411765,B.i)
D.a7g=x([D.U1,B.iI,B.aW,B.p],y.O)
D.a4b=x([0,0.28,0.55,1],y.n)
D.ao_=new C.jE(D.Pw,1.45,B.b5,null,0,D.a7g,D.a4b,null)
D.QB=new A.b7(null,null,null,null,null,D.ao_,B.H)
D.Vz=new A.k9(D.QB,B.ac,null,null)
D.Xr=new A.W(5.2,5.2,5.2,5.2)
D.Z7=new A.aQ(983200,"MaterialIcons",!1)
D.yv=x([0,0.35,1],y.n)
D.a8v=x([0,0.32,0.68,1],y.n)
D.ac4=x([0,0.25,0.55,1],y.n)
D.ak6=new A.yW(0.55,null)
D.ak9=new C.Yg(null)
D.akT=new A.f(0,10)
D.akW=new A.f(0,14)
D.aly=new A.f(-3,-4)
D.aED=new C.a6g(null)
D.anO=new A.jD(0,0,0,0,null,null,D.aED,null)
D.aEq=new C.a4J(null)
D.anQ=new A.jD(0,0,0,0,null,null,D.aEq,null)
D.ak7=new A.yW(1.1,null)
D.anR=new A.jD(0,0,0,0,null,null,D.ak7,null)
D.a8c=x([B.h,B.bC,B.a2,B.cC],y.O)
D.asH=new C.rc(B.J,0,6.283185307179586,B.b5,D.a8c,null,null)
D.aF7=new C.a8f(null)})()};
(a=>{a["flJqnehL+P4xQkJq/lZN2xdJGyI="]=a.current})($__dart_deferred_initializers__);