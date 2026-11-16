((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,B,C={aly:function aly(d,e,f,g,h,i,j,k){var _=this
_.c=d
_.d=e
_.e=f
_.f=g
_.r=h
_.w=i
_.x=j
_.y=k
_.z=null
_.a=!1},alF:function alF(d,e,f,g,h,i,j){var _=this
_.c=d
_.d=e
_.e=f
_.f=g
_.r=h
_.w=i
_.x=j
_.y=null
_.a=!1},
b8B(d,e,f){var x,w,v,u,t,s,r
if(d==e)return d
if(d==null)return e.b1(f)
if(e==null)return d.b1(1-f)
x=A.b3g(d.a,d.nL(),e.a,e.nL(),f)
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
return new C.jB(w,v,t,s,r,x.a,x.b,u)},
b9j(d,e,f){var x,w,v,u,t,s
if(d==e)return d
if(d==null)return e.b1(f)
if(e==null)return d.b1(1-f)
x=A.b3g(d.a,d.nL(),e.a,e.nL(),f)
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
return new C.rb(w,v,u,s,x.a,x.b,t)},
jB:function jB(d,e,f,g,h,i,j,k){var _=this
_.d=d
_.e=e
_.f=f
_.r=g
_.w=h
_.a=i
_.b=j
_.c=k},
auT:function auT(d){this.a=d},
rb:function rb(d,e,f,g,h,i,j){var _=this
_.d=d
_.e=e
_.f=f
_.r=g
_.a=h
_.b=i
_.c=j},
aAD:function aAD(d){this.a=d},
HG:function HG(d,e,f,g,h,i,j){var _=this
_.cq=d
_.cY=e
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
blK(){return new C.uI(null)},
uI:function uI(d){this.a=d},
asb:function asb(){},
asc:function asc(){},
bd8(d){var x=null,w=A.b([new A.bD(0,B.a4,B.h.af(0.5),B.k,6)],y.V)
return A.cU(x,A.cj(D.YU,B.h,x,d*0.72),B.r,x,x,new A.bb(x,x,x,x,w,D.asm,B.h5),x,d,x,x,x,x,d)},
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
C.aly.prototype={
gSn(){var x,w,v,u,t,s,r,q,p,o,n=this,m=null,l=n.z
if(l==null){x=A.b38(n.e)
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
l=new A.tv()
v=$.by.cg().Shader
u=A.aeW(q,u)
q=A.b_P(w)
s=A.afi(s)
r=r!=null?A.afh(r):m
l.a=A.fi(v,"MakeRadialGradient",[u,t,x,q,s,r==null?m:r,0])
$.afy().jH(n,l,l)
n.z=l}else{$.a3()
v=l.a
l=l.b
p=new A.tv()
o=$.by.cg().Shader
l=A.aeW(v,l)
u=A.aeW(q,u)
q=A.b_P(w)
s=A.afi(s)
v=r!=null?A.afh(r):m
if(v==null)v=m
p.a=A.fi(o,"MakeTwoPointConicalGradient",[l,n.y,u,t,x,q,s,v,0])
$.afy().jH(n,p,p)
n.z=p
l=p}}return l}}
C.alF.prototype={
gSn(){var x,w,v,u,t,s,r,q=this,p=q.y
if(p==null){x=A.b38(q.d)
w=new Float32Array(A.h7(q.e))
$.a3()
p=q.c
v=q.x
u=new A.tv()
t=$.by.cg().Shader
s=A.b_P(w)
r=A.afi(q.f)
v=v!=null?A.afh(v):null
if(v==null)v=null
u.a=A.fi(t,"MakeSweepGradient",[p.a,p.b,x,s,r,v,0,q.r*180/3.141592653589793,q.w*180/3.141592653589793])
$.afy().jH(q,u,u)
q.y=u
p=u}return p}}
C.jB.prototype={
we(d,e){var x,w,v=this,u=v.d.X(e).CN(d),t=d.geP(),s=v.a,r=v.nL()
v.Q6(d,e)
x=v.r
x=x==null?null:x.X(e).CN(d)
w=d.geP()
A.b3w(s,r)
return new C.aly(u,v.e*t,s,r,v.f,null,x,v.w*w)},
t7(d){return this.we(d,null)},
b1(d){var x=this,w=x.a,v=A.a8(w).i("an<1,t>")
w=A.a2(new A.an(w,new C.auT(d),v),v.i("aE.E"))
return new C.jB(x.d,x.e,x.f,x.r,x.w,w,x.b,x.c)},
It(d){var x=this
return new C.jB(x.d,x.e,x.f,x.r,x.w,A.bK(x.a.length,d,!1,y.G),x.b,x.c)},
dT(d,e){if(y.q.b(d))return C.b8B(d,this,e)
return this.Ms(d,e)},
dU(d,e){if(y.q.b(d))return C.b8B(this,d,e)
return this.Mt(d,e)},
j(d,e){var x=this
if(e==null)return!1
if(x===e)return!0
if(J.a_(e)!==A.K(x))return!1
return e instanceof C.jB&&e.d.j(0,x.d)&&e.e===x.e&&e.f===x.f&&A.cW(e.a,x.a)&&A.cW(e.b,x.b)&&J.e(e.r,x.r)&&e.w===x.w},
gD(d){var x=this,w=A.bU(x.a),v=x.b
v=v==null?null:A.bU(v)
return A.U(x.d,x.e,x.f,x.c,w,v,x.r,x.w,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
k(d){var x=this,w=A.b(["center: "+x.d.k(0),"radius: "+A.hV(x.e),"colors: "+A.i(x.a)],y.s),v=x.b
if(v!=null)w.push("stops: "+A.i(v))
w.push("tileMode: "+x.f.k(0))
v=x.r
if(v!=null)w.push("focal: "+v.k(0))
w.push("focalRadius: "+A.hV(x.w))
return"RadialGradient("+B.c.bX(w,", ")+")"}}
C.rb.prototype={
we(d,e){var x=this,w=x.d.X(e).CN(d),v=x.a,u=x.nL()
x.Q6(d,e)
A.b3w(v,u)
return new C.alF(w,v,u,x.r,x.e,x.f,null)},
b1(d){var x=this,w=x.a,v=A.a8(w).i("an<1,t>")
w=A.a2(new A.an(w,new C.aAD(d),v),v.i("aE.E"))
return new C.rb(x.d,x.e,x.f,x.r,w,x.b,x.c)},
It(d){var x=this
return new C.rb(x.d,x.e,x.f,x.r,A.bK(x.a.length,d,!1,y.G),x.b,x.c)},
dT(d,e){if(y.c.b(d))return C.b9j(d,this,e)
return this.Ms(d,e)},
dU(d,e){if(y.c.b(d))return C.b9j(this,d,e)
return this.Mt(d,e)},
j(d,e){var x=this
if(e==null)return!1
if(x===e)return!0
if(J.a_(e)!==A.K(x))return!1
return e instanceof C.rb&&e.d.j(0,x.d)&&e.e===x.e&&e.f===x.f&&e.r===x.r&&A.cW(e.a,x.a)&&A.cW(e.b,x.b)},
gD(d){var x=this,w=A.bU(x.a),v=x.b
v=v==null?null:A.bU(v)
return A.U(x.d,x.e,x.f,x.r,x.c,w,v,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
k(d){var x=this,w=A.b(["center: "+x.d.k(0),"startAngle: "+A.hV(x.e),"endAngle: "+A.hV(x.f),"colors: "+A.i(x.a)],y.s),v=x.b
if(v!=null)w.push("stops: "+A.i(v))
w.push("tileMode: "+x.r.k(0))
return"SweepGradient("+B.c.bX(w,", ")+")"}}
C.HG.prototype={
sYu(d){if(this.cq===d)return
this.cq=d
this.aa()},
sVe(d){if(this.cY===d)return
this.cY=d
this.aa()},
zd(d){var x=d.b*this.cq,w=d.d*this.cY
return new A.a0(x,x,w,w)},
bV(d){var x,w,v=this,u=v.A$
if(u==null)x=v.a_s(d)
else{w=v.cY
x=u.am(B.b8,d*w,u.gcf())}u=v.cq
return x/u},
bT(d){var x,w,v=this,u=v.A$
if(u==null)x=v.a_q(d)
else{w=v.cY
x=u.am(B.aL,d*w,u.gbZ())}u=v.cq
return x/u},
bU(d){var x,w,v=this,u=v.A$
if(u==null)x=v.a_r(d)
else{w=v.cq
x=u.am(B.bg,d*w,u.gci())}u=v.cY
return x/u},
bS(d){var x,w,v=this,u=v.A$
if(u==null)x=v.a_p(d)
else{w=v.cq
x=u.am(B.bM,d*w,u.gct())}u=v.cY
return x/u},
dd(d){var x=this.A$
if(x!=null)return d.bJ(x.am(B.a1,this.zd(d),x.gcG()))
return d.bJ(this.zd(d).bJ(B.Z))},
dS(d,e){var x,w,v,u,t=this,s=t.A$
if(s==null)return null
x=t.zd(d)
w=s.eN(x,e)
if(w==null)return null
v=s.am(B.a1,x,s.gcG())
u=t.am(B.a1,d,t.gcG())
return w+t.gCw().jG(y.H.a(u.a9(0,v))).b},
c5(){var x=this,w=x.A$,v=y.k
if(w!=null){w.cT(x.zd(v.a(A.r.prototype.ga0.call(x))),!0)
x.fy=v.a(A.r.prototype.ga0.call(x)).bJ(x.A$.gt())
x.Ac()}else x.fy=v.a(A.r.prototype.ga0.call(x)).bJ(x.zd(v.a(A.r.prototype.ga0.call(x))).bJ(B.Z))}}
C.UO.prototype={
ba(d){var x=new C.HG(this.e,this.f,B.J,A.dm(d),null,new A.aX(),A.am())
x.b8()
x.sbF(null)
return x},
be(d,e){e.sfV(B.J)
e.sYu(this.e)
e.sVe(this.f)
e.sck(A.dm(d))}}
C.uI.prototype={
B(d){var x=null,w=A.b([new A.bD(4,B.a4,B.bC.af(0.55),B.k,42),new A.bD(0,B.a4,B.h.af(0.2),D.alf,18),new A.bD(0,B.a4,B.p.af(0.7),D.akD,28)],y.V),v=y.p
return A.fN(x,B.aV,A.eZ(B.bN,A.b([D.ajR,A.hL(!0,A.cy(A.et(new A.ci(B.o8,A.ag(A.b([A.cy(A.cU(x,A.o_("imagens/brasao_perfectgestdev.png",B.J,x,x,x,B.c4,B.dh,x,240),B.r,x,x,new A.bb(x,x,x,x,w,x,B.H),x,x,x,x,x,x,x),x,x),B.u,A.j("Refer\xeancia (render 3D)",x,x,x,x,A.bn().$2$color$fontSize(B.cC,11),x,x,x),B.dw,new C.Yd(A.ag(A.b([A.bw(A.b([A.c2(A.ag(A.b([A.aZP("Perfect Gest Dev",30,4),A.bw(A.b([A.bd6("DEV",22,3.5),B.fK,C.bd8(24)],v),B.e3,x,B.j,B.l,0)],v),B.G,B.j,B.l),1),A.e_(!1,x,x,x,A.cj(B.pQ,B.h.af(0.95),x,x),x,x,new C.asb(),x,x,x,"Voltar ao site")],v),B.z,x,B.j,B.l,0),B.aa,A.j("Amostra v3 \u2014 UI com o mesmo brilho",x,x,x,x,A.bn().$4$color$fontSize$letterSpacing$shadows(B.bD,12,0.5,A.aZT(1)),x,x,x),B.bK,A.bw(A.b([A.aZP("PLAY",20,3),B.d8,C.bd8(20),B.jZ,A.c2(A.aZP("Codificando o Amanh\xe3",20,3),1)],v),B.z,x,B.j,B.l,0),B.M,A.j("Cromado com bandas de luz, cobre polido, ouro ambiente e verniz \u2014 mais perto da vividez do badge acima.",x,x,x,x,A.bn().$5$color$fontSize$fontWeight$height$shadows(B.bD.af(0.95),14,B.aM,1.55,A.aZT(1.2)),x,x,x),B.eT,A.bd7(x,"Bot\xe3o cromado envernizado",new C.asc()),B.bs,A.j("Teste local (8080). Aprovar antes de aplicar ao site completo.",x,x,x,x,A.bn().$3$color$fontSize$fontStyle(B.cC,11,B.dL),x,x,x)],v),B.S,B.j,B.l),x)],v),B.z,B.j,B.l),x),x,B.vw,B.a8),x,x),!1,B.ad,!0)],v),B.t,B.k2,x),x,x,x,x)}}
C.Ye.prototype={
B(d){var x=null,w=y.O
return A.eZ(B.bN,A.b([D.Vq,A.cA(x,new A.bb(x,x,x,x,x,new C.jB(D.Pw,0.95,B.b5,x,0,A.b([B.bC.af(0.42),B.a2.af(0.18),B.v],w),D.yr,x),B.H),B.ah),A.cA(x,new A.bb(x,x,x,x,x,new C.jB(D.Pr,0.7,B.b5,x,0,A.b([B.h.af(0.06),B.v],w),x,x),B.H),B.ah),new A.ct(B.cV,x,x,new C.UO(1,0.38,A.cA(x,new A.bb(x,x,x,x,x,new A.eH(B.cn,B.cV,B.b5,A.b([B.v,B.bC.af(0.12),B.p.af(0.75)],w),B.AL,x),B.H),B.ah),x),x),D.ajO,D.aEG],y.p),B.t,B.k2,x)}}
C.Yd.prototype={
B(d){var x=null,w=A.bg(22),v=A.b([new A.bD(2,B.a4,B.bC.af(0.5),B.Ib,48),new A.bD(0,B.a4,B.a2.af(0.35),B.mM,28),new A.bD(0,B.a4,B.p.af(0.85),D.akA,24)],y.V),u=y.O
return A.cU(x,A.l0(A.bg(18.88),A.eZ(B.bN,A.b([A.auH(0,A.cA(x,new A.bb(x,x,x,x,x,new C.jB(D.Ps,1.05,B.b5,x,0,A.b([D.U8,B.uy,B.aV],u),x,x),B.H),B.ah)),D.anw,D.anx,A.i8(x,A.cA(x,new A.bb(x,x,x,x,x,new A.eH(B.cn,B.cV,B.b5,A.b([B.h.af(0.42),B.h.af(0.16),B.h.af(0.04),B.v],u),D.abN,x),B.H),B.ah),165,x,0,0,0,x),A.i8(x,A.cU(x,x,B.r,x,x,new A.bb(x,x,x,A.bg(50),x,new C.jB(B.J,0.5,B.b5,x,0,A.b([B.h.af(0.72),B.h.af(0.22),B.v],u),D.yr,x),B.H),x,68,x,x,x,x,130),x,x,10,x,6,x),D.anu,A.auH(0,A.cA(x,new A.bb(x,x,x,x,x,new A.eH(D.Pu,D.Pt,B.b5,A.b([B.h.af(0.22),B.v,B.v,B.p.af(0.35)],u),D.a8d,x),B.H),B.ah)),A.i8(0,A.cA(x,new A.bb(x,x,x,x,x,new A.eH(B.cn,B.cV,B.b5,A.b([B.v,B.p.af(0.45)],u),x,x),B.H),B.ah),90,x,0,0,x,x),new A.a1(B.vz,this.c,x)],y.p),B.t,B.ca,x),B.br),B.r,x,x,new A.bb(x,x,x,w,v,B.wT,B.H),x,x,x,D.Xf,x,x,x)}}
C.a4H.prototype={
B(d){var x=null
return new A.er(!0,A.hg(x,x,x,new C.a4I(x),B.jY),x)}}
C.a6e.prototype={
B(d){var x=null
return new A.er(!0,A.hg(x,x,x,new C.a6f(x),B.jY),x)}}
C.a8c.prototype={
B(d){var x=null
return new A.er(!0,A.hg(x,x,x,new C.abT(x),B.jY),x)}}
C.a4I.prototype={
b3(d,e){var x,w,v=new A.f(e.a*0.5,e.b*0.42),u=e.geP()*0.55
for(x=8;x<u;x+=5.5){$.a3()
w=new A.jf(B.cp,B.c7,B.dU,B.ej,B.cM)
w.b=B.bJ
w.c=0.9
w.r=B.h.af(0.028+B.e.ac(x,22)*0.001).gq()
d.m2(v,x,w)}},
eQ(d){return!1}}
C.a6f.prototype={
b3(d,e){var x,w,v,u=null,t=new A.ch($.a3().r,B.ae,u,u,A.b([],y.v)),s=e.b
t.aM(new A.eW(0,s*0.08))
x=e.a
t.aM(new A.cC(x*0.42,0))
t.aM(new A.cC(0,0))
t.aM(new A.tz())
w=A.b6()
w.sqU(new A.eH(B.bA,B.dB,B.b5,A.b([B.h.af(0.55),B.h.af(0.08),B.v],y.O),u,u).t7(new A.v(0,0,0+x*0.5,0+s*0.2)))
d.ic(t,w)
v=A.b6()
v.r=B.h.af(0.35).gq()
v.c=1.5
v.b=B.bJ
d.lc(new A.f(4,4),new A.f(x*0.35,4),v)},
eQ(d){return!1}}
C.abT.prototype={
b3(d,e){var x,w,v,u=e.a,t=e.b,s=[new A.f(u*0.15,t*0.22),new A.f(u*0.82,t*0.18),new A.f(u*0.7,t*0.75)]
for(u=y.O,x=0;x<3;++x){w=s[x]
$.a3()
v=new A.jf(B.cp,B.c7,B.dU,B.ej,B.cM)
v.sqU(new C.jB(B.J,0.5,B.b5,null,0,A.b([B.h.af(0.12),B.v],u),null,null).t7(A.ou(w,40)))
d.m2(w,40,v)}},
eQ(d){return!1}}
var z=a.updateTypes(["M(M)"])
C.auT.prototype={
$1(d){var x=A.N(null,d,this.a)
x.toString
return x},
$S:71}
C.aAD.prototype={
$1(d){var x=A.N(null,d,this.a)
x.toString
return x},
$S:71}
C.asb.prototype={
$0(){return A.b3Y()},
$S:0}
C.asc.prototype={
$0(){},
$S:0};(function installTearOffs(){var x=a._instance_1u
var w
x(w=C.HG.prototype,"gcf","bV",0)
x(w,"gbZ","bT",0)
x(w,"gci","bU",0)
x(w,"gct","bS",0)})();(function inheritance(){var x=a.inheritMany,w=a.inherit
x(A.Un,[C.aly,C.alF])
x(A.F8,[C.jB,C.rb])
x(A.l2,[C.auT,C.aAD])
w(C.HG,A.Hv)
w(C.UO,A.ba)
x(A.X,[C.uI,C.Ye,C.Yd,C.a4H,C.a6e,C.a8c])
x(A.l3,[C.asb,C.asc])
x(A.E6,[C.a4I,C.a6f,C.abT])})()
A.wF(b.typeUniverse,JSON.parse('{"HG":{"E":[],"aU":["E"],"r":[],"ar":[]},"UO":{"ba":[],"az":[],"c":[]},"uI":{"X":[],"c":[]},"Ye":{"X":[],"c":[]},"Yd":{"X":[],"c":[]},"a4H":{"X":[],"c":[]},"a6e":{"X":[],"c":[]},"a8c":{"X":[],"c":[]},"a4I":{"aj":[]},"a6f":{"aj":[]},"abT":{"aj":[]}}'))
var y=(function rtii(){var x=A.aa
return{k:x("a0"),G:x("t"),V:x("A<bD>"),O:x("A<t>"),v:x("A<dQ>"),s:x("A<m>"),p:x("A<c>"),n:x("A<M>"),H:x("f"),q:x("jB?"),c:x("rb?")}})();(function constants(){var x=a.makeConstList
D.Pr=new A.e5(-0.85,0.2)
D.Ps=new A.e5(0.5,0.38)
D.Pt=new A.e5(0.7,0.65)
D.Pu=new A.e5(-1.1,-1)
D.Pw=new A.e5(0.5,-0.35)
D.U8=new A.t(1,0.22745098039215686,0.22745098039215686,0.22745098039215686,B.i)
D.Pq=new A.e5(0.55,0.95)
D.TV=new A.t(1,0.4196078431372549,0.3058823529411765,0.07058823529411765,B.i)
D.Tr=new A.t(1,0.10196078431372549,0.0784313725490196,0.03137254901960784,B.i)
D.a7_=x([D.TV,D.Tr,B.aV,B.p],y.O)
D.a3W=x([0,0.28,0.55,1],y.n)
D.anG=new C.jB(D.Pq,1.45,B.b5,null,0,D.a7_,D.a3W,null)
D.Qv=new A.bb(null,null,null,null,null,D.anG,B.H)
D.Vq=new A.k8(D.Qv,B.ah,null,null)
D.Xf=new A.W(5.2,5.2,5.2,5.2)
D.YU=new A.aS(983200,"MaterialIcons",!1)
D.yr=x([0,0.35,1],y.n)
D.a8d=x([0,0.32,0.68,1],y.n)
D.abN=x([0,0.25,0.55,1],y.n)
D.ajO=new A.yS(0.55,null)
D.ajR=new C.Ye(null)
D.akA=new A.f(0,10)
D.akD=new A.f(0,14)
D.alf=new A.f(-3,-4)
D.aEc=new C.a6e(null)
D.anu=new A.jA(0,0,0,0,null,null,D.aEc,null)
D.aE_=new C.a4H(null)
D.anw=new A.jA(0,0,0,0,null,null,D.aE_,null)
D.ajP=new A.yS(1.1,null)
D.anx=new A.jA(0,0,0,0,null,null,D.ajP,null)
D.a7V=x([B.h,B.bC,B.a2,B.cC],y.O)
D.asm=new C.rb(B.J,0,6.283185307179586,B.b5,D.a7V,null,null)
D.aEG=new C.a8c(null)})()};
(a=>{a["xPQUypTb7Lp+GXxba1srLTHhnpc="]=a.current})($__dart_deferred_initializers__);