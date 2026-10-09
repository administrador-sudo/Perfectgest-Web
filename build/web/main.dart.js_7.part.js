((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,E,B={
bbW(d){return A.a99(new B.aKq(d,null),x.q)},
aKq:function aKq(d,e){this.a=d
this.b=e},
b5U(d){switch(d.ai(x.l).r.f.gcA()){case"en":return D.Oe
case"es":return D.Of
case"pt":default:return D.Og}},
as5:function as5(){},
aGx:function aGx(){},
aGv:function aGv(){},
aGw:function aGw(){},
aT6(d){return new B.l0(d,null)},
l0:function l0(d,e){this.c=d
this.a=e},
a4l:function a4l(d,e,f,g,h){var _=this
_.d=d
_.e=e
_.f=f
_.r=g
_.w=h
_.z=_.y=_.x=!1
_.c=_.a=_.Q=null},
aDF:function aDF(d){this.a=d},
aDG:function aDG(d){this.a=d},
aDH:function aDH(d){this.a=d},
aDI:function aDI(d,e){this.a=d
this.b=e},
aDE:function aDE(d){this.a=d},
aDz:function aDz(d){this.a=d},
aDA:function aDA(d){this.a=d},
aDB:function aDB(d){this.a=d},
aDy:function aDy(d,e){this.a=d
this.b=e},
aDC:function aDC(d){this.a=d},
aDD:function aDD(d,e){this.a=d
this.b=e},
aii(){var w=0,v=A.Q(x.T),u,t=2,s=[],r,q,p,o,n,m,l
var $async$aii=A.M(function(d,e){if(d===1){s.push(e)
w=t}for(;;)switch(w){case 0:t=4
o=C.c.hN(y.b,"/api/")
w=7
return A.T(B.bbW(A.di(o>=0?C.c.a1(y.b,0,o)+"/health":"https://perfectgest-leads-api-2ztg.onrender.com/api/leads/health",0,null)).yP(D.QM),$async$aii)
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
m=A.av(l)
if(m instanceof A.kw){u="api_not_deployed"
w=1
break}else if(x.L.b(m)){q=m
p=J.es(q)
if(J.lC(p,"TimeoutException")||J.lC(p,"timed out")){u="api_waking"
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
return A.P($async$aii,v)},
Rv(d,e,f,g,h,i){var w=!1
return B.b3p(d,e,f,g,h,i)},
b3p(a0,a1,a2,a3,a4,a5){var w=0,v=A.Q(x.d),u,t=2,s=[],r,q,p,o,n,m,l,k,j,i,h,g,f,e,d
var $async$Rv=A.M(function(a7,a8){if(a7===1){s.push(a8)
w=t}for(;;)switch(w){case 0:e=!1
if(!a1){u=C.tH
w=1
break}r=C.c.da(a4)
q=C.c.da(a2)
if(J.cF(r)<2){u=C.tJ
w=1
break}if(!B.b3o(q)){u=C.tI
w=1
break}w=3
return A.T(B.aii(),$async$Rv)
case 3:h=a8
if(h==="api_waking")A.fT().$1("[LeadCapture] Cold start detectado \u2014 aguardando...")
else if(h!=null){A.fT().$1("[LeadCapture] Health check falhou: "+h)
u=new A.f0(!1,h)
w=1
break}t=5
w=8
return A.T(A.aP2(A.di(y.b,0,null),C.ci.Du(A.aA(["nome",r,"email",q,"comentario",C.c.da(a0),"consent",!0,"locale",a3,"website",a5,"copiaUsuario",e],x.N,x.K),null),C.Ev).yP(D.R4),$async$Rv)
case 8:p=a8
if(p.b>=200&&p.b<300){o=!1
try{g=p
n=C.ci.wZ(A.LP(A.LE(g.e)).f1(g.w),null)
if(x.f.b(n)&&J.d(n.h(0,"copySent"),!0))o=!0}catch(a6){o=!1}u=new A.f0(!0,null)
w=1
break}if(p.b===503){u=D.Uk
w=1
break}if(p.b===404){u=D.tF
w=1
break}g=p
A.fT().$1("[LeadCapture] HTTP "+p.b+": "+A.LP(A.LE(g.e)).f1(g.w))
u=C.jO
w=1
break
t=2
w=7
break
case 5:t=4
d=s.pop()
g=A.av(d)
if(g instanceof A.kw){m=g
l=A.aS(d)
A.fT().$1("[LeadCapture] ClientException: "+A.j(m)+"\n"+A.j(l))
u=D.tF
w=1
break}else if(x.L.b(g)){k=g
j=A.aS(d)
i=J.es(k)
if(J.lC(i,"TimeoutException")||J.lC(i,"timed out")){u=C.tG
w=1
break}A.fT().$1("[LeadCapture] "+A.j(k)+"\n"+A.j(j))
u=C.jN
w=1
break}else throw d
w=7
break
case 4:w=2
break
case 7:case 1:return A.O(u,v)
case 2:return A.N(s.at(-1),v)}})
return A.P($async$Rv,v)},
b3o(d){var w,v=d.length
if(v<5||v>254)return!1
w=C.c.hN(d,"@")
if(w<=0||w>=v-1)return!1
return C.c.jl(d,".",w+1)>w}},D
J=c[1]
A=c[0]
C=c[2]
E=c[12]
B=a.updateHolder(c[5],B)
D=c[18]
B.as5.prototype={}
B.aGx.prototype={
gey(){return"Pre-cadastro Perfect Gest Dev"},
gi5(){return"Pre-cadastro"},
gP9(){return"Deixe seu contato"},
gPY(){return"Informe nome e e-mail para receber novidades sobre PerfectGest e solu\xe7\xf5es Perfect Gest Dev."},
gRp(){return"Parte deste pr\xe9-cadastro destina-se a convites para o nosso programa de pr\xe9-lan\xe7amento: acesso integral \xe0s vers\xf5es em desenvolvimento dos aplicativos, com oportunidade de testar funcionalidades em antecipa\xe7\xe3o e contribuir com feedback que orienta a evolu\xe7\xe3o do produto antes do lan\xe7amento p\xfablico."},
gOq(){return"Nome"},
gOp(){return"Seu nome completo"},
gOo(){return"E-mail"},
gOn(){return"seu@email.com"},
gOm(){return"Coment\xe1rio"},
gOl(){return"Opcional \u2014 como podemos ajudar?"},
gpR(){return"Li e aceito a "},
gpQ(){return"pol\xedtica de privacidade"},
gpS(){return" e autorizo o contacto sobre novidades, convites de pr\xe9-lan\xe7amento e servi\xe7os indicados."},
gp8(){return"Enviar pre-cadastro"},
gp9(){return"Enviando\u2026"},
gpb(){return"Pre-cadastro recebido"},
gpa(){return"Obrigado! Entraremos em contacto em breve no e-mail informado."},
iC(d){var w
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
gMb(){return"Voltar ao in\xedcio"}}
B.aGv.prototype={
gey(){return"Pre-registration Perfect Gest Dev"},
gi5(){return"Pre-registration"},
gP9(){return"Leave your contact details"},
gPY(){return"Enter your name and email to receive updates about PerfectGest and Perfect Gest Dev solutions."},
gRp(){return"Pre-registration also enables us to invite selected participants to our pre-launch program: full access to in-development app builds, early feature testing, and feedback that helps shape the product before public release."},
gOq(){return"Name"},
gOp(){return"Your full name"},
gOo(){return"Email"},
gOn(){return"you@email.com"},
gOm(){return"Comment"},
gOl(){return"Optional \u2014 how can we help?"},
gpR(){return"I have read and accept the "},
gpQ(){return"privacy policy"},
gpS(){return" and authorize contact about updates, pre-launch invitations, and the services mentioned."},
gp8(){return"Submit pre-registration"},
gp9(){return"Sending\u2026"},
gpb(){return"Pre-registration received"},
gpa(){return"Thank you! We will contact you soon at the email provided."},
iC(d){var w
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
gMb(){return"Back to home"}}
B.aGw.prototype={
gey(){return"Pre-registro Perfect Gest Dev"},
gi5(){return"Pre-registro"},
gP9(){return"Deje su contacto"},
gPY(){return"Indique nombre y correo para recibir novedades sobre PerfectGest y soluciones Perfect Gest Dev."},
gRp(){return"Parte de este pre-registro sirve para invitar a participantes seleccionados al programa de prelanzamiento: acceso completo a las versiones en desarrollo de las aplicaciones, prueba anticipada de funcionalidades y retroalimentaci\xf3n que orienta la evoluci\xf3n del producto antes del lanzamiento p\xfablico."},
gOq(){return"Nombre"},
gOp(){return"Su nombre completo"},
gOo(){return"Correo electr\xf3nico"},
gOn(){return"su@email.com"},
gOm(){return"Comentario"},
gOl(){return"Opcional \u2014 \xbfc\xf3mo podemos ayudar?"},
gpR(){return"He le\xeddo y acepto la "},
gpQ(){return"pol\xedtica de privacidad"},
gpS(){return" y autorizo el contacto sobre novedades, invitaciones de prelanzamiento y los servicios indicados."},
gp8(){return"Enviar pre-registro"},
gp9(){return"Enviando\u2026"},
gpb(){return"Pre-registro recibido"},
gpa(){return"\xa1Gracias! Le contactaremos pronto en el correo indicado."},
iC(d){var w
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
gMb(){return"Volver al inicio"}}
B.l0.prototype={
a8(){var w=$.ar()
return new B.a4l(new A.b5(null,x.m),new A.ik(C.cN,w),new A.ik(C.cN,w),new A.ik(C.cN,w),new A.ik(C.cN,w))}}
B.a4l.prototype={
ao(){this.aO()
A.kf()
A.e5("description","Pre-cadastro Perfect Gest Dev: deixe nome, e-mail e comentario para receber novidades sobre apps Flutter, web e integracoes Java.")
A.e5("keywords","Perfect Gest Dev, pre-cadastro, newsletter, Flutter, software house, contato, leads")
A.e5("robots","index, follow")
A.d2("og:title","Pre-cadastro | Perfect Gest Dev")
A.d2("og:description","Formulario rapido para acompanhar lancamentos e solucoes da Perfect Gest Dev.")
A.d2("og:type","website")
A.d2("og:locale","pt_BR")
b.G.document.title="Pre-cadastro | Perfect Gest Dev"},
l(){var w=this,v=w.e,u=v.P$=$.ar()
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
A.px()
w.aA()},
BJ(d){return this.asK(d)},
asK(d){var w=0,v=A.Q(x.H),u,t=this,s,r,q,p
var $async$BJ=A.M(function(e,f){if(e===1)return A.N(f,v)
for(;;)switch(w){case 0:if(t.y){w=1
break}t.a7(new B.aDF(t))
if(!t.x){t.a7(new B.aDG(t))
w=1
break}s=t.d.gT()
s=s==null?null:s.z0()
if(s!==!0){w=1
break}t.a7(new B.aDH(t))
r=t.c.ai(x.l).r.f.kB("-")
s=t.e.a.a
q=t.f.a.a
w=3
return A.T(B.Rv(t.r.a.a,t.x,q,r,s,t.w.a.a),$async$BJ)
case 3:p=f
if(t.c==null){w=1
break}t.a7(new B.aDI(t,p))
case 1:return A.O(u,v)}})
return A.P($async$BJ,v)},
E(d){var w=this,v=null,u=A.w(d).ax,t=A.b6(d,C.aq,x.w).w.a.a<400?16:24,s=B.b5U(d),r=s.gey(),q=A.w(d).ax.a===C.D?C.by:C.bf,p=s.gi5()
p=E.aLf(d,v,w.a.c,p)
return A.aG(v,v,v,A.iZ(p,q,new A.jR(A.h6(A.dF(new A.cP(D.LY,w.z?w.af_(d,s,u):w.aeP(d,s,u),v),v,v),v,new A.a6(t,16,t,28),C.ad),v),v,v),!1,v,v,v,!1,v,v,v,v,v,v,v,v,v,r,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,C.o,v)},
af_(d,e,f){var w=null
return new A.mA(A.be(A.b([A.cB(C.tp,f.b,w,48),C.bu,A.u8(d,e.gpb(),w,20),C.aC,A.G(e.gpa(),w,w,w,w,A.ng(d,15,1.5),w,w),C.p1,A.aMm(A.G(e.gMb(),w,w,w,w,w,w,w),new B.aDE(d),w)],x.p),C.aH,C.n,C.q),18,C.jj,w)},
aeP(d,e,f){var w,v,u,t,s,r,q,p,o=this,n=null,m=e.gP9()
m=A.u8(d,m,n,A.b6(d,C.aq,x.w).w.a.a<400?18:22)
w=A.G(e.gPY(),n,n,n,n,A.ng(d,15,1.5),n,n)
v=A.G(e.gRp(),n,n,n,n,A.ng(d,13.5,1.5).ax7(f.k3.af(0.82),1.5),n,n)
u=e.gOq()
u=o.WC(o.e,e.gOp(),C.Kg,u,new B.aDz(e))
t=e.gOo()
t=o.WC(o.f,e.gOn(),C.pb,t,new B.aDA(e))
s=e.gOm()
s=o.ahM(o.r,e.gOl(),C.lp,s,4,!1)
r=A.Dh(A.c7(A.aNy(n,C.ds,!1,n,!0,C.X,n,A.aXU(),o.w,n,n,n,n,n,2,D.TO,C.aM,!0,n,!0,n,!1,n,C.eI,n,n,n,n,n,n,n,n,1,n,n,!1,"\u2022",n,n,n,n,n,!1,n,n,!1,n,!0,n,C.ji,n,n,n,n,n,n,n,n,n,n,n,n,!0,C.bj,n,C.p7,n,n,n,n),0,n),0)
q=o.x
p=x.p
q=A.b([u,C.ce,t,C.ce,s,r,C.bu,A.cS(A.b([A.aLU(n,!1,n,n,n,!1,n,n,o.y?n:new B.aDB(o),n,n,n,n,n,!1,q),A.ee(new A.aC(C.rE,A.he(C.bk,A.b([A.G(e.gpR(),n,n,n,n,A.ng(d,13,1.5),n,n),A.hw(!1,n,!0,A.G(e.gpQ(),n,n,n,n,A.ng(d,13,1.5).axj(f.b,C.dC,C.a4),n,n),n,!0,n,n,n,n,n,n,n,n,n,new B.aDC(d),n,n,n,n,n,n,n),A.G(e.gpS(),n,n,n,n,A.ng(d,13,1.5),n,n)],p),C.cf,0,0),n),1)],p),C.I,C.n,C.q,0)],p)
u=o.Q
if(u!=null)C.b.Z(q,A.b([C.aC,A.G(e.iC(u),n,n,n,n,A.b2().$3$color$fontSize$fontWeight(f.fy,13,C.a4),n,n)],p))
q.push(C.cq)
u=o.y
t=u?n:new B.aDD(o,e)
s=u?A.c7(A.aQC(f.c,2),18,18):D.T8
q.push(A.aMn(s,A.G(u?e.gp9():e.gp8(),n,n,n,n,n,n,n),t,n))
return A.aRL(A.be(A.b([m,C.Z,w,C.aC,v,C.cq,new A.mA(A.be(q,C.aH,C.n,C.q),18,C.jj,n)],p),C.aH,C.n,C.q),o.d)},
WD(d,e,f,g,h,i,j){var w=null,v=this.y,u=i?j:w
return A.aUc(d,A.ahw(w,C.og,w,w,w,w,w,w,!0,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,e,w,w,w,w,w,!0,w,w,g,!0,!0,!1,w,w,w,w,w,w,w,w,w,w,w,w,w,w),!v,f,h,u)},
WC(d,e,f,g,h){return this.WD(d,e,f,g,1,!0,h)},
ahM(d,e,f,g,h,i){return this.WD(d,e,f,g,h,i,null)}}
var z=a.updateTypes([])
B.aKq.prototype={
$1(d){return d.a_x("GET",this.a,this.b)},
$S:216}
B.aDF.prototype={
$0(){var w=this.a
w.Q=null
w.z=!1},
$S:0}
B.aDG.prototype={
$0(){return this.a.Q="consent_required"},
$S:0}
B.aDH.prototype={
$0(){return this.a.y=!0},
$S:0}
B.aDI.prototype={
$0(){var w,v=this.a
v.y=!1
w=this.b
if(w.a){v.z=!0
v.e.nv(C.p8)
v.f.nv(C.p8)
v.r.nv(C.p8)
v.x=!1}else{w=w.b
v.Q=w==null?"server_error":w}},
$S:0}
B.aDE.prototype={
$0(){var w,v=this.a
if(A.cb(v,!1).wF())A.cb(v,!1).ds()
else{w=x.X
A.cb(v,!1).a6o("/",w,w)}},
$S:0}
B.aDz.prototype={
$1(d){if(C.c.da(d==null?"":d).length<2)return this.a.iC("name_invalid")
return null},
$S:47}
B.aDA.prototype={
$1(d){var w=C.c.da(d==null?"":d)
if(!C.c.n(w,"@")||!C.c.n(w,"."))return this.a.iC("email_invalid")
return null},
$S:47}
B.aDB.prototype={
$1(d){var w=this.a
return w.a7(new B.aDy(w,d))},
$S:49}
B.aDy.prototype={
$0(){return this.a.x=this.b===!0},
$S:0}
B.aDC.prototype={
$0(){return A.cb(this.a,!1).lW("/politica-privacidade-site",x.X)},
$S:0}
B.aDD.prototype={
$0(){return this.a.BJ(this.b)},
$S:0};(function inheritance(){var w=a.inheritMany,v=a.inherit
w(A.jo,[B.aKq,B.aDz,B.aDA,B.aDB])
v(B.as5,A.L)
w(B.as5,[B.aGx,B.aGv,B.aGw])
v(B.l0,A.S)
v(B.a4l,A.V)
w(A.jp,[B.aDF,B.aDG,B.aDH,B.aDI,B.aDE,B.aDy,B.aDC,B.aDD])})()
A.tW(b.typeUniverse,JSON.parse('{"l0":{"S":[],"e":[]},"a4l":{"V":["l0"]}}'))
var y={b:"https://perfectgest-leads-api-2ztg.onrender.com/api/leads"}
var x=(function rtii(){var w=A.a4
return{L:w("cq"),p:w("x<e>"),m:w("b5<vl>"),d:w("f0"),f:w("bl<@,@>"),w:w("fH"),K:w("L"),q:w("rR"),N:w("n"),l:w("lp"),X:w("L?"),T:w("n?"),H:w("~")}})();(function constants(){D.LY=new A.a3(0,520,0,1/0)
D.Oe=new B.aGv()
D.Of=new B.aGw()
D.Og=new B.aGx()
D.QM=new A.aU(12e6)
D.R4=new A.aU(9e7)
D.T8=new A.dg(C.tq,18,null,null,null)
D.TO=new A.qK(null,null,null,"Website",null,null,null,null,null,null,null,null,null,null,null,null,!0,!0,!1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,!0,null,null,null,null)
D.tF=new A.f0(!1,"api_not_deployed")
D.Uk=new A.f0(!1,"api_unavailable")})()};
(a=>{a["IFrV8LDPZu4MEWW8LLXsC6+cJnk="]=a.current})($__dart_deferred_initializers__);