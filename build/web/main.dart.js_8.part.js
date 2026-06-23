((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,B,C={
aNJ(d,e,f){var x,w,v,u,t,s
if(d==e)return d
if(d==null)return e.aO(f)
if(e==null)return d.aO(1-f)
x=A.aIf(d.a,d.lH(),e.a,e.lH(),f)
w=A.l8(d.d,e.d,f)
w.toString
v=A.X(d.e,e.e,f)
v.toString
v=Math.max(0,v)
u=A.X(d.f,e.f,f)
u.toString
u=Math.max(0,u)
t=f<0.5
s=t?d.r:e.r
t=t?d.c:e.c
return new C.rs(w,v,u,s,x.a,x.b,t)},
rs:function rs(d,e,f,g,h,i,j){var _=this
_.d=d
_.e=e
_.f=f
_.r=g
_.a=h
_.b=i
_.c=j},
apc:function apc(d){this.a=d},
aYq(){return new C.qm(null)},
qm:function qm(d){this.a=d},
ahW:function ahW(){},
ahX:function ahX(){},
aRb(d){var x=null,w=A.b([new A.cr(0,B.b0,B.h.ak(0.5),B.f,6)],y.c)
return A.fj(A.cI(D.Qj,B.h,x,d*0.72),B.z,new A.bP(x,x,x,x,w,D.adi,B.i9),d,x,x,d)}},D
J=c[1]
A=c[0]
B=c[2]
C=a.updateHolder(c[6],C)
D=c[13]
C.rs.prototype={
rq(d,e){var x=this,w=x.d.X(e).xl(d),v=x.a,u=x.lH(),t=x.I3(d,e)
$.a0()
t=t!=null?A.mD(t):null
t=new A.Lc(w,v,u,x.r,x.e,x.f,t)
t.yf()
if(v.length!==u.length)A.a1(A.bF('"colors" and "colorStops" arguments must have equal length.',null))
return t},
aO(d){var x=this,w=x.a,v=A.a8(w).i("ag<1,r>")
w=A.ac(new A.ag(w,new C.apc(d),v),v.i("aw.E"))
return new C.rs(x.d,x.e,x.f,x.r,w,x.b,x.c)},
d_(d,e){if(y.j.b(d))return C.aNJ(d,this,e)
return this.F3(d,e)},
d0(d,e){if(y.j.b(d))return C.aNJ(this,d,e)
return this.F4(d,e)},
j(d,e){var x=this
if(e==null)return!1
if(x===e)return!0
if(J.T(e)!==A.p(x))return!1
return e instanceof C.rs&&e.d.j(0,x.d)&&e.e===x.e&&e.f===x.f&&e.r===x.r&&J.d(e.c,x.c)&&A.cg(e.a,x.a)&&A.cg(e.b,x.b)},
gB(d){var x=this,w=A.bq(x.a),v=x.b
v=v==null?null:A.bq(v)
return A.M(x.d,x.e,x.f,x.r,x.c,w,v,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
k(d){var x=this,w=A.b(["center: "+x.d.k(0),"startAngle: "+A.ff(x.e),"endAngle: "+A.ff(x.f),"colors: "+A.j(x.a)],y.h),v=x.b
if(v!=null)w.push("stops: "+A.j(v))
w.push("tileMode: "+x.r.k(0))
v=x.c
if(v!=null)w.push("transform: "+v.k(0))
return"SweepGradient("+B.b.bH(w,", ")+")"}}
C.qm.prototype={
G(d){var x=null,w=A.b([new A.cr(4,B.b0,B.cp.ak(0.55),B.f,42),new A.cr(0,B.b0,B.h.ak(0.2),D.a8S,18),new A.cr(0,B.b0,B.m.ak(0.7),D.a8h,28)],y.c),v=y.e
return A.kE(x,B.cN,A.fw(B.bD,A.b([B.nf,A.kD(!0,A.dW(A.iD(new A.dn(D.Kc,A.bZ(A.b([A.dW(A.fj(A.aLD("imagens/logo_play_dev_ref.png",B.T,x,x,x,B.eM,B.p8,x,240),B.z,new A.bP(x,x,x,x,w,x,B.U),x,x,x,x),x,x),B.bO,A.Z("Refer\xeancia (render 3D)",x,x,x,A.b2().$2$color$fontSize(B.io,11),x,x),B.kH,new A.Bw(A.bZ(A.b([A.ez(A.b([A.fK(A.bZ(A.b([A.a6t("Perfect Gest Dev",30,4),A.ez(A.b([A.aR9("DEV",22,3.5),D.acT,C.aRb(24)],v),B.eA,B.y,B.D,0)],v),B.V,B.y,B.D),1),A.eK(!1,x,x,x,A.cI(B.r6,B.h.ak(0.95),x,x),x,x,new C.ahW(),x,x,x,"Voltar ao site")],v),B.au,B.y,B.D,0),B.eg,A.Z("Amostra v3 \u2014 UI com o mesmo brilho",x,x,x,A.b2().$4$color$fontSize$letterSpacing$shadows(B.cM,12,0.5,A.aFa(1)),x,x),B.d_,A.ez(A.b([A.a6t("PLAY",20,3),B.o6,C.aRb(20),B.o5,A.fK(A.a6t("Codificando o Amanh\xe3",20,3),1)],v),B.au,B.y,B.D,0),B.cA,A.Z("Cromado com bandas de luz, cobre polido, ouro ambiente e verniz \u2014 mais perto da vividez do badge acima.",x,x,x,A.b2().$5$color$fontSize$fontWeight$height$shadows(B.cM.ak(0.95),14,B.a9,1.55,A.aFa(1.2)),x,x),B.hI,A.aRa("Bot\xe3o cromado envernizado",new C.ahX()),B.cZ,A.Z("Teste local (8080). Aprovar antes de aplicar ao site completo.",x,x,x,A.b2().$3$color$fontSize$fontStyle(B.io,11,B.cq),x,x)],v),B.bq,B.y,B.D),22,B.Pg,x)],v),B.au,B.y,B.D),x),x,D.Pa,B.af),x,x),!1,B.aA,!0)],v),B.a_,B.oa),x)}}
var z=a.updateTypes([])
C.apc.prototype={
$1(d){var x=A.v(null,d,this.a)
x.toString
return x},
$S:48}
C.ahW.prototype={
$0(){return A.aIQ()},
$S:0}
C.ahX.prototype={
$0(){},
$S:0};(function inheritance(){var x=a.inherit,w=a.inheritMany
x(C.rs,A.At)
x(C.apc,A.ib)
x(C.qm,A.a7)
w(A.k2,[C.ahW,C.ahX])})()
A.ID(b.typeUniverse,JSON.parse('{"qm":{"a7":[],"e":[]}}'))
var y={c:A.a4("q<cr>"),h:A.a4("q<k>"),e:A.a4("q<e>"),j:A.a4("rs?")};(function constants(){var x=a.makeConstList
D.Kc=new A.ab(0,560,0,1/0)
D.Pa=new A.ae(20,24,20,24)
D.Qj=new A.bH(983200,"MaterialIcons",!1)
D.a8h=new A.f(0,14)
D.a8S=new A.f(-3,-4)
D.acT=new A.d1(10,null,null,null)
D.ND=new A.r(1,1,0.3215686274509804,0.3215686274509804,B.e)
D.NC=new A.r(1,1,0.6705882352941176,0.25098039215686274,B.e)
D.NH=new A.r(1,1,0.9333333333333333,0.34509803921568627,B.e)
D.Nf=new A.r(1,0.4117647058823529,0.9411764705882353,0.6823529411764706,B.e)
D.Mx=new A.r(1,0.25098039215686274,0.7686274509803922,1,B.e)
D.Mz=new A.r(1,0.48627450980392156,0.30196078431372547,1,B.e)
D.ZM=x([D.ND,D.NC,D.NH,D.Nf,D.Mx,D.Mz],A.a4("q<r>"))
D.adi=new C.rs(B.T,0,6.283185307179586,B.an,D.ZM,null,null)})()};
(a=>{a["KdttYs/CmdSebB95T5rEaCF5NmE="]=a.current})($__dart_deferred_initializers__);