((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,E,B={
bc2(d){return A.a8j(new B.aJE(d,null),x.q)},
aJE:function aJE(d,e){this.a=d
this.b=e},
b5m(d){switch(d.ak(x.l).r.f.gcB()){case"en":return D.NV
case"es":return D.NW
case"pt":default:return D.NX}},
arg:function arg(){},
aFP:function aFP(){},
aFN:function aFN(){},
aFO:function aFO(){},
aSq(d){return new B.l1(d,null)},
l1:function l1(d,e){this.c=d
this.a=e},
a3D:function a3D(d,e,f,g,h){var _=this
_.d=d
_.e=e
_.f=f
_.r=g
_.w=h
_.z=_.y=_.x=!1
_.c=_.a=_.Q=null},
aDa:function aDa(d){this.a=d},
aDb:function aDb(d){this.a=d},
aDc:function aDc(d){this.a=d},
aDd:function aDd(d,e){this.a=d
this.b=e},
aD9:function aD9(d){this.a=d},
aD4:function aD4(d){this.a=d},
aD5:function aD5(d){this.a=d},
aD6:function aD6(d){this.a=d},
aD3:function aD3(d,e){this.a=d
this.b=e},
aD7:function aD7(d){this.a=d},
aD8:function aD8(d,e){this.a=d
this.b=e},
aht(){var w=0,v=A.P(x.T),u,t=2,s=[],r,q,p,o,n,m,l
var $async$aht=A.K(function(d,e){if(d===1){s.push(e)
w=t}for(;;)switch(w){case 0:t=4
o=C.c.fu(y.b,"/api/")
w=7
return A.R(B.bc2(A.d_(o>=0?C.c.a1(y.b,0,o)+"/health":"https://perfectgest-leads-api-2ztg.onrender.com/api/leads/health",0,null)).uA(D.Qs),$async$aht)
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
if(m instanceof A.jv){u="api_not_deployed"
w=1
break}else if(x.L.b(m)){q=m
p=J.dX(q)
if(J.jq(p,"TimeoutException")||J.jq(p,"timed out")){u="api_waking"
w=1
break}u="api_not_deployed"
w=1
break}else throw l
w=6
break
case 3:w=2
break
case 6:case 1:return A.N(u,v)
case 2:return A.M(s.at(-1),v)}})
return A.O($async$aht,v)},
QX(d,e,f,g,h,i){var w=!1
return B.b2N(d,e,f,g,h,i)},
b2N(a0,a1,a2,a3,a4,a5){var w=0,v=A.P(x.d),u,t=2,s=[],r,q,p,o,n,m,l,k,j,i,h,g,f,e,d
var $async$QX=A.K(function(a7,a8){if(a7===1){s.push(a8)
w=t}for(;;)switch(w){case 0:e=!1
if(!a1){u=C.tV
w=1
break}r=C.c.bW(a4)
q=C.c.bW(a2)
if(J.cD(r)<2){u=C.tW
w=1
break}if(!B.b2M(q)){u=C.nK
w=1
break}w=3
return A.R(B.aht(),$async$QX)
case 3:h=a8
if(h==="api_waking")A.eL().$1("[LeadCapture] Cold start detectado \u2014 aguardando...")
else if(h!=null){A.eL().$1("[LeadCapture] Health check falhou: "+h)
u=new A.d3(!1,h)
w=1
break}t=5
w=8
return A.R(A.aKh(A.d_(y.b,0,null),C.bO.xh(A.az(["nome",r,"email",q,"comentario",C.c.bW(a0),"consent",!0,"locale",a3,"website",a5,"copiaUsuario",e],x.N,x.K),null),C.of).uA(D.QK),$async$QX)
case 8:p=a8
if(p.b>=200&&p.b<300){o=!1
try{g=p
n=C.bO.pA(A.ps(A.pn(g.e)).ev(g.w),null)
if(x.f.b(n)&&J.d(n.h(0,"copySent"),!0))o=!0}catch(a6){o=!1}u=new A.d3(!0,null)
w=1
break}if(p.b===503){u=D.Ul
w=1
break}if(p.b===404){u=D.tT
w=1
break}g=p
A.eL().$1("[LeadCapture] HTTP "+p.b+": "+A.ps(A.pn(g.e)).ev(g.w))
u=C.fy
w=1
break
t=2
w=7
break
case 5:t=4
d=s.pop()
g=A.ap(d)
if(g instanceof A.jv){m=g
l=A.aL(d)
A.eL().$1("[LeadCapture] ClientException: "+A.j(m)+"\n"+A.j(l))
u=D.tT
w=1
break}else if(x.L.b(g)){k=g
j=A.aL(d)
i=J.dX(k)
if(J.jq(i,"TimeoutException")||J.jq(i,"timed out")){u=C.nJ
w=1
break}A.eL().$1("[LeadCapture] "+A.j(k)+"\n"+A.j(j))
u=C.ev
w=1
break}else throw d
w=7
break
case 4:w=2
break
case 7:case 1:return A.N(u,v)
case 2:return A.M(s.at(-1),v)}})
return A.O($async$QX,v)},
b2M(d){var w,v=d.length
if(v<5||v>254)return!1
w=C.c.fu(d,"@")
if(w<=0||w>=v-1)return!1
return C.c.iB(d,".",w+1)>w}},D
J=c[1]
A=c[0]
C=c[2]
E=c[12]
B=a.updateHolder(c[5],B)
D=c[18]
B.arg.prototype={}
B.aFP.prototype={
geB(){return"Pre-cadastro Perfect Gest Dev"},
gi5(){return"Pre-cadastro"},
gPc(){return"Deixe seu contato"},
gPY(){return"Informe nome e e-mail para receber novidades sobre PerfectGest e solu\xe7\xf5es Perfect Gest Dev."},
gRm(){return"Parte deste pr\xe9-cadastro destina-se a convites para o nosso programa de pr\xe9-lan\xe7amento: acesso integral \xe0s vers\xf5es em desenvolvimento dos aplicativos, com oportunidade de testar funcionalidades em antecipa\xe7\xe3o e contribuir com feedback que orienta a evolu\xe7\xe3o do produto antes do lan\xe7amento p\xfablico."},
gOv(){return"Nome"},
gOu(){return"Seu nome completo"},
gOt(){return"E-mail"},
gOs(){return"seu@email.com"},
gOr(){return"Coment\xe1rio"},
gOq(){return"Opcional \u2014 como podemos ajudar?"},
gpv(){return"Li e aceito a "},
gpu(){return"pol\xedtica de privacidade"},
gpw(){return" e autorizo o contacto sobre novidades, convites de pr\xe9-lan\xe7amento e servi\xe7os indicados."},
goL(){return"Enviar pre-cadastro"},
goM(){return"Enviando\u2026"},
goO(){return"Pre-cadastro recebido"},
goN(){return"Obrigado! Entraremos em contacto em breve no e-mail informado."},
hI(d){var w
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
gMj(){return"Voltar ao in\xedcio"}}
B.aFN.prototype={
geB(){return"Pre-registration Perfect Gest Dev"},
gi5(){return"Pre-registration"},
gPc(){return"Leave your contact details"},
gPY(){return"Enter your name and email to receive updates about PerfectGest and Perfect Gest Dev solutions."},
gRm(){return"Pre-registration also enables us to invite selected participants to our pre-launch program: full access to in-development app builds, early feature testing, and feedback that helps shape the product before public release."},
gOv(){return"Name"},
gOu(){return"Your full name"},
gOt(){return"Email"},
gOs(){return"you@email.com"},
gOr(){return"Comment"},
gOq(){return"Optional \u2014 how can we help?"},
gpv(){return"I have read and accept the "},
gpu(){return"privacy policy"},
gpw(){return" and authorize contact about updates, pre-launch invitations, and the services mentioned."},
goL(){return"Submit pre-registration"},
goM(){return"Sending\u2026"},
goO(){return"Pre-registration received"},
goN(){return"Thank you! We will contact you soon at the email provided."},
hI(d){var w
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
gMj(){return"Back to home"}}
B.aFO.prototype={
geB(){return"Pre-registro Perfect Gest Dev"},
gi5(){return"Pre-registro"},
gPc(){return"Deje su contacto"},
gPY(){return"Indique nombre y correo para recibir novedades sobre PerfectGest y soluciones Perfect Gest Dev."},
gRm(){return"Parte de este pre-registro sirve para invitar a participantes seleccionados al programa de prelanzamiento: acceso completo a las versiones en desarrollo de las aplicaciones, prueba anticipada de funcionalidades y retroalimentaci\xf3n que orienta la evoluci\xf3n del producto antes del lanzamiento p\xfablico."},
gOv(){return"Nombre"},
gOu(){return"Su nombre completo"},
gOt(){return"Correo electr\xf3nico"},
gOs(){return"su@email.com"},
gOr(){return"Comentario"},
gOq(){return"Opcional \u2014 \xbfc\xf3mo podemos ayudar?"},
gpv(){return"He le\xeddo y acepto la "},
gpu(){return"pol\xedtica de privacidad"},
gpw(){return" y autorizo el contacto sobre novedades, invitaciones de prelanzamiento y los servicios indicados."},
goL(){return"Enviar pre-registro"},
goM(){return"Enviando\u2026"},
goO(){return"Pre-registro recibido"},
goN(){return"\xa1Gracias! Le contactaremos pronto en el correo indicado."},
hI(d){var w
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
gMj(){return"Volver al inicio"}}
B.l1.prototype={
ab(){var w=$.aq()
return new B.a3D(new A.b5(null,x.m),new A.dG(C.bo,w),new A.dG(C.bo,w),new A.dG(C.bo,w),new A.dG(C.bo,w))}}
B.a3D.prototype={
aq(){this.aQ()
A.kl()
A.ec("description","Pre-cadastro Perfect Gest Dev: deixe nome, e-mail e comentario para receber novidades sobre apps Flutter, web e integracoes Java.")
A.ec("keywords","Perfect Gest Dev, pre-cadastro, newsletter, Flutter, software house, contato, leads")
A.ec("robots","index, follow")
A.d0("og:title","Pre-cadastro | Perfect Gest Dev")
A.d0("og:description","Formulario rapido para acompanhar lancamentos e solucoes da Perfect Gest Dev.")
A.d0("og:type","website")
A.d0("og:locale","pt_BR")
b.G.document.title="Pre-cadastro | Perfect Gest Dev"},
l(){var w=this,v=w.e,u=v.P$=$.aq()
v.N$=0
v=w.f
v.P$=u
v.N$=0
v=w.r
v.P$=u
v.N$=0
v=w.w
v.P$=u
v.N$=0
A.pl()
w.aM()},
By(d){return this.aso(d)},
aso(d){var w=0,v=A.P(x.H),u,t=this,s,r,q,p
var $async$By=A.K(function(e,f){if(e===1)return A.M(f,v)
for(;;)switch(w){case 0:if(t.y){w=1
break}t.T(new B.aDa(t))
if(!t.x){t.T(new B.aDb(t))
w=1
break}s=t.d.gR()
s=s==null?null:s.uJ()
if(s!==!0){w=1
break}t.T(new B.aDc(t))
r=t.c.ak(x.l).r.f.kt("-")
s=t.e.a.a
q=t.f.a.a
w=3
return A.R(B.QX(t.r.a.a,t.x,q,r,s,t.w.a.a),$async$By)
case 3:p=f
if(t.c==null){w=1
break}t.T(new B.aDd(t,p))
case 1:return A.N(u,v)}})
return A.O($async$By,v)},
D(d){var w=this,v=null,u=A.w(d).ax,t=A.b1(d,C.at,x.w).w.a.a<400?16:24,s=B.b5m(d),r=s.geB(),q=A.w(d).ax.a===C.E?C.bB:C.bj,p=s.gi5()
p=E.aKA(d,v,w.a.c,p)
return A.aF(v,v,v,A.ia(p,q,new A.jX(A.f6(A.dw(new A.cN(D.M8,w.z?w.aev(d,s,u):w.aek(d,s,u),v),v,v),v,new A.a1(t,16,t,28),C.ac),v),v,v,v),!1,v,v,!1,v,!1,v,v,v,v,v,v,v,v,r,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,C.p,v)},
aev(d,e,f){var w=null
return new A.mz(A.b0(A.b([A.ck(C.tC,f.b,w,48),C.bn,A.tX(d,e.goO(),w,20),C.aq,A.v(e.goN(),w,w,w,w,A.nf(d,15,1.5),w,w),C.pb,A.qc(A.v(e.gMj(),w,w,w,w,w,w,w),new B.aD9(d),w)],x.p),C.an,C.n,C.o),18,C.js,w)},
aek(d,e,f){var w,v,u,t,s,r,q,p,o=this,n=null,m=e.gPc()
m=A.tX(d,m,n,A.b1(d,C.at,x.w).w.a.a<400?18:22)
w=A.v(e.gPY(),n,n,n,n,A.nf(d,15,1.5),n,n)
v=A.v(e.gRm(),n,n,n,n,A.nf(d,13.5,1.5).awu(f.k3.ae(0.82),1.5),n,n)
u=e.gOv()
u=o.Wq(o.e,e.gOu(),C.Ko,u,new B.aD4(e))
t=e.gOt()
t=o.Wq(o.f,e.gOs(),C.lv,t,new B.aD5(e))
s=e.gOr()
s=o.ahf(o.r,e.gOq(),C.iw,s,4,!1)
r=A.vU(A.c3(A.asn(n,C.d4,!1,n,!0,C.V,n,A.aOr(),o.w,n,n,n,n,n,2,D.TQ,C.aM,!0,n,!0,n,!1,n,C.dK,n,n,n,n,n,n,n,n,1,n,n,!1,"\u2022",n,n,n,n,n,!1,n,n,!1,n,!0,n,C.fk,n,n,n,n,n,n,n,n,n,n,n,n,!0,C.b7,n,C.iu,n,n,n,n),0,n),0)
q=o.x
p=x.p
q=A.b([u,C.cc,t,C.cc,s,r,C.bn,A.ch(A.b([A.aLj(n,!1,n,n,n,!1,n,n,o.y?n:new B.aD6(o),n,n,n,n,n,!1,q),A.dx(new A.an(C.rM,A.hj(C.bp,A.b([A.v(e.gpv(),n,n,n,n,A.nf(d,13,1.5),n,n),A.fo(!1,n,!0,A.v(e.gpu(),n,n,n,n,A.nf(d,13,1.5).awH(f.b,C.da,C.a3),n,n),n,!0,n,n,n,n,n,n,n,n,n,new B.aD7(d),n,n,n,n,n,n,n),A.v(e.gpw(),n,n,n,n,A.nf(d,13,1.5),n,n)],p),C.cm,0,0),n),1)],p),C.F,C.n,C.o,0)],p)
u=o.Q
if(u!=null)C.b.V(q,A.b([C.aq,A.v(e.hI(u),n,n,n,n,A.b_().$3$color$fontSize$fontWeight(f.fy,13,C.a3),n,n)],p))
q.push(C.cx)
u=o.y
t=u?n:new B.aD8(o,e)
s=u?A.c3(A.aPQ(f.c,2),18,18):D.T8
q.push(A.aLO(s,A.v(u?e.goM():e.goL(),n,n,n,n,n,n,n),t,n))
return A.aQY(A.b0(A.b([m,C.Q,w,C.aq,v,C.cx,new A.mz(A.b0(q,C.an,C.n,C.o),18,C.js,n)],p),C.an,C.n,C.o),o.d)},
Wr(d,e,f,g,h,i,j){var w=null,v=this.y,u=i?j:w
return A.aTo(d,A.BK(w,C.i2,w,w,w,w,w,w,!0,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,e,w,w,w,w,w,!0,w,w,g,!0,!0,!1,w,w,w,w,w,w,w,w,w,w,w,w,w,w),!v,f,h,u)},
Wq(d,e,f,g,h){return this.Wr(d,e,f,g,1,!0,h)},
ahf(d,e,f,g,h,i){return this.Wr(d,e,f,g,h,i,null)}}
var z=a.updateTypes([])
B.aJE.prototype={
$1(d){return d.a_i("GET",this.a,this.b)},
$S:210}
B.aDa.prototype={
$0(){var w=this.a
w.Q=null
w.z=!1},
$S:0}
B.aDb.prototype={
$0(){return this.a.Q="consent_required"},
$S:0}
B.aDc.prototype={
$0(){return this.a.y=!0},
$S:0}
B.aDd.prototype={
$0(){var w,v=this.a
v.y=!1
w=this.b
if(w.a){v.z=!0
v.e.m5(C.pj)
v.f.m5(C.pj)
v.r.m5(C.pj)
v.x=!1}else{w=w.b
v.Q=w==null?"server_error":w}},
$S:0}
B.aD9.prototype={
$0(){var w,v=this.a
if(A.c0(v,!1).wN())A.c0(v,!1).dh()
else{w=x.X
A.c0(v,!1).a67("/",w,w)}},
$S:0}
B.aD4.prototype={
$1(d){if(C.c.bW(d).length<2)return this.a.hI("name_invalid")
return null},
$S:48}
B.aD5.prototype={
$1(d){var w=C.c.bW(d)
if(!C.c.n(w,"@")||!C.c.n(w,"."))return this.a.hI("email_invalid")
return null},
$S:48}
B.aD6.prototype={
$1(d){var w=this.a
return w.T(new B.aD3(w,d))},
$S:51}
B.aD3.prototype={
$0(){return this.a.x=this.b===!0},
$S:0}
B.aD7.prototype={
$0(){return A.c0(this.a,!1).lJ("/politica-privacidade-site",x.X)},
$S:0}
B.aD8.prototype={
$0(){return this.a.By(this.b)},
$S:0};(function inheritance(){var w=a.inheritMany,v=a.inherit
w(A.jw,[B.aJE,B.aD4,B.aD5,B.aD6])
v(B.arg,A.Q)
w(B.arg,[B.aFP,B.aFN,B.aFO])
v(B.l1,A.T)
v(B.a3D,A.W)
w(A.jx,[B.aDa,B.aDb,B.aDc,B.aDd,B.aD9,B.aD3,B.aD7,B.aD8])})()
A.tH(b.typeUniverse,JSON.parse('{"l1":{"T":[],"e":[]},"a3D":{"W":["l1"]}}'))
var y={b:"https://perfectgest-leads-api-2ztg.onrender.com/api/leads"}
var x=(function rtii(){var w=A.a4
return{L:w("cf"),p:w("t<e>"),m:w("b5<vd>"),d:w("d3"),f:w("bh<@,@>"),w:w("fR"),K:w("Q"),q:w("rH"),N:w("l"),l:w("lp"),X:w("Q?"),T:w("l?"),H:w("~")}})();(function constants(){D.M8=new A.a6(0,520,0,1/0)
D.NV=new B.aFN()
D.NW=new B.aFO()
D.NX=new B.aFP()
D.Qs=new A.aU(12e6)
D.QK=new A.aU(9e7)
D.T8=new A.cF(C.tD,18,null,null,null)
D.TQ=new A.qz(null,null,null,"Website",null,null,null,null,null,null,null,null,null,null,null,null,!0,!0,!1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,!0,null,null,null,null)
D.tT=new A.d3(!1,"api_not_deployed")
D.Ul=new A.d3(!1,"api_unavailable")})()};
(a=>{a["RJea3S9yNLG/KyoCG7NsHaH6DF0="]=a.current})($__dart_deferred_initializers__);