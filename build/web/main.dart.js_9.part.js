((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,F,D,G,H,B={
bbY(d){return G.a9e(new B.aKr(d,null),x.q)},
aKr:function aKr(d,e){this.a=d
this.b=e},
b5W(d){switch(d.ai(x.l).r.f.gcA()){case"en":return E.Od
case"es":return E.Oe
case"pt":default:return E.Of}},
as6:function as6(){},
aGx:function aGx(){},
aGv:function aGv(){},
aGw:function aGw(){},
aT9(d){return new B.l8(d,null)},
l8:function l8(d,e){this.c=d
this.a=e},
a4q:function a4q(d,e,f,g,h){var _=this
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
aim(){var w=0,v=A.R(x.T),u,t=2,s=[],r,q,p,o,n,m,l
var $async$aim=A.N(function(d,e){if(d===1){s.push(e)
w=t}for(;;)switch(w){case 0:t=4
o=C.c.hN(y.b,"/api/")
w=7
return A.T(B.bbY(A.dk(o>=0?C.c.a1(y.b,0,o)+"/health":"https://perfectgest-leads-api-2ztg.onrender.com/api/leads/health",0,null)).yN(E.QK),$async$aim)
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
if(m instanceof A.kz){u="api_not_deployed"
w=1
break}else if(x.L.b(m)){q=m
p=J.ew(q)
if(J.lI(p,"TimeoutException")||J.lI(p,"timed out")){u="api_waking"
w=1
break}u="api_not_deployed"
w=1
break}else throw l
w=6
break
case 3:w=2
break
case 6:case 1:return A.P(u,v)
case 2:return A.O(s.at(-1),v)}})
return A.Q($async$aim,v)},
RB(d,e,f,g,h,i){var w=!1
return B.b3s(d,e,f,g,h,i)},
b3s(a0,a1,a2,a3,a4,a5){var w=0,v=A.R(x.d),u,t=2,s=[],r,q,p,o,n,m,l,k,j,i,h,g,f,e,d
var $async$RB=A.N(function(a7,a8){if(a7===1){s.push(a8)
w=t}for(;;)switch(w){case 0:e=!1
if(!a1){u=D.tH
w=1
break}r=C.c.da(a4)
q=C.c.da(a2)
if(J.cG(r)<2){u=D.tJ
w=1
break}if(!B.b3r(q)){u=D.tI
w=1
break}w=3
return A.T(B.aim(),$async$RB)
case 3:h=a8
if(h==="api_waking")A.fY().$1("[LeadCapture] Cold start detectado \u2014 aguardando...")
else if(h!=null){A.fY().$1("[LeadCapture] Health check falhou: "+h)
u=new F.f4(!1,h)
w=1
break}t=5
w=8
return A.T(G.aP4(A.dk(y.b,0,null),C.ci.Dr(A.aA(["nome",r,"email",q,"comentario",C.c.da(a0),"consent",!0,"locale",a3,"website",a5,"copiaUsuario",e],x.N,x.K),null),D.Ev).yN(E.R2),$async$RB)
case 8:p=a8
if(p.b>=200&&p.b<300){o=!1
try{g=p
n=C.ci.wZ(A.LV(A.LK(g.e)).f1(g.w),null)
if(x.f.b(n)&&J.d(n.h(0,"copySent"),!0))o=!0}catch(a6){o=!1}u=new F.f4(!0,null)
w=1
break}if(p.b===503){u=E.Ui
w=1
break}if(p.b===404){u=E.tF
w=1
break}g=p
A.fY().$1("[LeadCapture] HTTP "+p.b+": "+A.LV(A.LK(g.e)).f1(g.w))
u=D.jN
w=1
break
t=2
w=7
break
case 5:t=4
d=s.pop()
g=A.av(d)
if(g instanceof A.kz){m=g
l=A.aT(d)
A.fY().$1("[LeadCapture] ClientException: "+A.j(m)+"\n"+A.j(l))
u=E.tF
w=1
break}else if(x.L.b(g)){k=g
j=A.aT(d)
i=J.ew(k)
if(J.lI(i,"TimeoutException")||J.lI(i,"timed out")){u=D.tG
w=1
break}A.fY().$1("[LeadCapture] "+A.j(k)+"\n"+A.j(j))
u=D.jM
w=1
break}else throw d
w=7
break
case 4:w=2
break
case 7:case 1:return A.P(u,v)
case 2:return A.O(s.at(-1),v)}})
return A.Q($async$RB,v)},
b3r(d){var w,v=d.length
if(v<5||v>254)return!1
w=C.c.hN(d,"@")
if(w<=0||w>=v-1)return!1
return C.c.jl(d,".",w+1)>w}},E
J=c[1]
A=c[0]
C=c[2]
F=c[13]
D=c[20]
G=c[14]
H=c[15]
B=a.updateHolder(c[5],B)
E=c[26]
B.as6.prototype={}
B.aGx.prototype={
gey(){return"Pre-cadastro Perfect Gest Dev"},
gi5(){return"Pre-cadastro"},
gP3(){return"Deixe seu contato"},
gPS(){return"Informe nome e e-mail para receber novidades sobre PerfectGest e solu\xe7\xf5es Perfect Gest Dev."},
gRj(){return"Parte deste pr\xe9-cadastro destina-se a convites para o nosso programa de pr\xe9-lan\xe7amento: acesso integral \xe0s vers\xf5es em desenvolvimento dos aplicativos, com oportunidade de testar funcionalidades em antecipa\xe7\xe3o e contribuir com feedback que orienta a evolu\xe7\xe3o do produto antes do lan\xe7amento p\xfablico."},
gOk(){return"Nome"},
gOj(){return"Seu nome completo"},
gOi(){return"E-mail"},
gOh(){return"seu@email.com"},
gOg(){return"Coment\xe1rio"},
gOf(){return"Opcional \u2014 como podemos ajudar?"},
gpT(){return"Li e aceito a "},
gpS(){return"pol\xedtica de privacidade"},
gpU(){return" e autorizo o contacto sobre novidades, convites de pr\xe9-lan\xe7amento e servi\xe7os indicados."},
gpa(){return"Enviar pre-cadastro"},
gpb(){return"Enviando\u2026"},
gpd(){return"Pre-cadastro recebido"},
gpc(){return"Obrigado! Entraremos em contacto em breve no e-mail informado."},
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
gM6(){return"Voltar ao in\xedcio"}}
B.aGv.prototype={
gey(){return"Pre-registration Perfect Gest Dev"},
gi5(){return"Pre-registration"},
gP3(){return"Leave your contact details"},
gPS(){return"Enter your name and email to receive updates about PerfectGest and Perfect Gest Dev solutions."},
gRj(){return"Pre-registration also enables us to invite selected participants to our pre-launch program: full access to in-development app builds, early feature testing, and feedback that helps shape the product before public release."},
gOk(){return"Name"},
gOj(){return"Your full name"},
gOi(){return"Email"},
gOh(){return"you@email.com"},
gOg(){return"Comment"},
gOf(){return"Optional \u2014 how can we help?"},
gpT(){return"I have read and accept the "},
gpS(){return"privacy policy"},
gpU(){return" and authorize contact about updates, pre-launch invitations, and the services mentioned."},
gpa(){return"Submit pre-registration"},
gpb(){return"Sending\u2026"},
gpd(){return"Pre-registration received"},
gpc(){return"Thank you! We will contact you soon at the email provided."},
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
gM6(){return"Back to home"}}
B.aGw.prototype={
gey(){return"Pre-registro Perfect Gest Dev"},
gi5(){return"Pre-registro"},
gP3(){return"Deje su contacto"},
gPS(){return"Indique nombre y correo para recibir novedades sobre PerfectGest y soluciones Perfect Gest Dev."},
gRj(){return"Parte de este pre-registro sirve para invitar a participantes seleccionados al programa de prelanzamiento: acceso completo a las versiones en desarrollo de las aplicaciones, prueba anticipada de funcionalidades y retroalimentaci\xf3n que orienta la evoluci\xf3n del producto antes del lanzamiento p\xfablico."},
gOk(){return"Nombre"},
gOj(){return"Su nombre completo"},
gOi(){return"Correo electr\xf3nico"},
gOh(){return"su@email.com"},
gOg(){return"Comentario"},
gOf(){return"Opcional \u2014 \xbfc\xf3mo podemos ayudar?"},
gpT(){return"He le\xeddo y acepto la "},
gpS(){return"pol\xedtica de privacidad"},
gpU(){return" y autorizo el contacto sobre novedades, invitaciones de prelanzamiento y los servicios indicados."},
gpa(){return"Enviar pre-registro"},
gpb(){return"Enviando\u2026"},
gpd(){return"Pre-registro recibido"},
gpc(){return"\xa1Gracias! Le contactaremos pronto en el correo indicado."},
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
gM6(){return"Volver al inicio"}}
B.l8.prototype={
a7(){var w=$.as()
return new B.a4q(new A.b2(null,x.m),new F.it(D.cN,w),new F.it(D.cN,w),new F.it(D.cN,w),new F.it(D.cN,w))}}
B.a4q.prototype={
ao(){this.aO()
A.kj()
A.e9("description","Pre-cadastro Perfect Gest Dev: deixe nome, e-mail e comentario para receber novidades sobre apps Flutter, web e integracoes Java.")
A.e9("keywords","Perfect Gest Dev, pre-cadastro, newsletter, Flutter, software house, contato, leads")
A.e9("robots","index, follow")
A.d4("og:title","Pre-cadastro | Perfect Gest Dev")
A.d4("og:description","Formulario rapido para acompanhar lancamentos e solucoes da Perfect Gest Dev.")
A.d4("og:type","website")
A.d4("og:locale","pt_BR")
b.G.document.title="Pre-cadastro | Perfect Gest Dev"},
l(){var w=this,v=w.e,u=v.P$=$.as()
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
A.pI()
w.aA()},
BG(d){return this.asD(d)},
asD(d){var w=0,v=A.R(x.H),u,t=this,s,r,q,p
var $async$BG=A.N(function(e,f){if(e===1)return A.O(f,v)
for(;;)switch(w){case 0:if(t.y){w=1
break}t.a6(new B.aDF(t))
if(!t.x){t.a6(new B.aDG(t))
w=1
break}s=t.d.gU()
s=s==null?null:s.yZ()
if(s!==!0){w=1
break}t.a6(new B.aDH(t))
r=t.c.ai(x.l).r.f.kC("-")
s=t.e.a.a
q=t.f.a.a
w=3
return A.T(B.RB(t.r.a.a,t.x,q,r,s,t.w.a.a),$async$BG)
case 3:p=f
if(t.c==null){w=1
break}t.a6(new B.aDI(t,p))
case 1:return A.P(u,v)}})
return A.Q($async$BG,v)},
E(d){var w=this,v=null,u=A.x(d).ax,t=A.b7(d,C.aq,x.w).w.a.a<400?16:24,s=B.b5W(d),r=s.gey(),q=A.x(d).ax.a===C.D?C.bx:C.bf,p=s.gi5()
p=H.aLg(d,v,w.a.c,p)
return A.aH(v,v,v,A.j4(p,q,new A.jV(A.hb(A.dH(new A.cS(E.LX,w.z?w.aeT(d,s,u):w.aeI(d,s,u),v),v,v),v,new A.a6(t,16,t,28),C.ad),v),v,v),!1,v,v,v,!1,v,v,v,v,v,v,v,v,v,r,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,C.o,v)},
aeT(d,e,f){var w=null
return new A.mH(A.bf(A.b([A.cB(D.tp,f.b,w,48),C.bu,A.up(d,e.gpd(),w,20),C.aC,A.I(e.gpc(),w,w,w,w,A.nm(d,15,1.5),w,w),C.p1,A.aMn(A.I(e.gM6(),w,w,w,w,w,w,w),new B.aDE(d),w)],x.p),C.aH,C.n,C.q),18,C.ji,w)},
aeI(d,e,f){var w,v,u,t,s,r,q,p,o=this,n=null,m=e.gP3()
m=A.up(d,m,n,A.b7(d,C.aq,x.w).w.a.a<400?18:22)
w=A.I(e.gPS(),n,n,n,n,A.nm(d,15,1.5),n,n)
v=A.I(e.gRj(),n,n,n,n,A.nm(d,13.5,1.5).ax1(f.k3.af(0.82),1.5),n,n)
u=e.gOk()
u=o.Wu(o.e,e.gOj(),D.Kg,u,new B.aDz(e))
t=e.gOi()
t=o.Wu(o.f,e.gOh(),D.pb,t,new B.aDA(e))
s=e.gOg()
s=o.ahF(o.r,e.gOf(),C.lp,s,4,!1)
r=A.Du(A.cd(F.aNz(n,C.ds,!1,n,!0,C.X,n,F.aXX(),o.w,n,n,n,n,n,2,E.TM,C.aM,!0,n,!0,n,!1,n,C.eI,n,n,n,n,n,n,n,n,1,n,n,!1,"\u2022",n,n,n,n,n,!1,n,n,!1,n,!0,n,D.jh,n,n,n,n,n,n,n,n,n,n,n,n,!0,C.bj,n,D.p7,n,n,n,n),0,n),0)
q=o.x
p=x.p
q=A.b([u,C.ce,t,C.ce,s,r,C.bu,A.cV(A.b([F.aLV(n,!1,n,n,n,!1,n,n,o.y?n:new B.aDB(o),n,n,n,n,n,!1,q),A.eh(new A.aE(D.rE,A.hj(C.bk,A.b([A.I(e.gpT(),n,n,n,n,A.nm(d,13,1.5),n,n),A.hC(!1,n,!0,A.I(e.gpS(),n,n,n,n,A.nm(d,13,1.5).axd(f.b,C.dC,C.a4),n,n),n,!0,n,n,n,n,n,n,n,n,n,new B.aDC(d),n,n,n,n,n,n,n),A.I(e.gpU(),n,n,n,n,A.nm(d,13,1.5),n,n)],p),C.cf,0,0),n),1)],p),C.I,C.n,C.q,0)],p)
u=o.Q
if(u!=null)C.b.Z(q,A.b([C.aC,A.I(e.iC(u),n,n,n,n,A.b4().$3$color$fontSize$fontWeight(f.fy,13,C.a4),n,n)],p))
q.push(C.cq)
u=o.y
t=u?n:new B.aDD(o,e)
s=u?A.cd(A.aQE(f.c,2),18,18):E.T6
q.push(A.aMo(s,A.I(u?e.gpb():e.gpa(),n,n,n,n,n,n,n),t,n))
return F.aRN(A.bf(A.b([m,C.Z,w,C.aC,v,C.cq,new A.mH(A.bf(q,C.aH,C.n,C.q),18,C.ji,n)],p),C.aH,C.n,C.q),o.d)},
Wv(d,e,f,g,h,i,j){var w=null,v=this.y,u=i?j:w
return F.aUg(d,F.ahB(w,D.og,w,w,w,w,w,w,!0,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,e,w,w,w,w,w,!0,w,w,g,!0,!0,!1,w,w,w,w,w,w,w,w,w,w,w,w,w,w),!v,f,h,u)},
Wu(d,e,f,g,h){return this.Wv(d,e,f,g,1,!0,h)},
ahF(d,e,f,g,h,i){return this.Wv(d,e,f,g,h,i,null)}}
var z=a.updateTypes([])
B.aKr.prototype={
$1(d){return d.a_p("GET",this.a,this.b)},
$S:220}
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
v.e.nw(D.p8)
v.f.nw(D.p8)
v.r.nw(D.p8)
v.x=!1}else{w=w.b
v.Q=w==null?"server_error":w}},
$S:0}
B.aDE.prototype={
$0(){var w,v=this.a
if(A.cc(v,!1).wF())A.cc(v,!1).ds()
else{w=x.X
A.cc(v,!1).a6g("/",w,w)}},
$S:0}
B.aDz.prototype={
$1(d){if(C.c.da(d==null?"":d).length<2)return this.a.iC("name_invalid")
return null},
$S:46}
B.aDA.prototype={
$1(d){var w=C.c.da(d==null?"":d)
if(!C.c.n(w,"@")||!C.c.n(w,"."))return this.a.iC("email_invalid")
return null},
$S:46}
B.aDB.prototype={
$1(d){var w=this.a
return w.a6(new B.aDy(w,d))},
$S:53}
B.aDy.prototype={
$0(){return this.a.x=this.b===!0},
$S:0}
B.aDC.prototype={
$0(){return A.cc(this.a,!1).lX("/politica-privacidade-site",x.X)},
$S:0}
B.aDD.prototype={
$0(){return this.a.BG(this.b)},
$S:0};(function inheritance(){var w=a.inheritMany,v=a.inherit
w(A.hq,[B.aKr,B.aDz,B.aDA,B.aDB])
v(B.as6,A.J)
w(B.as6,[B.aGx,B.aGv,B.aGw])
v(B.l8,A.M)
v(B.a4q,A.U)
w(A.i_,[B.aDF,B.aDG,B.aDH,B.aDI,B.aDE,B.aDy,B.aDC,B.aDD])})()
A.ng(b.typeUniverse,JSON.parse('{"l8":{"M":[],"e":[]},"a4q":{"U":["l8"]}}'))
var y={b:"https://perfectgest-leads-api-2ztg.onrender.com/api/leads"}
var x=(function rtii(){var w=A.a2
return{L:w("ck"),p:w("o<e>"),m:w("b2<vz>"),d:w("f4"),f:w("bk<@,@>"),w:w("f5"),K:w("J"),q:w("oK"),N:w("m"),l:w("kd"),X:w("J?"),T:w("m?"),H:w("~")}})();(function constants(){E.LX=new A.a4(0,520,0,1/0)
E.Od=new B.aGv()
E.Oe=new B.aGw()
E.Of=new B.aGx()
E.QK=new A.aV(12e6)
E.R2=new A.aV(9e7)
E.T6=new A.di(C.tq,18,null,null,null)
E.TM=new F.qY(null,null,null,"Website",null,null,null,null,null,null,null,null,null,null,null,null,!0,!0,!1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,!0,null,null,null,null)
E.tF=new F.f4(!1,"api_not_deployed")
E.Ui=new F.f4(!1,"api_unavailable")})()};
(a=>{a["s3MCqWdqLm3/Q2/Ene+FadraGhk="]=a.current})($__dart_deferred_initializers__);