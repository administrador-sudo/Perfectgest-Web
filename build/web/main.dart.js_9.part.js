((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,B,C={alG:function alG(d,e,f,g,h,i,j,k){var _=this
_.c=d
_.d=e
_.e=f
_.f=g
_.r=h
_.w=i
_.x=j
_.y=k
_.z=null
_.a=!1},alN:function alN(d,e,f,g,h,i,j){var _=this
_.c=d
_.d=e
_.e=f
_.f=g
_.r=h
_.w=i
_.x=j
_.y=null
_.a=!1},
b99(d,e,f){var x,w,v,u,t,s,r
if(d==e)return d
if(d==null)return e.b1(f)
if(e==null)return d.b1(1-f)
x=A.b3P(d.a,d.nQ(),e.a,e.nQ(),f)
w=A.lX(d.d,e.d,f)
w.toString
v=A.a4(d.e,e.e,f)
v.toString
v=Math.max(0,v)
u=f<0.5
t=u?d.f:e.f
s=A.lX(d.r,e.r,f)
r=A.a4(d.w,e.w,f)
r.toString
r=Math.max(0,r)
u=u?d.c:e.c
return new C.jD(w,v,t,s,r,x.a,x.b,u)},
b9S(d,e,f){var x,w,v,u,t,s
if(d==e)return d
if(d==null)return e.b1(f)
if(e==null)return d.b1(1-f)
x=A.b3P(d.a,d.nQ(),e.a,e.nQ(),f)
w=A.lX(d.d,e.d,f)
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
jD:function jD(d,e,f,g,h,i,j,k){var _=this
_.d=d
_.e=e
_.f=f
_.r=g
_.w=h
_.a=i
_.b=j
_.c=k},
av1:function av1(d){this.a=d},
rc:function rc(d,e,f,g,h,i,j){var _=this
_.d=d
_.e=e
_.f=f
_.r=g
_.a=h
_.b=i
_.c=j},
aAM:function aAM(d){this.a=d},
HL:function HL(d,e,f,g,h,i,j){var _=this
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
UR:function UR(d,e,f,g){var _=this
_.e=d
_.f=e
_.c=f
_.a=g},
bmk(){return new C.uK(null)},
uK:function uK(d){this.a=d},
ask:function ask(){},
asl:function asl(){},
bdH(d){var x=null,w=A.b([new A.bA(0,B.a3,B.h.af(0.5),B.k,6)],y.V)
return A.d5(x,A.ci(D.Z8,B.h,x,d*0.72),B.u,x,x,new A.b6(x,x,x,x,w,D.asJ,B.h8),x,d,x,x,x,x,d)},
Yh:function Yh(d){this.a=d},
Yg:function Yg(d,e){this.c=d
this.a=e},
a4K:function a4K(d){this.a=d},
a6h:function a6h(d){this.a=d},
a8g:function a8g(d){this.a=d},
a4L:function a4L(d){this.a=d},
a6i:function a6i(d){this.a=d},
abY:function abY(d){this.a=d}},D
J=c[1]
A=c[0]
B=c[2]
C=a.updateHolder(c[6],C)
D=c[15]
C.alG.prototype={
gSt(){var x,w,v,u,t,s,r,q,p,o,n=this,m=null,l=n.z
if(l==null){x=A.b3H(n.e)
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
u=A.af0(q,u)
q=A.b0p(w)
s=A.afn(s)
r=r!=null?A.afm(r):m
l.a=A.fi(v,"MakeRadialGradient",[u,t,x,q,s,r==null?m:r,0])
$.afE().jI(n,l,l)
n.z=l}else{$.a3()
v=l.a
l=l.b
p=new A.tx()
o=$.bz.cg().Shader
l=A.af0(v,l)
u=A.af0(q,u)
q=A.b0p(w)
s=A.afn(s)
v=r!=null?A.afm(r):m
if(v==null)v=m
p.a=A.fi(o,"MakeTwoPointConicalGradient",[l,n.y,u,t,x,q,s,v,0])
$.afE().jI(n,p,p)
n.z=p
l=p}}return l}}
C.alN.prototype={
gSt(){var x,w,v,u,t,s,r,q=this,p=q.y
if(p==null){x=A.b3H(q.d)
w=new Float32Array(A.h7(q.e))
$.a3()
p=q.c
v=q.x
u=new A.tx()
t=$.bz.cg().Shader
s=A.b0p(w)
r=A.afn(q.f)
v=v!=null?A.afm(v):null
if(v==null)v=null
u.a=A.fi(t,"MakeSweepGradient",[p.a,p.b,x,s,r,v,0,q.r*180/3.141592653589793,q.w*180/3.141592653589793])
$.afE().jI(q,u,u)
q.y=u
p=u}return p}}
C.jD.prototype={
wh(d,e){var x,w,v=this,u=v.d.W(e).CX(d),t=d.geR(),s=v.a,r=v.nQ()
v.Qc(d,e)
x=v.r
x=x==null?null:x.W(e).CX(d)
w=d.geR()
A.b44(s,r)
return new C.alG(u,v.e*t,s,r,v.f,null,x,v.w*w)},
te(d){return this.wh(d,null)},
b1(d){var x=this,w=x.a,v=A.a9(w).i("am<1,r>")
w=A.a2(new A.am(w,new C.av1(d),v),v.i("aE.E"))
return new C.jD(x.d,x.e,x.f,x.r,x.w,w,x.b,x.c)},
IB(d){var x=this
return new C.jD(x.d,x.e,x.f,x.r,x.w,A.bL(x.a.length,d,!1,y.G),x.b,x.c)},
dT(d,e){if(y.q.b(d))return C.b99(d,this,e)
return this.My(d,e)},
dU(d,e){if(y.q.b(d))return C.b99(this,d,e)
return this.Mz(d,e)},
j(d,e){var x=this
if(e==null)return!1
if(x===e)return!0
if(J.a0(e)!==A.K(x))return!1
return e instanceof C.jD&&e.d.j(0,x.d)&&e.e===x.e&&e.f===x.f&&A.cZ(e.a,x.a)&&A.cZ(e.b,x.b)&&J.e(e.r,x.r)&&e.w===x.w},
gE(d){var x=this,w=A.bV(x.a),v=x.b
v=v==null?null:A.bV(v)
return A.U(x.d,x.e,x.f,x.c,w,v,x.r,x.w,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
k(d){var x=this,w=A.b(["center: "+x.d.k(0),"radius: "+A.hZ(x.e),"colors: "+A.i(x.a)],y.s),v=x.b
if(v!=null)w.push("stops: "+A.i(v))
w.push("tileMode: "+x.f.k(0))
v=x.r
if(v!=null)w.push("focal: "+v.k(0))
w.push("focalRadius: "+A.hZ(x.w))
return"RadialGradient("+B.c.bX(w,", ")+")"}}
C.rc.prototype={
wh(d,e){var x=this,w=x.d.W(e).CX(d),v=x.a,u=x.nQ()
x.Qc(d,e)
A.b44(v,u)
return new C.alN(w,v,u,x.r,x.e,x.f,null)},
b1(d){var x=this,w=x.a,v=A.a9(w).i("am<1,r>")
w=A.a2(new A.am(w,new C.aAM(d),v),v.i("aE.E"))
return new C.rc(x.d,x.e,x.f,x.r,w,x.b,x.c)},
IB(d){var x=this
return new C.rc(x.d,x.e,x.f,x.r,A.bL(x.a.length,d,!1,y.G),x.b,x.c)},
dT(d,e){if(y.c.b(d))return C.b9S(d,this,e)
return this.My(d,e)},
dU(d,e){if(y.c.b(d))return C.b9S(this,d,e)
return this.Mz(d,e)},
j(d,e){var x=this
if(e==null)return!1
if(x===e)return!0
if(J.a0(e)!==A.K(x))return!1
return e instanceof C.rc&&e.d.j(0,x.d)&&e.e===x.e&&e.f===x.f&&e.r===x.r&&A.cZ(e.a,x.a)&&A.cZ(e.b,x.b)},
gE(d){var x=this,w=A.bV(x.a),v=x.b
v=v==null?null:A.bV(v)
return A.U(x.d,x.e,x.f,x.r,x.c,w,v,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
k(d){var x=this,w=A.b(["center: "+x.d.k(0),"startAngle: "+A.hZ(x.e),"endAngle: "+A.hZ(x.f),"colors: "+A.i(x.a)],y.s),v=x.b
if(v!=null)w.push("stops: "+A.i(v))
w.push("tileMode: "+x.r.k(0))
return"SweepGradient("+B.c.bX(w,", ")+")"}}
C.HL.prototype={
sYL(d){if(this.cr===d)return
this.cr=d
this.aa()},
sVj(d){if(this.cZ===d)return
this.cZ=d
this.aa()},
zh(d){var x=d.b*this.cr,w=d.d*this.cZ
return new A.a1(x,x,w,w)},
bV(d){var x,w,v=this,u=v.B$
if(u==null)x=v.a_J(d)
else{w=v.cZ
x=u.am(B.b9,d*w,u.gcf())}u=v.cr
return x/u},
bT(d){var x,w,v=this,u=v.B$
if(u==null)x=v.a_H(d)
else{w=v.cZ
x=u.am(B.aL,d*w,u.gbZ())}u=v.cr
return x/u},
bU(d){var x,w,v=this,u=v.B$
if(u==null)x=v.a_I(d)
else{w=v.cr
x=u.am(B.bg,d*w,u.gci())}u=v.cZ
return x/u},
bS(d){var x,w,v=this,u=v.B$
if(u==null)x=v.a_G(d)
else{w=v.cr
x=u.am(B.bN,d*w,u.gcu())}u=v.cZ
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
return w+t.gCF().jH(y.H.a(u.a9(0,v))).b},
c5(){var x=this,w=x.B$,v=y.k
if(w!=null){w.cT(x.zh(v.a(A.y.prototype.ga0.call(x))),!0)
x.fy=v.a(A.y.prototype.ga0.call(x)).bK(x.B$.gt())
x.Ak()}else x.fy=v.a(A.y.prototype.ga0.call(x)).bK(x.zh(v.a(A.y.prototype.ga0.call(x))).bK(B.a_))}}
C.UR.prototype={
ba(d){var x=new C.HL(this.e,this.f,B.L,A.dn(d),null,new A.aY(),A.an())
x.b8()
x.sbF(null)
return x},
be(d,e){e.sfW(B.L)
e.sYL(this.e)
e.sVj(this.f)
e.sck(A.dn(d))}}
C.uK.prototype={
A(d){var x=null,w=A.b([new A.bA(4,B.a3,B.bD.af(0.55),B.k,42),new A.bA(0,B.a3,B.h.af(0.2),D.alA,18),new A.bA(0,B.a3,B.p.af(0.7),D.akY,28)],y.V),v=y.p
return A.fN(x,B.aW,A.eZ(B.bO,A.b([D.akb,A.hP(!0,A.cy(A.ev(new A.cj(B.od,A.af(A.b([A.cy(A.d5(x,A.o_("imagens/brasao_perfectgestdev.png",B.L,x,x,x,B.bH,B.cB,x,240),B.u,x,x,new A.b6(x,x,x,x,w,x,B.H),x,x,x,x,x,x,x),x,x),B.r,A.j("Refer\xeancia (render 3D)",x,x,x,x,A.bo().$2$color$fontSize(B.cD,11),x,x,x),B.db,new C.Yg(A.af(A.b([A.bq(A.b([A.c1(A.af(A.b([A.b_q("Perfect Gest Dev",30,4),A.bq(A.b([A.bdF("DEV",22,3.5),B.fN,C.bdH(24)],v),B.e6,x,B.j,B.l,0)],v),B.F,B.j,B.l),1),A.dO(!1,x,x,x,A.ci(B.pX,B.h.af(0.95),x,x),x,x,new C.ask(),x,x,x,"Voltar ao site")],v),B.z,x,B.j,B.l,0),B.aa,A.j("Amostra v3 \u2014 UI com o mesmo brilho",x,x,x,x,A.bo().$4$color$fontSize$letterSpacing$shadows(B.bE,12,0.5,A.b_u(1)),x,x,x),B.bM,A.bq(A.b([A.b_q("PLAY",20,3),B.cL,C.bdH(20),B.jZ,A.c1(A.b_q("Codificando o Amanh\xe3",20,3),1)],v),B.z,x,B.j,B.l,0),B.K,A.j("Cromado com bandas de luz, cobre polido, ouro ambiente e verniz \u2014 mais perto da vividez do badge acima.",x,x,x,x,A.bo().$5$color$fontSize$fontWeight$height$shadows(B.bE.af(0.95),14,B.aM,1.55,A.b_u(1.2)),x,x,x),B.eU,A.bdG(x,"Bot\xe3o cromado envernizado",new C.asl()),B.bm,A.j("Teste local (8080). Aprovar antes de aplicar ao site completo.",x,x,x,x,A.bo().$3$color$fontSize$fontStyle(B.cD,11,B.dM),x,x,x)],v),B.P,B.j,B.l),x)],v),B.z,B.j,B.l),x),x,B.vA,B.a8),x,x),!1,B.af,!0)],v),B.t,B.k3,x),x,x,x,x)}}
C.Yh.prototype={
A(d){var x=null,w=y.O
return A.eZ(B.bO,A.b([D.VA,A.cu(x,new A.b6(x,x,x,x,x,new C.jD(D.PE,0.95,B.b6,x,0,A.b([B.bD.af(0.42),B.a2.af(0.18),B.v],w),D.yw,x),B.H),B.ac),A.cu(x,new A.b6(x,x,x,x,x,new C.jD(D.Pz,0.7,B.b6,x,0,A.b([B.h.af(0.06),B.v],w),x,x),B.H),B.ac),new A.cm(B.cY,x,x,new C.UR(1,0.38,A.cu(x,new A.b6(x,x,x,x,x,new A.eH(B.cm,B.cY,B.b6,A.b([B.v,B.bD.af(0.12),B.p.af(0.75)],w),B.AQ,x),B.H),B.ac),x),x),D.ak8,D.aF9],y.p),B.t,B.k3,x)}}
C.Yg.prototype={
A(d){var x=null,w=A.be(22),v=A.b([new A.bA(2,B.a3,B.bD.af(0.5),B.Ig,48),new A.bA(0,B.a3,B.a2.af(0.35),B.jw,28),new A.bA(0,B.a3,B.p.af(0.85),D.akV,24)],y.V),u=y.O
return A.d5(x,A.l2(A.be(18.88),A.eZ(B.bO,A.b([A.auQ(0,A.cu(x,new A.b6(x,x,x,x,x,new C.jD(D.PA,1.05,B.b6,x,0,A.b([B.uG,B.uC,B.aW],u),x,x),B.H),B.ac)),D.anS,D.anT,A.ib(x,A.cu(x,new A.b6(x,x,x,x,x,new A.eH(B.cm,B.cY,B.b6,A.b([B.h.af(0.42),B.h.af(0.16),B.h.af(0.04),B.v],u),D.ac6,x),B.H),B.ac),165,x,0,0,0,x),A.ib(x,A.d5(x,x,B.u,x,x,new A.b6(x,x,x,A.be(50),x,new C.jD(B.L,0.5,B.b6,x,0,A.b([B.h.af(0.72),B.h.af(0.22),B.v],u),D.yw,x),B.H),x,68,x,x,x,x,130),x,x,10,x,6,x),D.anQ,A.auQ(0,A.cu(x,new A.b6(x,x,x,x,x,new A.eH(D.PC,D.PB,B.b6,A.b([B.h.af(0.22),B.v,B.v,B.p.af(0.35)],u),D.a8x,x),B.H),B.ac)),A.ib(0,A.cu(x,new A.b6(x,x,x,x,x,new A.eH(B.cm,B.cY,B.b6,A.b([B.v,B.p.af(0.45)],u),x,x),B.H),B.ac),90,x,0,0,x,x),new A.Z(B.vD,this.c,x)],y.p),B.t,B.ca,x),B.bs),B.u,x,x,new A.b6(x,x,x,w,v,B.wY,B.H),x,x,x,D.Xs,x,x,x)}}
C.a4K.prototype={
A(d){var x=null
return new A.es(!0,A.hg(x,x,x,new C.a4L(x),B.jY),x)}}
C.a6h.prototype={
A(d){var x=null
return new A.es(!0,A.hg(x,x,x,new C.a6i(x),B.jY),x)}}
C.a8g.prototype={
A(d){var x=null
return new A.es(!0,A.hg(x,x,x,new C.abY(x),B.jY),x)}}
C.a4L.prototype={
b3(d,e){var x,w,v=new A.f(e.a*0.5,e.b*0.42),u=e.geR()*0.55
for(x=8;x<u;x+=5.5){$.a3()
w=new A.ji(B.co,B.c7,B.dV,B.em,B.cP)
w.b=B.bL
w.c=0.9
w.r=B.h.af(0.028+B.e.ac(x,22)*0.001).gq()
d.m4(v,x,w)}},
eS(d){return!1}}
C.a6i.prototype={
b3(d,e){var x,w,v,u=null,t=new A.ch($.a3().r,B.ag,u,u,A.b([],y.v)),s=e.b
t.aM(new A.eW(0,s*0.08))
x=e.a
t.aM(new A.cC(x*0.42,0))
t.aM(new A.cC(0,0))
t.aM(new A.tB())
w=A.b8()
w.sr2(new A.eH(B.bh,B.dD,B.b6,A.b([B.h.af(0.55),B.h.af(0.08),B.v],y.O),u,u).te(new A.z(0,0,0+x*0.5,0+s*0.2)))
d.ic(t,w)
v=A.b8()
v.r=B.h.af(0.35).gq()
v.c=1.5
v.b=B.bL
d.ld(new A.f(4,4),new A.f(x*0.35,4),v)},
eS(d){return!1}}
C.abY.prototype={
b3(d,e){var x,w,v,u=e.a,t=e.b,s=[new A.f(u*0.15,t*0.22),new A.f(u*0.82,t*0.18),new A.f(u*0.7,t*0.75)]
for(u=y.O,x=0;x<3;++x){w=s[x]
$.a3()
v=new A.ji(B.co,B.c7,B.dV,B.em,B.cP)
v.sr2(new C.jD(B.L,0.5,B.b6,null,0,A.b([B.h.af(0.12),B.v],u),null,null).te(A.ou(w,40)))
d.m4(w,40,v)}},
eS(d){return!1}}
var z=a.updateTypes(["M(M)"])
C.av1.prototype={
$1(d){var x=A.N(null,d,this.a)
x.toString
return x},
$S:71}
C.aAM.prototype={
$1(d){var x=A.N(null,d,this.a)
x.toString
return x},
$S:71}
C.ask.prototype={
$0(){return A.b4w()},
$S:0}
C.asl.prototype={
$0(){},
$S:0};(function installTearOffs(){var x=a._instance_1u
var w
x(w=C.HL.prototype,"gcf","bV",0)
x(w,"gbZ","bT",0)
x(w,"gci","bU",0)
x(w,"gcu","bS",0)})();(function inheritance(){var x=a.inheritMany,w=a.inherit
x(A.Ur,[C.alG,C.alN])
x(A.Fd,[C.jD,C.rc])
x(A.l4,[C.av1,C.aAM])
w(C.HL,A.HA)
w(C.UR,A.bd)
x(A.X,[C.uK,C.Yh,C.Yg,C.a4K,C.a6h,C.a8g])
x(A.l5,[C.ask,C.asl])
x(A.Ea,[C.a4L,C.a6i,C.abY])})()
A.wH(b.typeUniverse,JSON.parse('{"HL":{"E":[],"aU":["E"],"y":[],"ar":[]},"UR":{"bd":[],"az":[],"c":[]},"uK":{"X":[],"c":[]},"Yh":{"X":[],"c":[]},"Yg":{"X":[],"c":[]},"a4K":{"X":[],"c":[]},"a6h":{"X":[],"c":[]},"a8g":{"X":[],"c":[]},"a4L":{"aj":[]},"a6i":{"aj":[]},"abY":{"aj":[]}}'))
var y=(function rtii(){var x=A.ab
return{k:x("a1"),G:x("r"),V:x("A<bA>"),O:x("A<r>"),v:x("A<dR>"),s:x("A<m>"),p:x("A<c>"),n:x("A<M>"),H:x("f"),q:x("jD?"),c:x("rc?")}})();(function constants(){var x=a.makeConstList
D.Pz=new A.e6(-0.85,0.2)
D.PA=new A.e6(0.5,0.38)
D.PB=new A.e6(0.7,0.65)
D.PC=new A.e6(-1.1,-1)
D.PE=new A.e6(0.5,-0.35)
D.Py=new A.e6(0.55,0.95)
D.U3=new A.r(1,0.4196078431372549,0.3058823529411765,0.07058823529411765,B.i)
D.a7i=x([D.U3,B.iH,B.aW,B.p],y.O)
D.a4d=x([0,0.28,0.55,1],y.n)
D.ao1=new C.jD(D.Py,1.45,B.b6,null,0,D.a7i,D.a4d,null)
D.QD=new A.b6(null,null,null,null,null,D.ao1,B.H)
D.VA=new A.k8(D.QD,B.ac,null,null)
D.Xs=new A.W(5.2,5.2,5.2,5.2)
D.Z8=new A.aQ(983200,"MaterialIcons",!1)
D.yw=x([0,0.35,1],y.n)
D.a8x=x([0,0.32,0.68,1],y.n)
D.ac6=x([0,0.25,0.55,1],y.n)
D.ak8=new A.yW(0.55,null)
D.akb=new C.Yh(null)
D.akV=new A.f(0,10)
D.akY=new A.f(0,14)
D.alA=new A.f(-3,-4)
D.aEF=new C.a6h(null)
D.anQ=new A.jC(0,0,0,0,null,null,D.aEF,null)
D.aEs=new C.a4K(null)
D.anS=new A.jC(0,0,0,0,null,null,D.aEs,null)
D.ak9=new A.yW(1.1,null)
D.anT=new A.jC(0,0,0,0,null,null,D.ak9,null)
D.a8e=x([B.h,B.bD,B.a2,B.cD],y.O)
D.asJ=new C.rc(B.L,0,6.283185307179586,B.b6,D.a8e,null,null)
D.aF9=new C.a8g(null)})()};
(a=>{a["e6sxSJZfKh5diwMPV50pyqlIjeY="]=a.current})($__dart_deferred_initializers__);