((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,E,B={
bbO(d){return A.a8b(new B.aJp(d,null),x.q)},
aJp:function aJp(d,e){this.a=d
this.b=e},
b57(d){switch(d.ak(x.l).r.f.gcB()){case"en":return D.NK
case"es":return D.NL
case"pt":default:return D.NM}},
ara:function ara(){},
aFC:function aFC(){},
aFA:function aFA(){},
aFB:function aFB(){},
aSb(d){return new B.l_(d,null)},
l_:function l_(d,e){this.c=d
this.a=e},
a3v:function a3v(d,e,f,g,h){var _=this
_.d=d
_.e=e
_.f=f
_.r=g
_.w=h
_.z=_.y=_.x=!1
_.c=_.a=_.Q=null},
aCY:function aCY(d){this.a=d},
aCZ:function aCZ(d){this.a=d},
aD_:function aD_(d){this.a=d},
aD0:function aD0(d,e){this.a=d
this.b=e},
aCX:function aCX(d){this.a=d},
aCS:function aCS(d){this.a=d},
aCT:function aCT(d){this.a=d},
aCU:function aCU(d){this.a=d},
aCR:function aCR(d,e){this.a=d
this.b=e},
aCV:function aCV(d){this.a=d},
aCW:function aCW(d,e){this.a=d
this.b=e},
ahn(){var w=0,v=A.Q(x.T),u,t=2,s=[],r,q,p,o,n,m,l
var $async$ahn=A.L(function(d,e){if(d===1){s.push(e)
w=t}for(;;)switch(w){case 0:t=4
o=C.c.fU(y.b,"/api/")
w=7
return A.R(B.bbO(A.d_(o>=0?C.c.a1(y.b,0,o)+"/health":"https://perfectgest-leads-api-2ztg.onrender.com/api/leads/health",0,null)).ux(D.Qh),$async$ahn)
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
m=A.as(l)
if(m instanceof A.js){u="api_not_deployed"
w=1
break}else if(x.L.b(m)){q=m
p=J.dY(q)
if(J.jn(p,"TimeoutException")||J.jn(p,"timed out")){u="api_waking"
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
return A.P($async$ahn,v)},
QT(d,e,f,g,h,i){var w=!1
return B.b2z(d,e,f,g,h,i)},
b2z(a0,a1,a2,a3,a4,a5){var w=0,v=A.Q(x.d),u,t=2,s=[],r,q,p,o,n,m,l,k,j,i,h,g,f,e,d
var $async$QT=A.L(function(a7,a8){if(a7===1){s.push(a8)
w=t}for(;;)switch(w){case 0:e=!1
if(!a1){u=C.tO
w=1
break}r=C.c.c0(a4)
q=C.c.c0(a2)
if(J.cD(r)<2){u=C.tP
w=1
break}if(!B.b2y(q)){u=C.nL
w=1
break}w=3
return A.R(B.ahn(),$async$QT)
case 3:h=a8
if(h==="api_waking")A.eL().$1("[LeadCapture] Cold start detectado \u2014 aguardando...")
else if(h!=null){A.eL().$1("[LeadCapture] Health check falhou: "+h)
u=new A.d3(!1,h)
w=1
break}t=5
w=8
return A.R(A.aK2(A.d_(y.b,0,null),C.bN.xb(A.az(["nome",r,"email",q,"comentario",C.c.c0(a0),"consent",!0,"locale",a3,"website",a5,"copiaUsuario",e],x.N,x.K),null),C.og).ux(D.QB),$async$QT)
case 8:p=a8
if(p.b>=200&&p.b<300){o=!1
try{g=p
n=C.bN.pw(A.pq(A.pl(g.e)).eu(g.w),null)
if(x.f.b(n)&&J.d(n.h(0,"copySent"),!0))o=!0}catch(a6){o=!1}u=new A.d3(!0,null)
w=1
break}if(p.b===503){u=D.Ua
w=1
break}if(p.b===404){u=D.tM
w=1
break}g=p
A.eL().$1("[LeadCapture] HTTP "+p.b+": "+A.pq(A.pl(g.e)).eu(g.w))
u=C.fw
w=1
break
t=2
w=7
break
case 5:t=4
d=s.pop()
g=A.as(d)
if(g instanceof A.js){m=g
l=A.aL(d)
A.eL().$1("[LeadCapture] ClientException: "+A.j(m)+"\n"+A.j(l))
u=D.tM
w=1
break}else if(x.L.b(g)){k=g
j=A.aL(d)
i=J.dY(k)
if(J.jn(i,"TimeoutException")||J.jn(i,"timed out")){u=C.nK
w=1
break}A.eL().$1("[LeadCapture] "+A.j(k)+"\n"+A.j(j))
u=C.et
w=1
break}else throw d
w=7
break
case 4:w=2
break
case 7:case 1:return A.O(u,v)
case 2:return A.N(s.at(-1),v)}})
return A.P($async$QT,v)},
b2y(d){var w,v=d.length
if(v<5||v>254)return!1
w=C.c.fU(d,"@")
if(w<=0||w>=v-1)return!1
return C.c.iz(d,".",w+1)>w}},D
J=c[1]
A=c[0]
C=c[2]
E=c[12]
B=a.updateHolder(c[5],B)
D=c[18]
B.ara.prototype={}
B.aFC.prototype={
geA(){return"Pre-cadastro Perfect Gest Dev"},
gi1(){return"Pre-cadastro"},
gPb(){return"Deixe seu contato"},
gPX(){return"Informe nome e e-mail para receber novidades sobre PerfectGest e solu\xe7\xf5es Perfect Gest Dev."},
gRm(){return"Parte deste pr\xe9-cadastro destina-se a convites para o nosso programa de pr\xe9-lan\xe7amento: acesso integral \xe0s vers\xf5es em desenvolvimento dos aplicativos, com oportunidade de testar funcionalidades em antecipa\xe7\xe3o e contribuir com feedback que orienta a evolu\xe7\xe3o do produto antes do lan\xe7amento p\xfablico."},
gOu(){return"Nome"},
gOt(){return"Seu nome completo"},
gOs(){return"E-mail"},
gOr(){return"seu@email.com"},
gOq(){return"Coment\xe1rio"},
gOp(){return"Opcional \u2014 como podemos ajudar?"},
gpr(){return"Li e aceito a "},
gpq(){return"pol\xedtica de privacidade"},
gps(){return" e autorizo o contacto sobre novidades, convites de pr\xe9-lan\xe7amento e servi\xe7os indicados."},
goI(){return"Enviar pre-cadastro"},
goJ(){return"Enviando\u2026"},
goL(){return"Pre-cadastro recebido"},
goK(){return"Obrigado! Entraremos em contacto em breve no e-mail informado."},
i5(d){var w
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
gMi(){return"Voltar ao in\xedcio"}}
B.aFA.prototype={
geA(){return"Pre-registration Perfect Gest Dev"},
gi1(){return"Pre-registration"},
gPb(){return"Leave your contact details"},
gPX(){return"Enter your name and email to receive updates about PerfectGest and Perfect Gest Dev solutions."},
gRm(){return"Pre-registration also enables us to invite selected participants to our pre-launch program: full access to in-development app builds, early feature testing, and feedback that helps shape the product before public release."},
gOu(){return"Name"},
gOt(){return"Your full name"},
gOs(){return"Email"},
gOr(){return"you@email.com"},
gOq(){return"Comment"},
gOp(){return"Optional \u2014 how can we help?"},
gpr(){return"I have read and accept the "},
gpq(){return"privacy policy"},
gps(){return" and authorize contact about updates, pre-launch invitations, and the services mentioned."},
goI(){return"Submit pre-registration"},
goJ(){return"Sending\u2026"},
goL(){return"Pre-registration received"},
goK(){return"Thank you! We will contact you soon at the email provided."},
i5(d){var w
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
gMi(){return"Back to home"}}
B.aFB.prototype={
geA(){return"Pre-registro Perfect Gest Dev"},
gi1(){return"Pre-registro"},
gPb(){return"Deje su contacto"},
gPX(){return"Indique nombre y correo para recibir novedades sobre PerfectGest y soluciones Perfect Gest Dev."},
gRm(){return"Parte de este pre-registro sirve para invitar a participantes seleccionados al programa de prelanzamiento: acceso completo a las versiones en desarrollo de las aplicaciones, prueba anticipada de funcionalidades y retroalimentaci\xf3n que orienta la evoluci\xf3n del producto antes del lanzamiento p\xfablico."},
gOu(){return"Nombre"},
gOt(){return"Su nombre completo"},
gOs(){return"Correo electr\xf3nico"},
gOr(){return"su@email.com"},
gOq(){return"Comentario"},
gOp(){return"Opcional \u2014 \xbfc\xf3mo podemos ayudar?"},
gpr(){return"He le\xeddo y acepto la "},
gpq(){return"pol\xedtica de privacidad"},
gps(){return" y autorizo el contacto sobre novedades, invitaciones de prelanzamiento y los servicios indicados."},
goI(){return"Enviar pre-registro"},
goJ(){return"Enviando\u2026"},
goL(){return"Pre-registro recibido"},
goK(){return"\xa1Gracias! Le contactaremos pronto en el correo indicado."},
i5(d){var w
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
gMi(){return"Volver al inicio"}}
B.l_.prototype={
ab(){var w=$.an()
return new B.a3v(new A.b5(null,x.m),new A.dG(C.bn,w),new A.dG(C.bn,w),new A.dG(C.bn,w),new A.dG(C.bn,w))}}
B.a3v.prototype={
aq(){this.aQ()
A.ki()
A.eb("description","Pre-cadastro Perfect Gest Dev: deixe nome, e-mail e comentario para receber novidades sobre apps Flutter, web e integracoes Java.")
A.eb("keywords","Perfect Gest Dev, pre-cadastro, newsletter, Flutter, software house, contato, leads")
A.eb("robots","index, follow")
A.d0("og:title","Pre-cadastro | Perfect Gest Dev")
A.d0("og:description","Formulario rapido para acompanhar lancamentos e solucoes da Perfect Gest Dev.")
A.d0("og:type","website")
A.d0("og:locale","pt_BR")
b.G.document.title="Pre-cadastro | Perfect Gest Dev"},
l(){var w=this,v=w.e,u=v.P$=$.an()
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
A.pj()
w.aM()},
By(d){return this.asj(d)},
asj(d){var w=0,v=A.Q(x.H),u,t=this,s,r,q,p
var $async$By=A.L(function(e,f){if(e===1)return A.N(f,v)
for(;;)switch(w){case 0:if(t.y){w=1
break}t.U(new B.aCY(t))
if(!t.x){t.U(new B.aCZ(t))
w=1
break}s=t.d.gS()
s=s==null?null:s.yR()
if(s!==!0){w=1
break}t.U(new B.aD_(t))
r=t.c.ak(x.l).r.f.ks("-")
s=t.e.a.a
q=t.f.a.a
w=3
return A.R(B.QT(t.r.a.a,t.x,q,r,s,t.w.a.a),$async$By)
case 3:p=f
if(t.c==null){w=1
break}t.U(new B.aD0(t,p))
case 1:return A.O(u,v)}})
return A.P($async$By,v)},
D(d){var w=this,v=null,u=A.w(d).ax,t=A.b1(d,C.at,x.w).w.a.a<400?16:24,s=B.b57(d),r=s.geA(),q=A.w(d).ax.a===C.E?C.bB:C.bi,p=s.gi1()
p=E.aKl(d,v,w.a.c,p)
return A.aG(v,v,v,A.i8(p,q,new A.jU(A.f6(A.dA(new A.cQ(D.LY,w.z?w.aet(d,s,u):w.aei(d,s,u),v),v,v),v,new A.a1(t,16,t,28),C.aa),v),v,v,v),!1,v,v,!1,v,!1,v,v,v,v,v,v,v,v,r,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,C.q,v)},
aet(d,e,f){var w=null
return new A.mw(A.b0(A.b([A.ci(C.tx,f.b,w,48),C.bm,A.tV(d,e.goL(),w,20),C.al,A.v(e.goK(),w,w,w,w,A.nc(d,15,1.5),w,w),C.pc,A.qa(A.v(e.gMi(),w,w,w,w,w,w,w),new B.aCX(d),w)],x.p),C.ao,C.n,C.o),18,C.jr,w)},
aei(d,e,f){var w,v,u,t,s,r,q,p,o=this,n=null,m=e.gPb()
m=A.tV(d,m,n,A.b1(d,C.at,x.w).w.a.a<400?18:22)
w=A.v(e.gPX(),n,n,n,n,A.nc(d,15,1.5),n,n)
v=A.v(e.gRm(),n,n,n,n,A.nc(d,13.5,1.5).awp(f.k3.ae(0.82),1.5),n,n)
u=e.gOu()
u=o.Wn(o.e,e.gOt(),C.Kf,u,new B.aCS(e))
t=e.gOs()
t=o.Wn(o.f,e.gOr(),C.lw,t,new B.aCT(e))
s=e.gOq()
s=o.ahc(o.r,e.gOp(),C.it,s,4,!1)
r=A.CN(A.c5(A.ash(n,C.d4,!1,n,!0,C.V,n,A.aOa(),o.w,n,n,n,n,n,2,D.TF,C.aN,!0,n,!0,n,!1,n,C.dL,n,n,n,n,n,n,n,n,1,n,n,!1,"\u2022",n,n,n,n,n,!1,n,n,!1,n,!0,n,C.fi,n,n,n,n,n,n,n,n,n,n,n,n,!0,C.b7,n,C.ir,n,n,n,n),0,n),0)
q=o.x
p=x.p
q=A.b([u,C.cb,t,C.cb,s,r,C.bm,A.cj(A.b([A.aL4(n,!1,n,n,n,!1,n,n,o.y?n:new B.aCU(o),n,n,n,n,n,!1,q),A.dB(new A.ar(C.rJ,A.hh(C.bp,A.b([A.v(e.gpr(),n,n,n,n,A.nc(d,13,1.5),n,n),A.h8(!1,n,!0,A.v(e.gpq(),n,n,n,n,A.nc(d,13,1.5).awC(f.b,C.dD,C.a2),n,n),n,!0,n,n,n,n,n,n,n,n,n,new B.aCV(d),n,n,n,n,n,n,n),A.v(e.gps(),n,n,n,n,A.nc(d,13,1.5),n,n)],p),C.cm,0,0),n),1)],p),C.F,C.n,C.o,0)],p)
u=o.Q
if(u!=null)C.b.Y(q,A.b([C.al,A.v(e.i5(u),n,n,n,n,A.b_().$3$color$fontSize$fontWeight(f.fy,13,C.a2),n,n)],p))
q.push(C.cw)
u=o.y
t=u?n:new B.aCW(o,e)
s=u?A.c5(A.aPz(f.c,2),18,18):D.SX
q.push(A.aLy(s,A.v(u?e.goJ():e.goI(),n,n,n,n,n,n,n),t,n))
return A.aQH(A.b0(A.b([m,C.M,w,C.al,v,C.cw,new A.mw(A.b0(q,C.ao,C.n,C.o),18,C.jr,n)],p),C.ao,C.n,C.o),o.d)},
Wo(d,e,f,g,h,i,j){var w=null,v=this.y,u=i?j:w
return A.aT9(d,A.QD(w,C.kU,w,w,w,w,w,w,!0,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,e,w,w,w,w,w,!0,w,w,g,!0,!0,!1,w,w,w,w,w,w,w,w,w,w,w,w,w,w),!v,f,h,u)},
Wn(d,e,f,g,h){return this.Wo(d,e,f,g,1,!0,h)},
ahc(d,e,f,g,h,i){return this.Wo(d,e,f,g,h,i,null)}}
var z=a.updateTypes([])
B.aJp.prototype={
$1(d){return d.a_e("GET",this.a,this.b)},
$S:210}
B.aCY.prototype={
$0(){var w=this.a
w.Q=null
w.z=!1},
$S:0}
B.aCZ.prototype={
$0(){return this.a.Q="consent_required"},
$S:0}
B.aD_.prototype={
$0(){return this.a.y=!0},
$S:0}
B.aD0.prototype={
$0(){var w,v=this.a
v.y=!1
w=this.b
if(w.a){v.z=!0
v.e.m2(C.pk)
v.f.m2(C.pk)
v.r.m2(C.pk)
v.x=!1}else{w=w.b
v.Q=w==null?"server_error":w}},
$S:0}
B.aCX.prototype={
$0(){var w,v=this.a
if(A.c0(v,!1).wH())A.c0(v,!1).dg()
else{w=x.X
A.c0(v,!1).a65("/",w,w)}},
$S:0}
B.aCS.prototype={
$1(d){if(C.c.c0(d).length<2)return this.a.i5("name_invalid")
return null},
$S:48}
B.aCT.prototype={
$1(d){var w=C.c.c0(d)
if(!C.c.n(w,"@")||!C.c.n(w,"."))return this.a.i5("email_invalid")
return null},
$S:48}
B.aCU.prototype={
$1(d){var w=this.a
return w.U(new B.aCR(w,d))},
$S:43}
B.aCR.prototype={
$0(){return this.a.x=this.b===!0},
$S:0}
B.aCV.prototype={
$0(){return A.c0(this.a,!1).lG("/politica-privacidade-site",x.X)},
$S:0}
B.aCW.prototype={
$0(){return this.a.By(this.b)},
$S:0};(function inheritance(){var w=a.inheritMany,v=a.inherit
w(A.jt,[B.aJp,B.aCS,B.aCT,B.aCU])
v(B.ara,A.M)
w(B.ara,[B.aFC,B.aFA,B.aFB])
v(B.l_,A.T)
v(B.a3v,A.W)
w(A.ju,[B.aCY,B.aCZ,B.aD_,B.aD0,B.aCX,B.aCR,B.aCV,B.aCW])})()
A.tF(b.typeUniverse,JSON.parse('{"l_":{"T":[],"e":[]},"a3v":{"W":["l_"]}}'))
var y={b:"https://perfectgest-leads-api-2ztg.onrender.com/api/leads"}
var x=(function rtii(){var w=A.a4
return{L:w("ce"),p:w("t<e>"),m:w("b5<va>"),d:w("d3"),f:w("bg<@,@>"),w:w("fO"),K:w("M"),q:w("rG"),N:w("l"),l:w("ln"),X:w("M?"),T:w("l?"),H:w("~")}})();(function constants(){D.LY=new A.a6(0,520,0,1/0)
D.NK=new B.aFA()
D.NL=new B.aFB()
D.NM=new B.aFC()
D.Qh=new A.aU(12e6)
D.QB=new A.aU(9e7)
D.SX=new A.cJ(C.ty,18,null,null,null)
D.TF=new A.qy(null,null,null,"Website",null,null,null,null,null,null,null,null,null,null,null,null,!0,!0,!1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,!0,null,null,null,null)
D.tM=new A.d3(!1,"api_not_deployed")
D.Ua=new A.d3(!1,"api_unavailable")})()};
(a=>{a["g6IQzT4xPVUA33omlcSC+Iv9i14="]=a.current})($__dart_deferred_initializers__);