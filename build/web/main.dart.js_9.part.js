((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,B,C={alw:function alw(d,e,f,g,h,i,j,k){var _=this
_.c=d
_.d=e
_.e=f
_.f=g
_.r=h
_.w=i
_.x=j
_.y=k
_.z=null
_.a=!1},alD:function alD(d,e,f,g,h,i,j){var _=this
_.c=d
_.d=e
_.e=f
_.f=g
_.r=h
_.w=i
_.x=j
_.y=null
_.a=!1},
b8r(d,e,f){var x,w,v,u,t,s,r
if(d==e)return d
if(d==null)return e.b1(f)
if(e==null)return d.b1(1-f)
x=A.b36(d.a,d.nK(),e.a,e.nK(),f)
w=A.lT(d.d,e.d,f)
w.toString
v=A.a4(d.e,e.e,f)
v.toString
v=Math.max(0,v)
u=f<0.5
t=u?d.f:e.f
s=A.lT(d.r,e.r,f)
r=A.a4(d.w,e.w,f)
r.toString
r=Math.max(0,r)
u=u?d.c:e.c
return new C.jB(w,v,t,s,r,x.a,x.b,u)},
b99(d,e,f){var x,w,v,u,t,s
if(d==e)return d
if(d==null)return e.b1(f)
if(e==null)return d.b1(1-f)
x=A.b36(d.a,d.nK(),e.a,e.nK(),f)
w=A.lT(d.d,e.d,f)
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
auR:function auR(d){this.a=d},
rb:function rb(d,e,f,g,h,i,j){var _=this
_.d=d
_.e=e
_.f=f
_.r=g
_.a=h
_.b=i
_.c=j},
aAB:function aAB(d){this.a=d},
HF:function HF(d,e,f,g,h,i,j){var _=this
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
UM:function UM(d,e,f,g){var _=this
_.e=d
_.f=e
_.c=f
_.a=g},
blz(){return new C.uI(null)},
uI:function uI(d){this.a=d},
as9:function as9(){},
asa:function asa(){},
bcY(d){var x=null,w=A.b([new A.bD(0,B.a4,B.h.af(0.5),B.k,6)],y.V)
return A.cU(x,A.ci(D.YS,B.h,x,d*0.72),B.r,x,x,new A.bb(x,x,x,x,w,D.asj,B.h3),x,d,x,x,x,x,d)},
Yc:function Yc(d){this.a=d},
Yb:function Yb(d,e){this.c=d
this.a=e},
a4F:function a4F(d){this.a=d},
a6c:function a6c(d){this.a=d},
a8a:function a8a(d){this.a=d},
a4G:function a4G(d){this.a=d},
a6d:function a6d(d){this.a=d},
abR:function abR(d){this.a=d}},D
J=c[1]
A=c[0]
B=c[2]
C=a.updateHolder(c[6],C)
D=c[15]
C.alw.prototype={
gSl(){var x,w,v,u,t,s,r,q,p,o,n=this,m=null,l=n.z
if(l==null){x=A.b2Z(n.e)
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
v=$.bx.cg().Shader
u=A.aeU(q,u)
q=A.b_F(w)
s=A.afg(s)
r=r!=null?A.aff(r):m
l.a=A.fi(v,"MakeRadialGradient",[u,t,x,q,s,r==null?m:r,0])
$.afw().jG(n,l,l)
n.z=l}else{$.a3()
v=l.a
l=l.b
p=new A.tv()
o=$.bx.cg().Shader
l=A.aeU(v,l)
u=A.aeU(q,u)
q=A.b_F(w)
s=A.afg(s)
v=r!=null?A.aff(r):m
if(v==null)v=m
p.a=A.fi(o,"MakeTwoPointConicalGradient",[l,n.y,u,t,x,q,s,v,0])
$.afw().jG(n,p,p)
n.z=p
l=p}}return l}}
C.alD.prototype={
gSl(){var x,w,v,u,t,s,r,q=this,p=q.y
if(p==null){x=A.b2Z(q.d)
w=new Float32Array(A.h7(q.e))
$.a3()
p=q.c
v=q.x
u=new A.tv()
t=$.bx.cg().Shader
s=A.b_F(w)
r=A.afg(q.f)
v=v!=null?A.aff(v):null
if(v==null)v=null
u.a=A.fi(t,"MakeSweepGradient",[p.a,p.b,x,s,r,v,0,q.r*180/3.141592653589793,q.w*180/3.141592653589793])
$.afw().jG(q,u,u)
q.y=u
p=u}return p}}
C.jB.prototype={
wc(d,e){var x,w,v=this,u=v.d.X(e).CL(d),t=d.geP(),s=v.a,r=v.nK()
v.Q4(d,e)
x=v.r
x=x==null?null:x.X(e).CL(d)
w=d.geP()
A.b3m(s,r)
return new C.alw(u,v.e*t,s,r,v.f,null,x,v.w*w)},
t6(d){return this.wc(d,null)},
b1(d){var x=this,w=x.a,v=A.a8(w).i("an<1,t>")
w=A.a2(new A.an(w,new C.auR(d),v),v.i("aE.E"))
return new C.jB(x.d,x.e,x.f,x.r,x.w,w,x.b,x.c)},
Ir(d){var x=this
return new C.jB(x.d,x.e,x.f,x.r,x.w,A.bK(x.a.length,d,!1,y.G),x.b,x.c)},
dT(d,e){if(y.q.b(d))return C.b8r(d,this,e)
return this.Mq(d,e)},
dU(d,e){if(y.q.b(d))return C.b8r(this,d,e)
return this.Mr(d,e)},
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
wc(d,e){var x=this,w=x.d.X(e).CL(d),v=x.a,u=x.nK()
x.Q4(d,e)
A.b3m(v,u)
return new C.alD(w,v,u,x.r,x.e,x.f,null)},
b1(d){var x=this,w=x.a,v=A.a8(w).i("an<1,t>")
w=A.a2(new A.an(w,new C.aAB(d),v),v.i("aE.E"))
return new C.rb(x.d,x.e,x.f,x.r,w,x.b,x.c)},
Ir(d){var x=this
return new C.rb(x.d,x.e,x.f,x.r,A.bK(x.a.length,d,!1,y.G),x.b,x.c)},
dT(d,e){if(y.c.b(d))return C.b99(d,this,e)
return this.Mq(d,e)},
dU(d,e){if(y.c.b(d))return C.b99(this,d,e)
return this.Mr(d,e)},
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
C.HF.prototype={
sYr(d){if(this.cq===d)return
this.cq=d
this.aa()},
sVb(d){if(this.cY===d)return
this.cY=d
this.aa()},
zc(d){var x=d.b*this.cq,w=d.d*this.cY
return new A.a0(x,x,w,w)},
bV(d){var x,w,v=this,u=v.A$
if(u==null)x=v.a_p(d)
else{w=v.cY
x=u.am(B.b7,d*w,u.gce())}u=v.cq
return x/u},
bT(d){var x,w,v=this,u=v.A$
if(u==null)x=v.a_n(d)
else{w=v.cY
x=u.am(B.aL,d*w,u.gbZ())}u=v.cq
return x/u},
bU(d){var x,w,v=this,u=v.A$
if(u==null)x=v.a_o(d)
else{w=v.cq
x=u.am(B.bg,d*w,u.gci())}u=v.cY
return x/u},
bS(d){var x,w,v=this,u=v.A$
if(u==null)x=v.a_m(d)
else{w=v.cq
x=u.am(B.bM,d*w,u.gct())}u=v.cY
return x/u},
dd(d){var x=this.A$
if(x!=null)return d.bJ(x.am(B.a1,this.zc(d),x.gcF()))
return d.bJ(this.zc(d).bJ(B.Z))},
dS(d,e){var x,w,v,u,t=this,s=t.A$
if(s==null)return null
x=t.zc(d)
w=s.eN(x,e)
if(w==null)return null
v=s.am(B.a1,x,s.gcF())
u=t.am(B.a1,d,t.gcF())
return w+t.gCu().jF(y.H.a(u.a9(0,v))).b},
c5(){var x=this,w=x.A$,v=y.k
if(w!=null){w.cT(x.zc(v.a(A.r.prototype.ga0.call(x))),!0)
x.fy=v.a(A.r.prototype.ga0.call(x)).bJ(x.A$.gt())
x.Ab()}else x.fy=v.a(A.r.prototype.ga0.call(x)).bJ(x.zc(v.a(A.r.prototype.ga0.call(x))).bJ(B.Z))}}
C.UM.prototype={
ba(d){var x=new C.HF(this.e,this.f,B.J,A.dm(d),null,new A.aW(),A.am())
x.b8()
x.sbF(null)
return x},
be(d,e){e.sfV(B.J)
e.sYr(this.e)
e.sVb(this.f)
e.sck(A.dm(d))}}
C.uI.prototype={
B(d){var x=null,w=A.b([new A.bD(4,B.a4,B.bC.af(0.55),B.k,42),new A.bD(0,B.a4,B.h.af(0.2),D.ald,18),new A.bD(0,B.a4,B.p.af(0.7),D.akB,28)],y.V),v=y.p
return A.fN(x,B.aV,A.eZ(B.bN,A.b([D.ajP,A.hL(!0,A.cy(A.et(new A.ch(B.o8,A.ag(A.b([A.cy(A.cU(x,A.nW("imagens/brasao_perfectgestdev.png",B.J,x,x,x,B.c3,B.dh,x,240),B.r,x,x,new A.bb(x,x,x,x,w,x,B.G),x,x,x,x,x,x,x),x,x),B.t,A.k("Refer\xeancia (render 3D)",x,x,x,x,A.bl().$2$color$fontSize(B.cC,11),x,x,x),B.dw,new C.Yb(A.ag(A.b([A.bv(A.b([A.c2(A.ag(A.b([A.aZF("Perfect Gest Dev",30,4),A.bv(A.b([A.bcW("DEV",22,3.5),B.fJ,C.bcY(24)],v),B.e2,x,B.j,B.l,0)],v),B.F,B.j,B.l),1),A.e_(!1,x,x,x,A.ci(B.pQ,B.h.af(0.95),x,x),x,x,new C.as9(),x,x,x,"Voltar ao site")],v),B.z,x,B.j,B.l,0),B.a9,A.k("Amostra v3 \u2014 UI com o mesmo brilho",x,x,x,x,A.bl().$4$color$fontSize$letterSpacing$shadows(B.bD,12,0.5,A.aZJ(1)),x,x,x),B.bK,A.bv(A.b([A.aZF("PLAY",20,3),B.d8,C.bcY(20),B.jX,A.c2(A.aZF("Codificando o Amanh\xe3",20,3),1)],v),B.z,x,B.j,B.l,0),B.M,A.k("Cromado com bandas de luz, cobre polido, ouro ambiente e verniz \u2014 mais perto da vividez do badge acima.",x,x,x,x,A.bl().$5$color$fontSize$fontWeight$height$shadows(B.bD.af(0.95),14,B.aM,1.55,A.aZJ(1.2)),x,x,x),B.eT,A.bcX(x,"Bot\xe3o cromado envernizado",new C.asa()),B.bs,A.k("Teste local (8080). Aprovar antes de aplicar ao site completo.",x,x,x,x,A.bl().$3$color$fontSize$fontStyle(B.cC,11,B.dK),x,x,x)],v),B.R,B.j,B.l),x)],v),B.z,B.j,B.l),x),x,B.vv,B.a7),x,x),!1,B.ad,!0)],v),B.u,B.k0,x),x,x,x,x)}}
C.Yc.prototype={
B(d){var x=null,w=y.O
return A.eZ(B.bN,A.b([D.Vo,A.cA(x,new A.bb(x,x,x,x,x,new C.jB(D.Pu,0.95,B.b4,x,0,A.b([B.bC.af(0.42),B.a2.af(0.18),B.v],w),D.yq,x),B.G),B.ag),A.cA(x,new A.bb(x,x,x,x,x,new C.jB(D.Pp,0.7,B.b4,x,0,A.b([B.h.af(0.06),B.v],w),x,x),B.G),B.ag),new A.cs(B.cV,x,x,new C.UM(1,0.38,A.cA(x,new A.bb(x,x,x,x,x,new A.eH(B.cn,B.cV,B.b4,A.b([B.v,B.bC.af(0.12),B.p.af(0.75)],w),B.AJ,x),B.G),B.ag),x),x),D.ajM,D.aED],y.p),B.u,B.k0,x)}}
C.Yb.prototype={
B(d){var x=null,w=A.bf(22),v=A.b([new A.bD(2,B.a4,B.bC.af(0.5),B.I9,48),new A.bD(0,B.a4,B.a2.af(0.35),B.mM,28),new A.bD(0,B.a4,B.p.af(0.85),D.aky,24)],y.V),u=y.O
return A.cU(x,A.l_(A.bf(18.88),A.eZ(B.bN,A.b([A.auF(0,A.cA(x,new A.bb(x,x,x,x,x,new C.jB(D.Pq,1.05,B.b4,x,0,A.b([D.U6,B.ux,B.aV],u),x,x),B.G),B.ag)),D.anu,D.anv,A.i7(x,A.cA(x,new A.bb(x,x,x,x,x,new A.eH(B.cn,B.cV,B.b4,A.b([B.h.af(0.42),B.h.af(0.16),B.h.af(0.04),B.v],u),D.abL,x),B.G),B.ag),165,x,0,0,0,x),A.i7(x,A.cU(x,x,B.r,x,x,new A.bb(x,x,x,A.bf(50),x,new C.jB(B.J,0.5,B.b4,x,0,A.b([B.h.af(0.72),B.h.af(0.22),B.v],u),D.yq,x),B.G),x,68,x,x,x,x,130),x,x,10,x,6,x),D.ans,A.auF(0,A.cA(x,new A.bb(x,x,x,x,x,new A.eH(D.Ps,D.Pr,B.b4,A.b([B.h.af(0.22),B.v,B.v,B.p.af(0.35)],u),D.a8b,x),B.G),B.ag)),A.i7(0,A.cA(x,new A.bb(x,x,x,x,x,new A.eH(B.cn,B.cV,B.b4,A.b([B.v,B.p.af(0.45)],u),x,x),B.G),B.ag),90,x,0,0,x,x),new A.a1(B.vy,this.c,x)],y.p),B.u,B.c9,x),B.br),B.r,x,x,new A.bb(x,x,x,w,v,B.wS,B.G),x,x,x,D.Xd,x,x,x)}}
C.a4F.prototype={
B(d){var x=null
return new A.er(!0,A.hg(x,x,x,new C.a4G(x),B.jW),x)}}
C.a6c.prototype={
B(d){var x=null
return new A.er(!0,A.hg(x,x,x,new C.a6d(x),B.jW),x)}}
C.a8a.prototype={
B(d){var x=null
return new A.er(!0,A.hg(x,x,x,new C.abR(x),B.jW),x)}}
C.a4G.prototype={
b3(d,e){var x,w,v=new A.f(e.a*0.5,e.b*0.42),u=e.geP()*0.55
for(x=8;x<u;x+=5.5){$.a3()
w=new A.jf(B.cp,B.c6,B.dT,B.ej,B.cM)
w.b=B.bJ
w.c=0.9
w.r=B.h.af(0.028+B.e.ac(x,22)*0.001).gq()
d.m2(v,x,w)}},
eQ(d){return!1}}
C.a6d.prototype={
b3(d,e){var x,w,v,u=null,t=new A.cg($.a3().r,B.ae,u,u,A.b([],y.v)),s=e.b
t.aM(new A.eW(0,s*0.08))
x=e.a
t.aM(new A.cC(x*0.42,0))
t.aM(new A.cC(0,0))
t.aM(new A.tz())
w=A.b6()
w.sqT(new A.eH(B.bA,B.dB,B.b4,A.b([B.h.af(0.55),B.h.af(0.08),B.v],y.O),u,u).t6(new A.u(0,0,0+x*0.5,0+s*0.2)))
d.ib(t,w)
v=A.b6()
v.r=B.h.af(0.35).gq()
v.c=1.5
v.b=B.bJ
d.lc(new A.f(4,4),new A.f(x*0.35,4),v)},
eQ(d){return!1}}
C.abR.prototype={
b3(d,e){var x,w,v,u=e.a,t=e.b,s=[new A.f(u*0.15,t*0.22),new A.f(u*0.82,t*0.18),new A.f(u*0.7,t*0.75)]
for(u=y.O,x=0;x<3;++x){w=s[x]
$.a3()
v=new A.jf(B.cp,B.c6,B.dT,B.ej,B.cM)
v.sqT(new C.jB(B.J,0.5,B.b4,null,0,A.b([B.h.af(0.12),B.v],u),null,null).t6(A.oq(w,40)))
d.m2(w,40,v)}},
eQ(d){return!1}}
var z=a.updateTypes(["M(M)"])
C.auR.prototype={
$1(d){var x=A.N(null,d,this.a)
x.toString
return x},
$S:71}
C.aAB.prototype={
$1(d){var x=A.N(null,d,this.a)
x.toString
return x},
$S:71}
C.as9.prototype={
$0(){return A.b3O()},
$S:0}
C.asa.prototype={
$0(){},
$S:0};(function installTearOffs(){var x=a._instance_1u
var w
x(w=C.HF.prototype,"gce","bV",0)
x(w,"gbZ","bT",0)
x(w,"gci","bU",0)
x(w,"gct","bS",0)})();(function inheritance(){var x=a.inheritMany,w=a.inherit
x(A.Ul,[C.alw,C.alD])
x(A.F7,[C.jB,C.rb])
x(A.l1,[C.auR,C.aAB])
w(C.HF,A.Hu)
w(C.UM,A.ba)
x(A.X,[C.uI,C.Yc,C.Yb,C.a4F,C.a6c,C.a8a])
x(A.l2,[C.as9,C.asa])
x(A.E5,[C.a4G,C.a6d,C.abR])})()
A.wF(b.typeUniverse,JSON.parse('{"HF":{"E":[],"aU":["E"],"r":[],"ar":[]},"UM":{"ba":[],"az":[],"c":[]},"uI":{"X":[],"c":[]},"Yc":{"X":[],"c":[]},"Yb":{"X":[],"c":[]},"a4F":{"X":[],"c":[]},"a6c":{"X":[],"c":[]},"a8a":{"X":[],"c":[]},"a4G":{"aj":[]},"a6d":{"aj":[]},"abR":{"aj":[]}}'))
var y=(function rtii(){var x=A.aa
return{k:x("a0"),G:x("t"),V:x("A<bD>"),O:x("A<t>"),v:x("A<dQ>"),s:x("A<m>"),p:x("A<c>"),n:x("A<M>"),H:x("f"),q:x("jB?"),c:x("rb?")}})();(function constants(){var x=a.makeConstList
D.Pp=new A.e5(-0.85,0.2)
D.Pq=new A.e5(0.5,0.38)
D.Pr=new A.e5(0.7,0.65)
D.Ps=new A.e5(-1.1,-1)
D.Pu=new A.e5(0.5,-0.35)
D.U6=new A.t(1,0.22745098039215686,0.22745098039215686,0.22745098039215686,B.i)
D.Po=new A.e5(0.55,0.95)
D.TT=new A.t(1,0.4196078431372549,0.3058823529411765,0.07058823529411765,B.i)
D.Tp=new A.t(1,0.10196078431372549,0.0784313725490196,0.03137254901960784,B.i)
D.a6Y=x([D.TT,D.Tp,B.aV,B.p],y.O)
D.a3U=x([0,0.28,0.55,1],y.n)
D.anE=new C.jB(D.Po,1.45,B.b4,null,0,D.a6Y,D.a3U,null)
D.Qt=new A.bb(null,null,null,null,null,D.anE,B.G)
D.Vo=new A.k6(D.Qt,B.ag,null,null)
D.Xd=new A.W(5.2,5.2,5.2,5.2)
D.YS=new A.aS(983200,"MaterialIcons",!1)
D.yq=x([0,0.35,1],y.n)
D.a8b=x([0,0.32,0.68,1],y.n)
D.abL=x([0,0.25,0.55,1],y.n)
D.ajM=new A.yS(0.55,null)
D.ajP=new C.Yc(null)
D.aky=new A.f(0,10)
D.akB=new A.f(0,14)
D.ald=new A.f(-3,-4)
D.aE9=new C.a6c(null)
D.ans=new A.jA(0,0,0,0,null,null,D.aE9,null)
D.aDX=new C.a4F(null)
D.anu=new A.jA(0,0,0,0,null,null,D.aDX,null)
D.ajN=new A.yS(1.1,null)
D.anv=new A.jA(0,0,0,0,null,null,D.ajN,null)
D.a7T=x([B.h,B.bC,B.a2,B.cC],y.O)
D.asj=new C.rb(B.J,0,6.283185307179586,B.b4,D.a7T,null,null)
D.aED=new C.a8a(null)})()};
(a=>{a["BYB4YiR99ozgoXi76+NOEZZD9+c="]=a.current})($__dart_deferred_initializers__);