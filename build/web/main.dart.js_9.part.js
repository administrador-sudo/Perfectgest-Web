((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,F,D,G,H,B={
bbX(d){return G.a9e(new B.aKq(d,null),x.q)},
aKq:function aKq(d,e){this.a=d
this.b=e},
b5V(d){switch(d.ai(x.l).r.f.gcA()){case"en":return E.Od
case"es":return E.Oe
case"pt":default:return E.Of}},
as6:function as6(){},
aGw:function aGw(){},
aGu:function aGu(){},
aGv:function aGv(){},
aT4(d){return new B.l8(d,null)},
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
aDE:function aDE(d){this.a=d},
aDF:function aDF(d){this.a=d},
aDG:function aDG(d){this.a=d},
aDH:function aDH(d,e){this.a=d
this.b=e},
aDD:function aDD(d){this.a=d},
aDy:function aDy(d){this.a=d},
aDz:function aDz(d){this.a=d},
aDA:function aDA(d){this.a=d},
aDx:function aDx(d,e){this.a=d
this.b=e},
aDB:function aDB(d){this.a=d},
aDC:function aDC(d,e){this.a=d
this.b=e},
aim(){var w=0,v=A.R(x.T),u,t=2,s=[],r,q,p,o,n,m,l
var $async$aim=A.N(function(d,e){if(d===1){s.push(e)
w=t}for(;;)switch(w){case 0:t=4
o=C.c.hN(y.b,"/api/")
w=7
return A.T(B.bbX(A.dk(o>=0?C.c.a3(y.b,0,o)+"/health":"https://perfectgest-leads-api-2ztg.onrender.com/api/leads/health",0,null)).yF(E.QJ),$async$aim)
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
return B.b3r(d,e,f,g,h,i)},
b3r(a0,a1,a2,a3,a4,a5){var w=0,v=A.R(x.d),u,t=2,s=[],r,q,p,o,n,m,l,k,j,i,h,g,f,e,d
var $async$RB=A.N(function(a7,a8){if(a7===1){s.push(a8)
w=t}for(;;)switch(w){case 0:e=!1
if(!a1){u=D.tH
w=1
break}r=C.c.dU(a4)
q=C.c.dU(a2)
if(J.cF(r)<2){u=D.tJ
w=1
break}if(!B.b3q(q)){u=D.tI
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
return A.T(G.aP_(A.dk(y.b,0,null),C.ci.Df(A.aA(["nome",r,"email",q,"comentario",C.c.dU(a0),"consent",!0,"locale",a3,"website",a5,"copiaUsuario",e],x.N,x.K),null),D.Ev).yF(E.R1),$async$RB)
case 8:p=a8
if(p.b>=200&&p.b<300){o=!1
try{g=p
n=C.ci.wX(A.LV(A.LK(g.e)).f1(g.w),null)
if(x.f.b(n)&&J.d(n.h(0,"copySent"),!0))o=!0}catch(a6){o=!1}u=new F.f4(!0,null)
w=1
break}if(p.b===503){u=E.Ug
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
b3q(d){var w,v=d.length
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
B.aGw.prototype={
gey(){return"Pre-cadastro Perfect Gest Dev"},
gi5(){return"Pre-cadastro"},
gOM(){return"Deixe seu contato"},
gPA(){return"Informe nome e e-mail para receber novidades sobre PerfectGest e solu\xe7\xf5es Perfect Gest Dev."},
gRb(){return"Parte deste pr\xe9-cadastro destina-se a convites para o nosso programa de pr\xe9-lan\xe7amento: acesso integral \xe0s vers\xf5es em desenvolvimento dos aplicativos, com oportunidade de testar funcionalidades em antecipa\xe7\xe3o e contribuir com feedback que orienta a evolu\xe7\xe3o do produto antes do lan\xe7amento p\xfablico."},
gO2(){return"Nome"},
gO1(){return"Seu nome completo"},
gO0(){return"E-mail"},
gO_(){return"seu@email.com"},
gNZ(){return"Coment\xe1rio"},
gNY(){return"Opcional \u2014 como podemos ajudar?"},
gpS(){return"Li e aceito a "},
gpR(){return"pol\xedtica de privacidade"},
gpT(){return" e autorizo o contacto sobre novidades, convites de pr\xe9-lan\xe7amento e servi\xe7os indicados."},
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
gLP(){return"Voltar ao in\xedcio"}}
B.aGu.prototype={
gey(){return"Pre-registration Perfect Gest Dev"},
gi5(){return"Pre-registration"},
gOM(){return"Leave your contact details"},
gPA(){return"Enter your name and email to receive updates about PerfectGest and Perfect Gest Dev solutions."},
gRb(){return"Pre-registration also enables us to invite selected participants to our pre-launch program: full access to in-development app builds, early feature testing, and feedback that helps shape the product before public release."},
gO2(){return"Name"},
gO1(){return"Your full name"},
gO0(){return"Email"},
gO_(){return"you@email.com"},
gNZ(){return"Comment"},
gNY(){return"Optional \u2014 how can we help?"},
gpS(){return"I have read and accept the "},
gpR(){return"privacy policy"},
gpT(){return" and authorize contact about updates, pre-launch invitations, and the services mentioned."},
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
gLP(){return"Back to home"}}
B.aGv.prototype={
gey(){return"Pre-registro Perfect Gest Dev"},
gi5(){return"Pre-registro"},
gOM(){return"Deje su contacto"},
gPA(){return"Indique nombre y correo para recibir novedades sobre PerfectGest y soluciones Perfect Gest Dev."},
gRb(){return"Parte de este pre-registro sirve para invitar a participantes seleccionados al programa de prelanzamiento: acceso completo a las versiones en desarrollo de las aplicaciones, prueba anticipada de funcionalidades y retroalimentaci\xf3n que orienta la evoluci\xf3n del producto antes del lanzamiento p\xfablico."},
gO2(){return"Nombre"},
gO1(){return"Su nombre completo"},
gO0(){return"Correo electr\xf3nico"},
gO_(){return"su@email.com"},
gNZ(){return"Comentario"},
gNY(){return"Opcional \u2014 \xbfc\xf3mo podemos ayudar?"},
gpS(){return"He le\xeddo y acepto la "},
gpR(){return"pol\xedtica de privacidad"},
gpT(){return" y autorizo el contacto sobre novedades, invitaciones de prelanzamiento y los servicios indicados."},
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
gLP(){return"Volver al inicio"}}
B.l8.prototype={
a7(){var w=$.as()
return new B.a4q(new A.b2(null,x.m),new F.it(D.cN,w),new F.it(D.cN,w),new F.it(D.cN,w),new F.it(D.cN,w))}}
B.a4q.prototype={
ao(){this.aO()
A.kj()
A.e9("description","Pre-cadastro Perfect Gest Dev: deixe nome, e-mail e comentario para receber novidades sobre apps Flutter, web e integracoes Java.")
A.e9("keywords","Perfect Gest Dev, pre-cadastro, newsletter, Flutter, software house, contato, leads")
A.e9("robots","index, follow")
A.d3("og:title","Pre-cadastro | Perfect Gest Dev")
A.d3("og:description","Formulario rapido para acompanhar lancamentos e solucoes da Perfect Gest Dev.")
A.d3("og:type","website")
A.d3("og:locale","pt_BR")
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
Bu(d){return this.asu(d)},
asu(d){var w=0,v=A.R(x.H),u,t=this,s,r,q,p
var $async$Bu=A.N(function(e,f){if(e===1)return A.O(f,v)
for(;;)switch(w){case 0:if(t.y){w=1
break}t.a6(new B.aDE(t))
if(!t.x){t.a6(new B.aDF(t))
w=1
break}s=t.d.gU()
s=s==null?null:s.yO()
if(s!==!0){w=1
break}t.a6(new B.aDG(t))
r=t.c.ai(x.l).r.f.kB("-")
s=t.e.a.a
q=t.f.a.a
w=3
return A.T(B.RB(t.r.a.a,t.x,q,r,s,t.w.a.a),$async$Bu)
case 3:p=f
if(t.c==null){w=1
break}t.a6(new B.aDH(t,p))
case 1:return A.P(u,v)}})
return A.Q($async$Bu,v)},
E(d){var w=this,v=null,u=A.x(d).ax,t=A.b7(d,C.aq,x.w).w.a.a<400?16:24,s=B.b5V(d),r=s.gey(),q=A.x(d).ax.a===C.D?C.by:C.bf,p=s.gi5()
p=H.aLf(d,v,w.a.c,p)
return A.aH(v,v,v,A.j4(p,q,new A.jV(A.ha(A.dH(new A.cR(E.LX,w.z?w.aeK(d,s,u):w.aez(d,s,u),v),v,v),v,new A.a6(t,16,t,28),C.ad),v),v,v),!1,v,v,v,!1,v,v,v,v,v,v,v,v,v,r,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,C.o,v)},
aeK(d,e,f){var w=null
return new A.mG(A.bf(A.b([A.cA(D.tp,f.b,w,48),C.bv,A.up(d,e.gpb(),w,20),C.aI,A.I(e.gpa(),w,w,w,w,A.nl(d,15,1.5),w,w),C.p1,A.aMm(A.I(e.gLP(),w,w,w,w,w,w,w),new B.aDD(d),w)],x.p),C.aF,C.n,C.q),18,C.ji,w)},
aez(d,e,f){var w,v,u,t,s,r,q,p,o=this,n=null,m=e.gOM()
m=A.up(d,m,n,A.b7(d,C.aq,x.w).w.a.a<400?18:22)
w=A.I(e.gPA(),n,n,n,n,A.nl(d,15,1.5),n,n)
v=A.I(e.gRb(),n,n,n,n,A.nl(d,13.5,1.5).awT(f.k3.af(0.82),1.5),n,n)
u=e.gO2()
u=o.Wn(o.e,e.gO1(),D.Kg,u,new B.aDy(e))
t=e.gO0()
t=o.Wn(o.f,e.gO_(),D.pb,t,new B.aDz(e))
s=e.gNZ()
s=o.ahw(o.r,e.gNY(),C.lp,s,4,!1)
r=A.Du(A.cd(F.aNu(n,C.ds,!1,n,!0,C.X,n,F.aXW(),o.w,n,n,n,n,n,2,E.TK,C.aM,!0,n,!0,n,!1,n,C.eI,n,n,n,n,n,n,n,n,1,n,n,!1,"\u2022",n,n,n,n,n,!1,n,n,!1,n,!0,n,D.jh,n,n,n,n,n,n,n,n,n,n,n,n,!0,C.bj,n,D.p7,n,n,n,n),0,n),0)
q=o.x
p=x.p
q=A.b([u,C.ce,t,C.ce,s,r,C.bv,A.cU(A.b([F.aLU(n,!1,n,n,n,!1,n,n,o.y?n:new B.aDA(o),n,n,n,n,n,!1,q),A.eh(new A.aE(D.rE,A.hi(C.bl,A.b([A.I(e.gpS(),n,n,n,n,A.nl(d,13,1.5),n,n),A.hC(!1,n,!0,A.I(e.gpR(),n,n,n,n,A.nl(d,13,1.5).ax4(f.b,C.dC,C.a4),n,n),n,!0,n,n,n,n,n,n,n,n,n,new B.aDB(d),n,n,n,n,n,n,n),A.I(e.gpT(),n,n,n,n,A.nl(d,13,1.5),n,n)],p),C.cf,0,0),n),1)],p),C.I,C.n,C.q,0)],p)
u=o.Q
if(u!=null)C.b.Z(q,A.b([C.aI,A.I(e.iC(u),n,n,n,n,A.b4().$3$color$fontSize$fontWeight(f.fy,13,C.a4),n,n)],p))
q.push(C.cq)
u=o.y
t=u?n:new B.aDC(o,e)
s=u?A.cd(A.aQz(f.c,2),18,18):E.T4
q.push(A.aMn(s,A.I(u?e.gp9():e.gp8(),n,n,n,n,n,n,n),t,n))
return F.aRI(A.bf(A.b([m,C.a_,w,C.aI,v,C.cq,new A.mG(A.bf(q,C.aF,C.n,C.q),18,C.ji,n)],p),C.aF,C.n,C.q),o.d)},
Wo(d,e,f,g,h,i,j){var w=null,v=this.y,u=i?j:w
return F.aUf(d,F.ahB(w,D.og,w,w,w,w,w,w,!0,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,e,w,w,w,w,w,!0,w,w,g,!0,!0,!1,w,w,w,w,w,w,w,w,w,w,w,w,w,w),!v,f,h,u)},
Wn(d,e,f,g,h){return this.Wo(d,e,f,g,1,!0,h)},
ahw(d,e,f,g,h,i){return this.Wo(d,e,f,g,h,i,null)}}
var z=a.updateTypes([])
B.aKq.prototype={
$1(d){return d.a_h("GET",this.a,this.b)},
$S:220}
B.aDE.prototype={
$0(){var w=this.a
w.Q=null
w.z=!1},
$S:0}
B.aDF.prototype={
$0(){return this.a.Q="consent_required"},
$S:0}
B.aDG.prototype={
$0(){return this.a.y=!0},
$S:0}
B.aDH.prototype={
$0(){var w,v=this.a
v.y=!1
w=this.b
if(w.a){v.z=!0
v.e.nv(D.p8)
v.f.nv(D.p8)
v.r.nv(D.p8)
v.x=!1}else{w=w.b
v.Q=w==null?"server_error":w}},
$S:0}
B.aDD.prototype={
$0(){var w,v=this.a
if(A.cc(v,!1).wD())A.cc(v,!1).dr()
else{w=x.X
A.cc(v,!1).a68("/",w,w)}},
$S:0}
B.aDy.prototype={
$1(d){if(C.c.dU(d==null?"":d).length<2)return this.a.iC("name_invalid")
return null},
$S:46}
B.aDz.prototype={
$1(d){var w=C.c.dU(d==null?"":d)
if(!C.c.n(w,"@")||!C.c.n(w,"."))return this.a.iC("email_invalid")
return null},
$S:46}
B.aDA.prototype={
$1(d){var w=this.a
return w.a6(new B.aDx(w,d))},
$S:53}
B.aDx.prototype={
$0(){return this.a.x=this.b===!0},
$S:0}
B.aDB.prototype={
$0(){return A.cc(this.a,!1).lW("/politica-privacidade-site",x.X)},
$S:0}
B.aDC.prototype={
$0(){return this.a.Bu(this.b)},
$S:0};(function inheritance(){var w=a.inheritMany,v=a.inherit
w(A.hq,[B.aKq,B.aDy,B.aDz,B.aDA])
v(B.as6,A.J)
w(B.as6,[B.aGw,B.aGu,B.aGv])
v(B.l8,A.M)
v(B.a4q,A.U)
w(A.i_,[B.aDE,B.aDF,B.aDG,B.aDH,B.aDD,B.aDx,B.aDB,B.aDC])})()
A.nf(b.typeUniverse,JSON.parse('{"l8":{"M":[],"e":[]},"a4q":{"U":["l8"]}}'))
var y={b:"https://perfectgest-leads-api-2ztg.onrender.com/api/leads"}
var x=(function rtii(){var w=A.a2
return{L:w("cj"),p:w("o<e>"),m:w("b2<vz>"),d:w("f4"),f:w("bk<@,@>"),w:w("f5"),K:w("J"),q:w("oK"),N:w("l"),l:w("kd"),X:w("J?"),T:w("l?"),H:w("~")}})();(function constants(){E.LX=new A.a4(0,520,0,1/0)
E.Od=new B.aGu()
E.Oe=new B.aGv()
E.Of=new B.aGw()
E.QJ=new A.aV(12e6)
E.R1=new A.aV(9e7)
E.T4=new A.di(C.tq,18,null,null,null)
E.TK=new F.qY(null,null,null,"Website",null,null,null,null,null,null,null,null,null,null,null,null,!0,!0,!1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,!0,null,null,null,null)
E.tF=new F.f4(!1,"api_not_deployed")
E.Ug=new F.f4(!1,"api_unavailable")})()};
(a=>{a["bvlvbzMsAUPp6aArN39OBJs8hm0="]=a.current})($__dart_deferred_initializers__);