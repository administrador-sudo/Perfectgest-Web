((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,E,B={
bb5(d){return A.a8H(new B.aJF(d,null),x.q)},
aJF:function aJF(d,e){this.a=d
this.b=e},
b52(d){switch(d.ai(x.l).r.f.gcv()){case"en":return D.Ob
case"es":return D.Oc
case"pt":default:return D.Od}},
arE:function arE(){},
aFP:function aFP(){},
aFN:function aFN(){},
aFO:function aFO(){},
aSk(d){return new B.kX(d,null)},
kX:function kX(d,e){this.c=d
this.a=e},
a3Y:function a3Y(d,e,f,g,h){var _=this
_.d=d
_.e=e
_.f=f
_.r=g
_.w=h
_.z=_.y=_.x=!1
_.c=_.a=_.Q=null},
aDd:function aDd(d){this.a=d},
aDe:function aDe(d){this.a=d},
aDf:function aDf(d){this.a=d},
aDg:function aDg(d,e){this.a=d
this.b=e},
aDc:function aDc(d){this.a=d},
aD7:function aD7(d){this.a=d},
aD8:function aD8(d){this.a=d},
aD9:function aD9(d){this.a=d},
aD6:function aD6(d,e){this.a=d
this.b=e},
aDa:function aDa(d){this.a=d},
aDb:function aDb(d,e){this.a=d
this.b=e},
ahP(){var w=0,v=A.Q(x.T),u,t=2,s=[],r,q,p,o,n,m,l
var $async$ahP=A.M(function(d,e){if(d===1){s.push(e)
w=t}for(;;)switch(w){case 0:t=4
o=C.c.hI(y.b,"/api/")
w=7
return A.S(B.bb5(A.di(o>=0?C.c.a1(y.b,0,o)+"/health":"https://perfectgest-leads-api-2ztg.onrender.com/api/leads/health",0,null)).yE(D.QJ),$async$ahP)
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
m=A.au(l)
if(m instanceof A.kt){u="api_not_deployed"
w=1
break}else if(x.L.b(m)){q=m
p=J.er(q)
if(J.lx(p,"TimeoutException")||J.lx(p,"timed out")){u="api_waking"
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
return A.P($async$ahP,v)},
R9(d,e,f,g,h,i){var w=!1
return B.b2z(d,e,f,g,h,i)},
b2z(a0,a1,a2,a3,a4,a5){var w=0,v=A.Q(x.d),u,t=2,s=[],r,q,p,o,n,m,l,k,j,i,h,g,f,e,d
var $async$R9=A.M(function(a7,a8){if(a7===1){s.push(a8)
w=t}for(;;)switch(w){case 0:e=!1
if(!a1){u=C.tD
w=1
break}r=C.c.d8(a4)
q=C.c.d8(a2)
if(J.cF(r)<2){u=C.tF
w=1
break}if(!B.b2y(q)){u=C.tE
w=1
break}w=3
return A.S(B.ahP(),$async$R9)
case 3:h=a8
if(h==="api_waking")A.fR().$1("[LeadCapture] Cold start detectado \u2014 aguardando...")
else if(h!=null){A.fR().$1("[LeadCapture] Health check falhou: "+h)
u=new A.f_(!1,h)
w=1
break}t=5
w=8
return A.S(A.aOg(A.di(y.b,0,null),C.ch.De(A.aA(["nome",r,"email",q,"comentario",C.c.d8(a0),"consent",!0,"locale",a3,"website",a5,"copiaUsuario",e],x.N,x.K),null),C.Er).yE(D.R1),$async$R9)
case 8:p=a8
if(p.b>=200&&p.b<300){o=!1
try{g=p
n=C.ch.wS(A.Lt(A.Li(g.e)).eZ(g.w),null)
if(x.f.b(n)&&J.d(n.h(0,"copySent"),!0))o=!0}catch(a6){o=!1}u=new A.f_(!0,null)
w=1
break}if(p.b===503){u=D.Uj
w=1
break}if(p.b===404){u=D.tB
w=1
break}g=p
A.fR().$1("[LeadCapture] HTTP "+p.b+": "+A.Lt(A.Li(g.e)).eZ(g.w))
u=C.jL
w=1
break
t=2
w=7
break
case 5:t=4
d=s.pop()
g=A.au(d)
if(g instanceof A.kt){m=g
l=A.aQ(d)
A.fR().$1("[LeadCapture] ClientException: "+A.j(m)+"\n"+A.j(l))
u=D.tB
w=1
break}else if(x.L.b(g)){k=g
j=A.aQ(d)
i=J.er(k)
if(J.lx(i,"TimeoutException")||J.lx(i,"timed out")){u=C.tC
w=1
break}A.fR().$1("[LeadCapture] "+A.j(k)+"\n"+A.j(j))
u=C.jK
w=1
break}else throw d
w=7
break
case 4:w=2
break
case 7:case 1:return A.O(u,v)
case 2:return A.N(s.at(-1),v)}})
return A.P($async$R9,v)},
b2y(d){var w,v=d.length
if(v<5||v>254)return!1
w=C.c.hI(d,"@")
if(w<=0||w>=v-1)return!1
return C.c.jh(d,".",w+1)>w}},D
J=c[1]
A=c[0]
C=c[2]
E=c[12]
B=a.updateHolder(c[5],B)
D=c[18]
B.arE.prototype={}
B.aFP.prototype={
gew(){return"Pre-cadastro Perfect Gest Dev"},
gi0(){return"Pre-cadastro"},
gOQ(){return"Deixe seu contato"},
gPD(){return"Informe nome e e-mail para receber novidades sobre PerfectGest e solu\xe7\xf5es Perfect Gest Dev."},
gR2(){return"Parte deste pr\xe9-cadastro destina-se a convites para o nosso programa de pr\xe9-lan\xe7amento: acesso integral \xe0s vers\xf5es em desenvolvimento dos aplicativos, com oportunidade de testar funcionalidades em antecipa\xe7\xe3o e contribuir com feedback que orienta a evolu\xe7\xe3o do produto antes do lan\xe7amento p\xfablico."},
gO6(){return"Nome"},
gO5(){return"Seu nome completo"},
gO4(){return"E-mail"},
gO3(){return"seu@email.com"},
gO2(){return"Coment\xe1rio"},
gO1(){return"Opcional \u2014 como podemos ajudar?"},
gpA(){return"Li e aceito a "},
gpz(){return"pol\xedtica de privacidade"},
gpB(){return" e autorizo o contacto sobre novidades, convites de pr\xe9-lan\xe7amento e servi\xe7os indicados."},
goO(){return"Enviar pre-cadastro"},
goP(){return"Enviando\u2026"},
goR(){return"Pre-cadastro recebido"},
goQ(){return"Obrigado! Entraremos em contacto em breve no e-mail informado."},
iw(d){var w
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
gLR(){return"Voltar ao in\xedcio"}}
B.aFN.prototype={
gew(){return"Pre-registration Perfect Gest Dev"},
gi0(){return"Pre-registration"},
gOQ(){return"Leave your contact details"},
gPD(){return"Enter your name and email to receive updates about PerfectGest and Perfect Gest Dev solutions."},
gR2(){return"Pre-registration also enables us to invite selected participants to our pre-launch program: full access to in-development app builds, early feature testing, and feedback that helps shape the product before public release."},
gO6(){return"Name"},
gO5(){return"Your full name"},
gO4(){return"Email"},
gO3(){return"you@email.com"},
gO2(){return"Comment"},
gO1(){return"Optional \u2014 how can we help?"},
gpA(){return"I have read and accept the "},
gpz(){return"privacy policy"},
gpB(){return" and authorize contact about updates, pre-launch invitations, and the services mentioned."},
goO(){return"Submit pre-registration"},
goP(){return"Sending\u2026"},
goR(){return"Pre-registration received"},
goQ(){return"Thank you! We will contact you soon at the email provided."},
iw(d){var w
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
gLR(){return"Back to home"}}
B.aFO.prototype={
gew(){return"Pre-registro Perfect Gest Dev"},
gi0(){return"Pre-registro"},
gOQ(){return"Deje su contacto"},
gPD(){return"Indique nombre y correo para recibir novedades sobre PerfectGest y soluciones Perfect Gest Dev."},
gR2(){return"Parte de este pre-registro sirve para invitar a participantes seleccionados al programa de prelanzamiento: acceso completo a las versiones en desarrollo de las aplicaciones, prueba anticipada de funcionalidades y retroalimentaci\xf3n que orienta la evoluci\xf3n del producto antes del lanzamiento p\xfablico."},
gO6(){return"Nombre"},
gO5(){return"Su nombre completo"},
gO4(){return"Correo electr\xf3nico"},
gO3(){return"su@email.com"},
gO2(){return"Comentario"},
gO1(){return"Opcional \u2014 \xbfc\xf3mo podemos ayudar?"},
gpA(){return"He le\xeddo y acepto la "},
gpz(){return"pol\xedtica de privacidad"},
gpB(){return" y autorizo el contacto sobre novedades, invitaciones de prelanzamiento y los servicios indicados."},
goO(){return"Enviar pre-registro"},
goP(){return"Enviando\u2026"},
goR(){return"Pre-registro recibido"},
goQ(){return"\xa1Gracias! Le contactaremos pronto en el correo indicado."},
iw(d){var w
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
gLR(){return"Volver al inicio"}}
B.kX.prototype={
ab(){var w=$.av()
return new B.a3Y(new A.b5(null,x.m),new A.ij(C.cK,w),new A.ij(C.cK,w),new A.ij(C.cK,w),new A.ij(C.cK,w))}}
B.a3Y.prototype={
ap(){this.aP()
A.kd()
A.e4("description","Pre-cadastro Perfect Gest Dev: deixe nome, e-mail e comentario para receber novidades sobre apps Flutter, web e integracoes Java.")
A.e4("keywords","Perfect Gest Dev, pre-cadastro, newsletter, Flutter, software house, contato, leads")
A.e4("robots","index, follow")
A.d1("og:title","Pre-cadastro | Perfect Gest Dev")
A.d1("og:description","Formulario rapido para acompanhar lancamentos e solucoes da Perfect Gest Dev.")
A.d1("og:type","website")
A.d1("og:locale","pt_BR")
b.G.document.title="Pre-cadastro | Perfect Gest Dev"},
l(){var w=this,v=w.e,u=v.P$=$.av()
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
A.pr()
w.aJ()},
Bw(d){return this.arT(d)},
arT(d){var w=0,v=A.Q(x.H),u,t=this,s,r,q,p
var $async$Bw=A.M(function(e,f){if(e===1)return A.N(f,v)
for(;;)switch(w){case 0:if(t.y){w=1
break}t.a7(new B.aDd(t))
if(!t.x){t.a7(new B.aDe(t))
w=1
break}s=t.d.gS()
s=s==null?null:s.yQ()
if(s!==!0){w=1
break}t.a7(new B.aDf(t))
r=t.c.ai(x.l).r.f.kw("-")
s=t.e.a.a
q=t.f.a.a
w=3
return A.S(B.R9(t.r.a.a,t.x,q,r,s,t.w.a.a),$async$Bw)
case 3:p=f
if(t.c==null){w=1
break}t.a7(new B.aDg(t,p))
case 1:return A.O(u,v)}})
return A.P($async$Bw,v)},
D(d){var w=this,v=null,u=A.x(d).ax,t=A.b6(d,C.aq,x.w).w.a.a<400?16:24,s=B.b52(d),r=s.gew(),q=A.x(d).ax.a===C.E?C.bw:C.bd,p=s.gi0()
p=E.aKu(d,v,w.a.c,p)
return A.aH(v,v,v,A.ia(p,q,new A.jP(A.h4(A.dA(new A.cO(D.LV,w.z?w.aem(d,s,u):w.aeb(d,s,u),v),v,v),v,new A.a6(t,16,t,28),C.ad),v),v,v),!1,v,v,v,!1,v,v,v,v,v,v,v,v,r,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,C.o,v)},
aem(d,e,f){var w=null
return new A.mx(A.bd(A.b([A.cw(C.tl,f.b,w,48),C.bs,A.u0(d,e.goR(),w,20),C.aw,A.F(e.goQ(),w,w,w,w,A.nc(d,15,1.5),w,w),C.oZ,A.aej(A.F(e.gLR(),w,w,w,w,w,w,w),new B.aDc(d),w)],x.p),C.aG,C.n,C.q),18,C.jg,w)},
aeb(d,e,f){var w,v,u,t,s,r,q,p,o=this,n=null,m=e.gOQ()
m=A.u0(d,m,n,A.b6(d,C.aq,x.w).w.a.a<400?18:22)
w=A.F(e.gPD(),n,n,n,n,A.nc(d,15,1.5),n,n)
v=A.F(e.gR2(),n,n,n,n,A.nc(d,13.5,1.5).awb(f.k3.ae(0.82),1.5),n,n)
u=e.gO6()
u=o.Wa(o.e,e.gO5(),C.Kd,u,new B.aD7(e))
t=e.gO4()
t=o.Wa(o.f,e.gO3(),C.p8,t,new B.aD8(e))
s=e.gO2()
s=o.ah6(o.r,e.gO1(),C.lp,s,4,!1)
r=A.D1(A.c6(A.aML(n,C.dp,!1,n,!0,C.V,n,A.aX2(),o.w,n,n,n,n,n,2,D.TN,C.aM,!0,n,!0,n,!1,n,C.eF,n,n,n,n,n,n,n,n,1,n,n,!1,"\u2022",n,n,n,n,n,!1,n,n,!1,n,!0,n,C.jf,n,n,n,n,n,n,n,n,n,n,n,n,!0,C.bh,n,C.p4,n,n,n,n),0,n),0)
q=o.x
p=x.p
q=A.b([u,C.ce,t,C.ce,s,r,C.bs,A.cR(A.b([A.aL8(n,!1,n,n,n,!1,n,n,o.y?n:new B.aD9(o),n,n,n,n,n,!1,q),A.ed(new A.aB(C.rA,A.hb(C.bi,A.b([A.F(e.gpA(),n,n,n,n,A.nc(d,13,1.5),n,n),A.ht(!1,n,!0,A.F(e.gpz(),n,n,n,n,A.nc(d,13,1.5).awn(f.b,C.dy,C.a3),n,n),n,!0,n,n,n,n,n,n,n,n,n,new B.aDa(d),n,n,n,n,n,n,n),A.F(e.gpB(),n,n,n,n,A.nc(d,13,1.5),n,n)],p),C.cf,0,0),n),1)],p),C.F,C.n,C.q,0)],p)
u=o.Q
if(u!=null)C.b.Y(q,A.b([C.aw,A.F(e.iw(u),n,n,n,n,A.b1().$3$color$fontSize$fontWeight(f.fy,13,C.a3),n,n)],p))
q.push(C.co)
u=o.y
t=u?n:new B.aDb(o,e)
s=u?A.c6(A.aPP(f.c,2),18,18):D.T7
q.push(A.aLB(s,A.F(u?e.goP():e.goO(),n,n,n,n,n,n,n),t,n))
return A.aQY(A.bd(A.b([m,C.Y,w,C.aw,v,C.co,new A.mx(A.bd(q,C.aG,C.n,C.q),18,C.jg,n)],p),C.aG,C.n,C.q),o.d)},
Wb(d,e,f,g,h,i,j){var w=null,v=this.y,u=i?j:w
return A.aTm(d,A.ah3(w,C.of,w,w,w,w,w,w,!0,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,e,w,w,w,w,w,!0,w,w,g,!0,!0,!1,w,w,w,w,w,w,w,w,w,w,w,w,w,w),!v,f,h,u)},
Wa(d,e,f,g,h){return this.Wb(d,e,f,g,1,!0,h)},
ah6(d,e,f,g,h,i){return this.Wb(d,e,f,g,h,i,null)}}
var z=a.updateTypes([])
B.aJF.prototype={
$1(d){return d.ZZ("GET",this.a,this.b)},
$S:229}
B.aDd.prototype={
$0(){var w=this.a
w.Q=null
w.z=!1},
$S:0}
B.aDe.prototype={
$0(){return this.a.Q="consent_required"},
$S:0}
B.aDf.prototype={
$0(){return this.a.y=!0},
$S:0}
B.aDg.prototype={
$0(){var w,v=this.a
v.y=!1
w=this.b
if(w.a){v.z=!0
v.e.n8(C.p5)
v.f.n8(C.p5)
v.r.n8(C.p5)
v.x=!1}else{w=w.b
v.Q=w==null?"server_error":w}},
$S:0}
B.aDc.prototype={
$0(){var w,v=this.a
if(A.cb(v,!1).wy())A.cb(v,!1).dq()
else{w=x.X
A.cb(v,!1).a5S("/",w,w)}},
$S:0}
B.aD7.prototype={
$1(d){if(C.c.d8(d==null?"":d).length<2)return this.a.iw("name_invalid")
return null},
$S:47}
B.aD8.prototype={
$1(d){var w=C.c.d8(d==null?"":d)
if(!C.c.q(w,"@")||!C.c.q(w,"."))return this.a.iw("email_invalid")
return null},
$S:47}
B.aD9.prototype={
$1(d){var w=this.a
return w.a7(new B.aD6(w,d))},
$S:53}
B.aD6.prototype={
$0(){return this.a.x=this.b===!0},
$S:0}
B.aDa.prototype={
$0(){return A.cb(this.a,!1).lE("/politica-privacidade-site",x.X)},
$S:0}
B.aDb.prototype={
$0(){return this.a.Bw(this.b)},
$S:0};(function inheritance(){var w=a.inheritMany,v=a.inherit
w(A.jm,[B.aJF,B.aD7,B.aD8,B.aD9])
v(B.arE,A.L)
w(B.arE,[B.aFP,B.aFN,B.aFO])
v(B.kX,A.T)
v(B.a3Y,A.V)
w(A.jn,[B.aDd,B.aDe,B.aDf,B.aDg,B.aDc,B.aD6,B.aDa,B.aDb])})()
A.tO(b.typeUniverse,JSON.parse('{"kX":{"T":[],"e":[]},"a3Y":{"V":["kX"]}}'))
var y={b:"https://perfectgest-leads-api-2ztg.onrender.com/api/leads"}
var x=(function rtii(){var w=A.a4
return{L:w("co"),p:w("w<e>"),m:w("b5<v9>"),d:w("f_"),f:w("bj<@,@>"),w:w("fG"),K:w("L"),q:w("rL"),N:w("n"),l:w("lk"),X:w("L?"),T:w("n?"),H:w("~")}})();(function constants(){D.LV=new A.a3(0,520,0,1/0)
D.Ob=new B.aFN()
D.Oc=new B.aFO()
D.Od=new B.aFP()
D.QJ=new A.aT(12e6)
D.R1=new A.aT(9e7)
D.T7=new A.df(C.tm,18,null,null,null)
D.TN=new A.qE(null,null,null,"Website",null,null,null,null,null,null,null,null,null,null,null,null,!0,!0,!1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,!0,null,null,null,null)
D.tB=new A.f_(!1,"api_not_deployed")
D.Uj=new A.f_(!1,"api_unavailable")})()};
(a=>{a["kAjvqi/DXoZa6JI/XWVC3hOQwI8="]=a.current})($__dart_deferred_initializers__);