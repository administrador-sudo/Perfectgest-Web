((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,E,B={
baD(d){return A.a7G(new B.aIB(d,null),x.q)},
aIB:function aIB(d,e){this.a=d
this.b=e},
b45(d){switch(d.al(x.l).r.f.gcA()){case"en":return D.Nr
case"es":return D.Ns
case"pt":default:return D.Nt}},
aqu:function aqu(){},
aEL:function aEL(){},
aEJ:function aEJ(){},
aEK:function aEK(){},
aRn(d){return new B.kV(d,null)},
kV:function kV(d,e){this.c=d
this.a=e},
a37:function a37(d,e,f,g,h){var _=this
_.d=d
_.e=e
_.f=f
_.r=g
_.w=h
_.z=_.y=_.x=!1
_.c=_.a=_.Q=null},
aCa:function aCa(d){this.a=d},
aCb:function aCb(d){this.a=d},
aCc:function aCc(d){this.a=d},
aCd:function aCd(d,e){this.a=d
this.b=e},
aC9:function aC9(d){this.a=d},
aC4:function aC4(d){this.a=d},
aC5:function aC5(d){this.a=d},
aC6:function aC6(d){this.a=d},
aC3:function aC3(d,e){this.a=d
this.b=e},
aC7:function aC7(d){this.a=d},
aC8:function aC8(d,e){this.a=d
this.b=e},
agQ(){var w=0,v=A.Q(x.T),u,t=2,s=[],r,q,p,o,n,m,l
var $async$agQ=A.M(function(d,e){if(d===1){s.push(e)
w=t}for(;;)switch(w){case 0:t=4
o=C.c.fR(y.b,"/api/")
w=7
return A.S(B.baD(A.cZ(o>=0?C.c.a1(y.b,0,o)+"/health":"https://perfectgest-leads-api-2ztg.onrender.com/api/leads/health",0,null)).ul(D.PV),$async$agQ)
case 7:r=e
if(r.b===200){u=null
w=1
break}if(r.b===503){u="api_unavailable"
w=1
break}u="api_not_deployed"
w=1
break
t=2
w=6
break
case 4:t=3
l=s.pop()
m=A.ap(l)
if(m instanceof A.jp){u="api_not_deployed"
w=1
break}else if(x.L.b(m)){q=m
p=J.dX(q)
if(J.jk(p,"TimeoutException")||J.jk(p,"timed out")){u="api_waking"
w=1
break}u="api_not_deployed"
w=1
break}else throw l
w=6
break
case 3:w=2
break
case 6:case 1:return A.O(u,v)
case 2:return A.N(s.at(-1),v)}})
return A.P($async$agQ,v)},
Qx(d,e,f,g,h,i){var w=!1
return B.b1B(d,e,f,g,h,i)},
b1B(a0,a1,a2,a3,a4,a5){var w=0,v=A.Q(x.d),u,t=2,s=[],r,q,p,o,n,m,l,k,j,i,h,g,f,e,d
var $async$Qx=A.M(function(a7,a8){if(a7===1){s.push(a8)
w=t}for(;;)switch(w){case 0:e=!1
if(!a1){u=C.tB
w=1
break}r=C.c.c_(a4)
q=C.c.c_(a2)
if(J.cC(r)<2){u=C.tC
w=1
break}if(!B.b1A(q)){u=C.nB
w=1
break}w=3
return A.S(B.agQ(),$async$Qx)
case 3:h=a8
if(h==="api_waking")A.f0().$1("[LeadCapture] Cold start detectado \u2014 aguardando...")
else if(h!=null){A.f0().$1("[LeadCapture] Health check falhou: "+h)
u=new A.d3(!1,h)
w=1
break}t=5
w=8
return A.S(A.aJe(A.cZ(y.b,0,null),C.bL.wX(A.az(["nome",r,"email",q,"comentario",C.c.c_(a0),"consent",!0,"locale",a3,"website",a5,"copiaUsuario",e],x.N,x.K),null),C.o6).ul(D.Qe),$async$Qx)
case 8:p=a8
if(p.b>=200&&p.b<300){o=!1
try{g=p
n=C.bL.pp(A.pl(A.pg(g.e)).ek(g.w),null)
if(x.f.b(n)&&J.d(n.h(0,"copySent"),!0))o=!0}catch(a6){o=!1}u=new A.d3(!0,null)
w=1
break}if(p.b===503){u=D.TF
w=1
break}if(p.b===404){u=D.tz
w=1
break}g=p
A.f0().$1("[LeadCapture] HTTP "+p.b+": "+A.pl(A.pg(g.e)).ek(g.w))
u=C.fo
w=1
break
t=2
w=7
break
case 5:t=4
d=s.pop()
g=A.ap(d)
if(g instanceof A.jp){m=g
l=A.aK(d)
A.f0().$1("[LeadCapture] ClientException: "+A.j(m)+"\n"+A.j(l))
u=D.tz
w=1
break}else if(x.L.b(g)){k=g
j=A.aK(d)
i=J.dX(k)
if(J.jk(i,"TimeoutException")||J.jk(i,"timed out")){u=C.nA
w=1
break}A.f0().$1("[LeadCapture] "+A.j(k)+"\n"+A.j(j))
u=C.ep
w=1
break}else throw d
w=7
break
case 4:w=2
break
case 7:case 1:return A.O(u,v)
case 2:return A.N(s.at(-1),v)}})
return A.P($async$Qx,v)},
b1A(d){var w,v=d.length
if(v<5||v>254)return!1
w=C.c.fR(d,"@")
if(w<=0||w>=v-1)return!1
return C.c.iw(d,".",w+1)>w}},D
J=c[1]
A=c[0]
C=c[2]
E=c[12]
B=a.updateHolder(c[5],B)
D=c[18]
B.aqu.prototype={}
B.aEL.prototype={
ges(){return"Pre-cadastro Perfect Gest Dev"},
gi_(){return"Pre-cadastro"},
gOV(){return"Deixe seu contato"},
gPG(){return"Informe nome e e-mail para receber novidades sobre PerfectGest e solu\xe7\xf5es Perfect Gest Dev."},
gR4(){return"Parte deste pr\xe9-cadastro destina-se a convites para o nosso programa de pr\xe9-lan\xe7amento: acesso integral \xe0s vers\xf5es em desenvolvimento dos aplicativos, com oportunidade de testar funcionalidades em antecipa\xe7\xe3o e contribuir com feedback que orienta a evolu\xe7\xe3o do produto antes do lan\xe7amento p\xfablico."},
gOd(){return"Nome"},
gOc(){return"Seu nome completo"},
gOb(){return"E-mail"},
gOa(){return"seu@email.com"},
gO9(){return"Coment\xe1rio"},
gO8(){return"Opcional \u2014 como podemos ajudar?"},
gpk(){return"Li e aceito a "},
gpj(){return"pol\xedtica de privacidade"},
gpl(){return" e autorizo o contacto sobre novidades, convites de pr\xe9-lan\xe7amento e servi\xe7os indicados."},
goC(){return"Enviar pre-cadastro"},
goD(){return"Enviando\u2026"},
goF(){return"Pre-cadastro recebido"},
goE(){return"Obrigado! Entraremos em contacto em breve no e-mail informado."},
i3(d){var w
A:{if("consent_required"===d){w="Aceite a pol\xedtica de privacidade para continuar."
break A}if("name_invalid"===d){w="Informe um nome v\xe1lido (m\xednimo 2 caracteres)."
break A}if("email_invalid"===d){w="Informe um e-mail v\xe1lido."
break A}if("network_error"===d){w="Sem liga\xe7\xe3o \xe0 internet. Verifique a sua conex\xe3o e tente novamente."
break A}if("api_waking"===d){w="O servidor est\xe1 a iniciar (cold start \u2014 pode demorar at\xe9 1 min). Aguarde e envie novamente."
break A}if("api_not_deployed"===d){w="O servi\xe7o de registos est\xe1 temporariamente indispon\xedvel. Envie um e-mail para suporte@perfectgestdev.com e registamos o seu contacto."
break A}if("api_unavailable"===d){w="Servi\xe7o temporariamente indispon\xedvel. Tente mais tarde ou escreva para suporte@perfectgestdev.com."
break A}if("api_unconfigured"===d){w="API de registos n\xe3o configurada. Contacte suporte@perfectgestdev.com."
break A}w="N\xe3o foi poss\xedvel enviar agora. Tente novamente ou escreva para suporte@perfectgestdev.com."
break A}return w},
gM2(){return"Voltar ao in\xedcio"}}
B.aEJ.prototype={
ges(){return"Pre-registration Perfect Gest Dev"},
gi_(){return"Pre-registration"},
gOV(){return"Leave your contact details"},
gPG(){return"Enter your name and email to receive updates about PerfectGest and Perfect Gest Dev solutions."},
gR4(){return"Pre-registration also enables us to invite selected participants to our pre-launch program: full access to in-development app builds, early feature testing, and feedback that helps shape the product before public release."},
gOd(){return"Name"},
gOc(){return"Your full name"},
gOb(){return"Email"},
gOa(){return"you@email.com"},
gO9(){return"Comment"},
gO8(){return"Optional \u2014 how can we help?"},
gpk(){return"I have read and accept the "},
gpj(){return"privacy policy"},
gpl(){return" and authorize contact about updates, pre-launch invitations, and the services mentioned."},
goC(){return"Submit pre-registration"},
goD(){return"Sending\u2026"},
goF(){return"Pre-registration received"},
goE(){return"Thank you! We will contact you soon at the email provided."},
i3(d){var w
A:{if("consent_required"===d){w="Please accept the privacy policy to continue."
break A}if("name_invalid"===d){w="Enter a valid name (at least 2 characters)."
break A}if("email_invalid"===d){w="Enter a valid email address."
break A}if("network_error"===d){w="Could not reach the registration server. Check your connection or try again shortly."
break A}if("api_waking"===d){w="The server is starting (free tier may take up to 1 minute). Wait and submit again."
break A}if("api_not_deployed"===d){w="Registration service is not active yet. Email suporte@perfectgestdev.com or try later."
break A}if("api_unavailable"===d){w="Service temporarily unavailable. Try again later."
break A}if("api_unconfigured"===d){w="Lead API is not configured in this environment."
break A}w="Could not submit right now. Try again or email suporte@perfectgestdev.com."
break A}return w},
gM2(){return"Back to home"}}
B.aEK.prototype={
ges(){return"Pre-registro Perfect Gest Dev"},
gi_(){return"Pre-registro"},
gOV(){return"Deje su contacto"},
gPG(){return"Indique nombre y correo para recibir novedades sobre PerfectGest y soluciones Perfect Gest Dev."},
gR4(){return"Parte de este pre-registro sirve para invitar a participantes seleccionados al programa de prelanzamiento: acceso completo a las versiones en desarrollo de las aplicaciones, prueba anticipada de funcionalidades y retroalimentaci\xf3n que orienta la evoluci\xf3n del producto antes del lanzamiento p\xfablico."},
gOd(){return"Nombre"},
gOc(){return"Su nombre completo"},
gOb(){return"Correo electr\xf3nico"},
gOa(){return"su@email.com"},
gO9(){return"Comentario"},
gO8(){return"Opcional \u2014 \xbfc\xf3mo podemos ayudar?"},
gpk(){return"He le\xeddo y acepto la "},
gpj(){return"pol\xedtica de privacidad"},
gpl(){return" y autorizo el contacto sobre novedades, invitaciones de prelanzamiento y los servicios indicados."},
goC(){return"Enviar pre-registro"},
goD(){return"Enviando\u2026"},
goF(){return"Pre-registro recibido"},
goE(){return"\xa1Gracias! Le contactaremos pronto en el correo indicado."},
i3(d){var w
A:{if("consent_required"===d){w="Acepte la pol\xedtica de privacidad para continuar."
break A}if("name_invalid"===d){w="Indique un nombre v\xe1lido (m\xednimo 2 caracteres)."
break A}if("email_invalid"===d){w="Indique un correo electr\xf3nico v\xe1lido."
break A}if("network_error"===d){w="No se pudo contactar el servidor de registros. Verifique internet o intente de nuevo."
break A}if("api_waking"===d){w="El servidor est\xe1 iniciando (el plan gratuito puede tardar 1 minuto). Espere e intente de nuevo."
break A}if("api_not_deployed"===d){w="El servicio de registro a\xfan no est\xe1 activo. Escriba a suporte@perfectgestdev.com."
break A}if("api_unavailable"===d){w="Servicio temporalmente no disponible. Intente m\xe1s tarde."
break A}if("api_unconfigured"===d){w="La API de leads a\xfan no est\xe1 configurada."
break A}w="No se pudo enviar ahora. Intente de nuevo o escriba a suporte@perfectgestdev.com."
break A}return w},
gM2(){return"Volver al inicio"}}
B.kV.prototype={
ab(){var w=$.aq()
return new B.a37(new A.b7(null,x.m),new A.dK(C.bm,w),new A.dK(C.bm,w),new A.dK(C.bm,w),new A.dK(C.bm,w))}}
B.a37.prototype={
ar(){this.aR()
A.kh()
A.ea("description","Pre-cadastro Perfect Gest Dev: deixe nome, e-mail e comentario para receber novidades sobre apps Flutter, web e integracoes Java.")
A.ea("keywords","Perfect Gest Dev, pre-cadastro, newsletter, Flutter, software house, contato, leads")
A.ea("robots","index, follow")
A.d_("og:title","Pre-cadastro | Perfect Gest Dev")
A.d_("og:description","Formulario rapido para acompanhar lancamentos e solucoes da Perfect Gest Dev.")
A.d_("og:type","website")
A.d_("og:locale","pt_BR")
b.G.document.title="Pre-cadastro | Perfect Gest Dev"},
l(){var w=this,v=w.e,u=v.P$=$.aq()
v.O$=0
v=w.f
v.P$=u
v.O$=0
v=w.r
v.P$=u
v.O$=0
v=w.w
v.P$=u
v.O$=0
A.pe()
w.aM()},
Bm(d){return this.ary(d)},
ary(d){var w=0,v=A.Q(x.H),u,t=this,s,r,q,p
var $async$Bm=A.M(function(e,f){if(e===1)return A.N(f,v)
for(;;)switch(w){case 0:if(t.y){w=1
break}t.Z(new B.aCa(t))
if(!t.x){t.Z(new B.aCb(t))
w=1
break}s=t.d.gS()
s=s==null?null:s.yE()
if(s!==!0){w=1
break}t.Z(new B.aCc(t))
r=t.c.al(x.l).r.f.kq("-")
s=t.e.a.a
q=t.f.a.a
w=3
return A.S(B.Qx(t.r.a.a,t.x,q,r,s,t.w.a.a),$async$Bm)
case 3:p=f
if(t.c==null){w=1
break}t.Z(new B.aCd(t,p))
case 1:return A.O(u,v)}})
return A.P($async$Bm,v)},
D(d){var w=this,v=null,u=A.v(d).ax,t=A.b3(d,C.at,x.w).w.a.a<400?16:24,s=B.b45(d),r=s.ges(),q=A.v(d).ax.a===C.E?C.bx:C.bg,p=s.gi_()
p=E.aJu(d,v,w.a.c,p)
return A.aH(v,v,v,A.i7(p,q,new A.jS(A.fp(A.dE(new A.cU(D.LI,w.z?w.ae0(d,s,u):w.adQ(d,s,u),v),v,v),v,new A.a2(t,16,t,28),C.aa),v),v,v,v),!1,v,v,v,!1,v,v,v,v,v,v,v,v,r,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,C.q,v)},
ae0(d,e,f){var w=null
return new A.mr(A.b2(A.b([A.cg(C.tk,f.b,w,48),C.bl,A.tL(d,e.goF(),w,20),C.as,A.z(e.goE(),w,w,w,w,A.n6(d,15,1.5),w,w),C.p2,A.uU(A.z(e.gM2(),w,w,w,w,w,w,w),new B.aC9(d),w)],x.p),C.aq,C.n,C.o),18,C.jl,w)},
adQ(d,e,f){var w,v,u,t,s,r,q,p,o=this,n=null,m=e.gOV()
m=A.tL(d,m,n,A.b3(d,C.at,x.w).w.a.a<400?18:22)
w=A.z(e.gPG(),n,n,n,n,A.n6(d,15,1.5),n,n)
v=A.z(e.gR4(),n,n,n,n,A.n6(d,13.5,1.5).avE(f.k3.ac(0.82),1.5),n,n)
u=e.gOd()
u=o.W4(o.e,e.gOc(),C.K1,u,new B.aC4(e))
t=e.gOb()
t=o.W4(o.f,e.gOa(),C.ls,t,new B.aC5(e))
s=e.gO9()
s=o.agI(o.r,e.gO8(),C.lr,s,4,!1)
r=A.CB(A.c5(A.arA(n,C.cZ,!1,n,!0,C.W,n,A.aNi(),o.w,n,n,n,n,n,2,D.T9,C.aS,!0,n,!0,n,!1,n,C.e3,n,n,n,n,n,n,n,n,1,n,n,!1,"\u2022",n,n,n,n,n,!1,n,n,!1,n,!0,n,C.ht,n,n,n,n,n,n,n,n,n,n,n,n,!0,C.bc,n,C.lp,n,n,n,n),0,n),0)
q=o.x
p=x.p
q=A.b([u,C.c8,t,C.c8,s,r,C.bl,A.cJ(A.b([A.aK9(n,!1,n,n,n,!1,n,n,o.y?n:new B.aC6(o),n,n,n,n,n,!1,q),A.dF(new A.aw(C.rx,A.hc(C.bo,A.b([A.z(e.gpk(),n,n,n,n,A.n6(d,13,1.5),n,n),A.h2(!1,n,!0,A.z(e.gpj(),n,n,n,n,A.n6(d,13,1.5).avR(f.b,C.dz,C.a2),n,n),n,!0,n,n,n,n,n,n,n,n,n,new B.aC7(d),n,n,n,n,n,n,n),A.z(e.gpl(),n,n,n,n,A.n6(d,13,1.5),n,n)],p),C.ck,0,0),n),1)],p),C.F,C.n,C.o,0)],p)
u=o.Q
if(u!=null)C.b.X(q,A.b([C.as,A.z(e.i3(u),n,n,n,n,A.b_().$3$color$fontSize$fontWeight(f.fy,13,C.a2),n,n)],p))
q.push(C.cv)
u=o.y
t=u?n:new B.aC8(o,e)
s=u?A.c5(A.aOM(f.c,2),18,18):D.Ss
q.push(A.aKD(s,A.z(u?e.goD():e.goC(),n,n,n,n,n,n,n),t,n))
return A.aPT(A.b2(A.b([m,C.O,w,C.as,v,C.cv,new A.mr(A.b2(q,C.aq,C.n,C.o),18,C.jl,n)],p),C.aq,C.n,C.o),o.d)},
W5(d,e,f,g,h,i,j){var w=null,v=this.y,u=i?j:w
return A.aSi(d,A.Qh(w,C.kO,w,w,w,w,w,w,!0,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,e,w,w,w,w,w,!0,w,w,g,!0,!0,!1,w,w,w,w,w,w,w,w,w,w,w,w,w,w),!v,f,h,u)},
W4(d,e,f,g,h){return this.W5(d,e,f,g,1,!0,h)},
agI(d,e,f,g,h,i){return this.W5(d,e,f,g,h,i,null)}}
var z=a.updateTypes([])
B.aIB.prototype={
$1(d){return d.ZT("GET",this.a,this.b)},
$S:227}
B.aCa.prototype={
$0(){var w=this.a
w.Q=null
w.z=!1},
$S:0}
B.aCb.prototype={
$0(){return this.a.Q="consent_required"},
$S:0}
B.aCc.prototype={
$0(){return this.a.y=!0},
$S:0}
B.aCd.prototype={
$0(){var w,v=this.a
v.y=!1
w=this.b
if(w.a){v.z=!0
v.e.n_(C.p7)
v.f.n_(C.p7)
v.r.n_(C.p7)
v.x=!1}else{w=w.b
v.Q=w==null?"server_error":w}},
$S:0}
B.aC9.prototype={
$0(){var w,v=this.a
if(A.c4(v,!1).wt())A.c4(v,!1).de()
else{w=x.X
A.c4(v,!1).a5E("/",w,w)}},
$S:0}
B.aC4.prototype={
$1(d){if(C.c.c_(d).length<2)return this.a.i3("name_invalid")
return null},
$S:45}
B.aC5.prototype={
$1(d){var w=C.c.c_(d)
if(!C.c.n(w,"@")||!C.c.n(w,"."))return this.a.i3("email_invalid")
return null},
$S:45}
B.aC6.prototype={
$1(d){var w=this.a
return w.Z(new B.aC3(w,d))},
$S:48}
B.aC3.prototype={
$0(){return this.a.x=this.b===!0},
$S:0}
B.aC7.prototype={
$0(){return A.c4(this.a,!1).lC("/politica-privacidade-site",x.X)},
$S:0}
B.aC8.prototype={
$0(){return this.a.Bm(this.b)},
$S:0};(function inheritance(){var w=a.inheritMany,v=a.inherit
w(A.jq,[B.aIB,B.aC4,B.aC5,B.aC6])
v(B.aqu,A.K)
w(B.aqu,[B.aEL,B.aEJ,B.aEK])
v(B.kV,A.T)
v(B.a37,A.W)
w(A.jr,[B.aCa,B.aCb,B.aCc,B.aCd,B.aC9,B.aC3,B.aC7,B.aC8])})()
A.tx(b.typeUniverse,JSON.parse('{"kV":{"T":[],"e":[]},"a37":{"W":["kV"]}}'))
var y={b:"https://perfectgest-leads-api-2ztg.onrender.com/api/leads"}
var x=(function rtii(){var w=A.a4
return{L:w("cm"),p:w("u<e>"),m:w("b7<uZ>"),d:w("d3"),f:w("bg<@,@>"),w:w("fL"),K:w("K"),q:w("rA"),N:w("l"),l:w("lh"),X:w("K?"),T:w("l?"),H:w("~")}})();(function constants(){D.LI=new A.a6(0,520,0,1/0)
D.Nr=new B.aEJ()
D.Ns=new B.aEK()
D.Nt=new B.aEL()
D.PV=new A.aS(12e6)
D.Qe=new A.aS(9e7)
D.Ss=new A.cN(C.tl,18,null,null,null)
D.T9=new A.qt(null,null,null,"Website",null,null,null,null,null,null,null,null,null,null,null,null,!0,!0,!1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,!0,null,null,null,null)
D.tz=new A.d3(!1,"api_not_deployed")
D.TF=new A.d3(!1,"api_unavailable")})()};
(a=>{a["7m7kN1prU5q+eR1rYnP/2aq+1OU="]=a.current})($__dart_deferred_initializers__);