((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,E,B={
bep(d){return A.a9D(new B.aLO(d,null),x.q)},
aLO:function aLO(d,e){this.a=d
this.b=e},
b7J(d){switch(d.ah(x.l).r.f.gcG()){case"en":return D.OU
case"es":return D.OV
case"pt":default:return D.OW}},
asS:function asS(){},
aHY:function aHY(){},
aHW:function aHW(){},
aHX:function aHX(){},
aUD(d){return new B.l9(d,null)},
l9:function l9(d,e){this.c=d
this.a=e},
a4M:function a4M(d,e,f,g,h){var _=this
_.d=d
_.e=e
_.f=f
_.r=g
_.w=h
_.z=_.y=_.x=!1
_.c=_.a=_.Q=null},
aFi:function aFi(d){this.a=d},
aFj:function aFj(d){this.a=d},
aFk:function aFk(d){this.a=d},
aFl:function aFl(d,e){this.a=d
this.b=e},
aFh:function aFh(d){this.a=d},
aFc:function aFc(d){this.a=d},
aFd:function aFd(d){this.a=d},
aFe:function aFe(d){this.a=d},
aFb:function aFb(d,e){this.a=d
this.b=e},
aFf:function aFf(d){this.a=d},
aFg:function aFg(d,e){this.a=d
this.b=e},
aiR(){var w=0,v=A.O(x.T),u,t=2,s=[],r,q,p,o,n,m,l
var $async$aiR=A.K(function(d,e){if(d===1){s.push(e)
w=t}for(;;)switch(w){case 0:t=4
o=C.c.fI(y.b,"/api/")
w=7
return A.R(B.bep(A.cW(o>=0?C.c.a2(y.b,0,o)+"/health":"https://perfectgest-leads-api-2ztg.onrender.com/api/leads/health",0,null)).v0(D.Rv),$async$aiR)
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
if(m instanceof A.jy){u="api_not_deployed"
w=1
break}else if(x.L.b(m)){q=m
p=J.e4(q)
if(J.jt(p,"TimeoutException")||J.jt(p,"timed out")){u="api_waking"
w=1
break}u="api_not_deployed"
w=1
break}else throw l
w=6
break
case 3:w=2
break
case 6:case 1:return A.M(u,v)
case 2:return A.L(s.at(-1),v)}})
return A.N($async$aiR,v)},
RS(d,e,f,g,h,i){var w=!1
return B.b5b(d,e,f,g,h,i)},
b5b(a0,a1,a2,a3,a4,a5){var w=0,v=A.O(x.d),u,t=2,s=[],r,q,p,o,n,m,l,k,j,i,h,g,f,e,d
var $async$RS=A.K(function(a7,a8){if(a7===1){s.push(a8)
w=t}for(;;)switch(w){case 0:e=!1
if(!a1){u=C.ue
w=1
break}r=C.c.c_(a4)
q=C.c.c_(a2)
if(J.cH(r)<2){u=C.uf
w=1
break}if(!B.b5a(q)){u=C.o_
w=1
break}w=3
return A.R(B.aiR(),$async$RS)
case 3:h=a8
if(h==="api_waking")A.eS().$1("[LeadCapture] Cold start detectado \u2014 aguardando...")
else if(h!=null){A.eS().$1("[LeadCapture] Health check falhou: "+h)
u=new A.d9(!1,h)
w=1
break}t=5
w=8
return A.R(A.aMr(A.cW(y.b,0,null),C.bR.xD(A.az(["nome",r,"email",q,"comentario",C.c.c_(a0),"consent",!0,"locale",a3,"website",a5,"copiaUsuario",e],x.N,x.K),null),C.ov).v0(D.RP),$async$RS)
case 8:p=a8
if(p.b>=200&&p.b<300){o=!1
try{g=p
n=C.bR.q_(A.pO(A.pI(g.e)).eC(g.w),null)
if(x.f.b(n)&&J.d(n.h(0,"copySent"),!0))o=!0}catch(a6){o=!1}u=new A.d9(!0,null)
w=1
break}if(p.b===503){u=D.Vp
w=1
break}if(p.b===404){u=D.uc
w=1
break}g=p
A.eS().$1("[LeadCapture] HTTP "+p.b+": "+A.pO(A.pI(g.e)).eC(g.w))
u=C.fy
w=1
break
t=2
w=7
break
case 5:t=4
d=s.pop()
g=A.as(d)
if(g instanceof A.jy){m=g
l=A.aO(d)
A.eS().$1("[LeadCapture] ClientException: "+A.j(m)+"\n"+A.j(l))
u=D.uc
w=1
break}else if(x.L.b(g)){k=g
j=A.aO(d)
i=J.e4(k)
if(J.jt(i,"TimeoutException")||J.jt(i,"timed out")){u=C.nZ
w=1
break}A.eS().$1("[LeadCapture] "+A.j(k)+"\n"+A.j(j))
u=C.ev
w=1
break}else throw d
w=7
break
case 4:w=2
break
case 7:case 1:return A.M(u,v)
case 2:return A.L(s.at(-1),v)}})
return A.N($async$RS,v)},
b5a(d){var w,v=d.length
if(v<5||v>254)return!1
w=C.c.fI(d,"@")
if(w<=0||w>=v-1)return!1
return C.c.iM(d,".",w+1)>w}},D
J=c[1]
A=c[0]
C=c[2]
E=c[12]
B=a.updateHolder(c[5],B)
D=c[18]
B.asS.prototype={}
B.aHY.prototype={
geL(){return"Pre-cadastro Perfect Gest Dev"},
gig(){return"Pre-cadastro"},
gPO(){return"Deixe seu contato"},
gQB(){return"Informe nome e e-mail para receber novidades sobre PerfectGest e solu\xe7\xf5es Perfect Gest Dev."},
gS_(){return"Parte deste pr\xe9-cadastro destina-se a convites para o nosso programa de pr\xe9-lan\xe7amento: acesso integral \xe0s vers\xf5es em desenvolvimento dos aplicativos, com oportunidade de testar funcionalidades em antecipa\xe7\xe3o e contribuir com feedback que orienta a evolu\xe7\xe3o do produto antes do lan\xe7amento p\xfablico."},
gP4(){return"Nome"},
gP3(){return"Seu nome completo"},
gP2(){return"E-mail"},
gP1(){return"seu@email.com"},
gP0(){return"Coment\xe1rio"},
gP_(){return"Opcional \u2014 como podemos ajudar?"},
gpU(){return"Li e aceito a "},
gpT(){return"pol\xedtica de privacidade"},
gpV(){return" e autorizo o contacto sobre novidades, convites de pr\xe9-lan\xe7amento e servi\xe7os indicados."},
gpa(){return"Enviar pre-cadastro"},
gpb(){return"Enviando\u2026"},
gpd(){return"Pre-cadastro recebido"},
gpc(){return"Obrigado! Entraremos em contacto em breve no e-mail informado."},
hQ(d){var w
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
gMP(){return"Voltar ao in\xedcio"}}
B.aHW.prototype={
geL(){return"Pre-registration Perfect Gest Dev"},
gig(){return"Pre-registration"},
gPO(){return"Leave your contact details"},
gQB(){return"Enter your name and email to receive updates about PerfectGest and Perfect Gest Dev solutions."},
gS_(){return"Pre-registration also enables us to invite selected participants to our pre-launch program: full access to in-development app builds, early feature testing, and feedback that helps shape the product before public release."},
gP4(){return"Name"},
gP3(){return"Your full name"},
gP2(){return"Email"},
gP1(){return"you@email.com"},
gP0(){return"Comment"},
gP_(){return"Optional \u2014 how can we help?"},
gpU(){return"I have read and accept the "},
gpT(){return"privacy policy"},
gpV(){return" and authorize contact about updates, pre-launch invitations, and the services mentioned."},
gpa(){return"Submit pre-registration"},
gpb(){return"Sending\u2026"},
gpd(){return"Pre-registration received"},
gpc(){return"Thank you! We will contact you soon at the email provided."},
hQ(d){var w
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
gMP(){return"Back to home"}}
B.aHX.prototype={
geL(){return"Pre-registro Perfect Gest Dev"},
gig(){return"Pre-registro"},
gPO(){return"Deje su contacto"},
gQB(){return"Indique nombre y correo para recibir novedades sobre PerfectGest y soluciones Perfect Gest Dev."},
gS_(){return"Parte de este pre-registro sirve para invitar a participantes seleccionados al programa de prelanzamiento: acceso completo a las versiones en desarrollo de las aplicaciones, prueba anticipada de funcionalidades y retroalimentaci\xf3n que orienta la evoluci\xf3n del producto antes del lanzamiento p\xfablico."},
gP4(){return"Nombre"},
gP3(){return"Su nombre completo"},
gP2(){return"Correo electr\xf3nico"},
gP1(){return"su@email.com"},
gP0(){return"Comentario"},
gP_(){return"Opcional \u2014 \xbfc\xf3mo podemos ayudar?"},
gpU(){return"He le\xeddo y acepto la "},
gpT(){return"pol\xedtica de privacidad"},
gpV(){return" y autorizo el contacto sobre novedades, invitaciones de prelanzamiento y los servicios indicados."},
gpa(){return"Enviar pre-registro"},
gpb(){return"Enviando\u2026"},
gpd(){return"Pre-registro recibido"},
gpc(){return"\xa1Gracias! Le contactaremos pronto en el correo indicado."},
hQ(d){var w
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
gMP(){return"Volver al inicio"}}
B.l9.prototype={
aa(){var w=$.aq()
return new B.a4M(new A.b4(null,x.m),new A.dL(C.br,w),new A.dL(C.br,w),new A.dL(C.br,w),new A.dL(C.br,w))}}
B.a4M.prototype={
ar(){this.aR()
A.kr()
A.ei("description","Pre-cadastro Perfect Gest Dev: deixe nome, e-mail e comentario para receber novidades sobre apps Flutter, web e integracoes Java.")
A.ei("keywords","Perfect Gest Dev, pre-cadastro, newsletter, Flutter, software house, contato, leads")
A.ei("robots","index, follow")
A.d4("og:title","Pre-cadastro | Perfect Gest Dev")
A.d4("og:description","Formulario rapido para acompanhar lancamentos e solucoes da Perfect Gest Dev.")
A.d4("og:type","website")
A.d4("og:locale","pt_BR")
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
A.pG()
w.aI()},
BX(d){return this.atD(d)},
atD(d){var w=0,v=A.O(x.H),u,t=this,s,r,q,p
var $async$BX=A.K(function(e,f){if(e===1)return A.L(f,v)
for(;;)switch(w){case 0:if(t.y){w=1
break}t.R(new B.aFi(t))
if(!t.x){t.R(new B.aFj(t))
w=1
break}s=t.d.gS()
s=s==null?null:s.v8()
if(s!==!0){w=1
break}t.R(new B.aFk(t))
r=t.c.ah(x.l).r.f.kG("-")
s=t.e.a.a
q=t.f.a.a
w=3
return A.R(B.RS(t.r.a.a,t.x,q,r,s,t.w.a.a),$async$BX)
case 3:p=f
if(t.c==null){w=1
break}t.R(new B.aFl(t,p))
case 1:return A.M(u,v)}})
return A.N($async$BX,v)},
D(d){var w=this,v=null,u=A.y(d).ax,t=A.b3(d,C.au,x.w).w.a.a<400?16:24,s=B.b7J(d),r=s.geL(),q=A.y(d).ax.a===C.E?C.bE:C.bm,p=s.gig()
p=E.aMK(d,v,w.a.c,p)
return A.aF(v,v,v,A.io(p,q,new A.k3(A.fc(A.dC(new A.cL(D.MA,w.z?w.afB(d,s,u):w.afq(d,s,u),v),v,v),v,new A.a2(t,16,t,28),C.a7),v),v,v,v),!1,v,v,!1,v,!1,v,v,v,v,v,v,v,v,r,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,C.p,v)},
afB(d,e,f){var w=null
return new A.mM(A.b2(A.b([A.cs(C.tV,f.b,w,48),C.bq,A.un(d,e.gpd(),w,20),C.ar,A.x(e.gpc(),w,w,w,w,A.nt(d,15,1.5),w,w),C.pq,A.qy(A.x(e.gMP(),w,w,w,w,w,w,w),new B.aFh(d),w)],x.p),C.ao,C.n,C.o),18,C.jz,w)},
afq(d,e,f){var w,v,u,t,s,r,q,p,o=this,n=null,m=e.gPO()
m=A.un(d,m,n,A.b3(d,C.au,x.w).w.a.a<400?18:22)
w=A.x(e.gQB(),n,n,n,n,A.nt(d,15,1.5),n,n)
v=A.x(e.gS_(),n,n,n,n,A.nt(d,13.5,1.5).axX(f.k3.ag(0.82),1.5),n,n)
u=e.gP4()
u=o.X9(o.e,e.gP3(),C.KP,u,new B.aFc(e))
t=e.gP2()
t=o.X9(o.f,e.gP1(),C.lH,t,new B.aFd(e))
s=e.gP0()
s=o.ais(o.r,e.gP_(),C.iB,s,4,!1)
r=A.wg(A.c3(A.au6(n,C.db,!1,n,!0,C.S,n,A.aQE(),o.w,n,n,n,n,n,2,D.UT,C.aE,!0,n,!0,n,!1,n,C.dL,n,n,n,n,n,n,n,n,1,n,n,!1,"\u2022",n,n,n,n,n,!1,n,n,!1,n,!0,n,C.fk,n,n,n,n,n,n,n,n,n,n,n,n,!0,C.b9,n,C.iz,n,n,n,n),0,n),0)
q=o.x
p=x.p
q=A.b([u,C.ci,t,C.ci,s,r,C.bq,A.cd(A.b([A.aNt(n,!1,n,n,n,!1,n,n,o.y?n:new B.aFe(o),n,n,n,n,n,!1,q),A.dr(new A.an(C.t6,A.hn(C.bs,A.b([A.x(e.gpU(),n,n,n,n,A.nt(d,13,1.5),n,n),A.fu(!1,n,!0,A.x(e.gpT(),n,n,n,n,A.nt(d,13,1.5).ay9(f.b,C.di,C.a4),n,n),n,!0,n,n,n,n,n,n,n,n,n,new B.aFf(d),n,n,n,n,n,n,n),A.x(e.gpV(),n,n,n,n,A.nt(d,13,1.5),n,n)],p),C.cp,0,0),n),1)],p),C.F,C.n,C.o,0)],p)
u=o.Q
if(u!=null)C.b.V(q,A.b([C.ar,A.x(e.hQ(u),n,n,n,n,A.b1().$3$color$fontSize$fontWeight(f.fy,13,C.a4),n,n)],p))
q.push(C.cy)
u=o.y
t=u?n:new B.aFg(o,e)
s=u?A.c3(A.aS4(f.c,2),18,18):D.Ub
q.push(A.aNX(s,A.x(u?e.gpb():e.gpa(),n,n,n,n,n,n,n),t,n))
return A.aTc(A.b2(A.b([m,C.R,w,C.ar,v,C.cy,new A.mM(A.b2(q,C.ao,C.n,C.o),18,C.jz,n)],p),C.ao,C.n,C.o),o.d)},
Xa(d,e,f,g,h,i,j){var w=null,v=this.y,u=i?j:w
return A.aVI(d,A.Cq(w,C.i5,w,w,w,w,w,w,!0,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,w,e,w,w,w,w,w,!0,w,w,g,!0,!0,!1,w,w,w,w,w,w,w,w,w,w,w,w,w,w),!v,f,h,u)},
X9(d,e,f,g,h){return this.Xa(d,e,f,g,1,!0,h)},
ais(d,e,f,g,h,i){return this.Xa(d,e,f,g,h,i,null)}}
var z=a.updateTypes([])
B.aLO.prototype={
$1(d){return d.a03("GET",this.a,this.b)},
$S:215}
B.aFi.prototype={
$0(){var w=this.a
w.Q=null
w.z=!1},
$S:0}
B.aFj.prototype={
$0(){return this.a.Q="consent_required"},
$S:0}
B.aFk.prototype={
$0(){return this.a.y=!0},
$S:0}
B.aFl.prototype={
$0(){var w,v=this.a
v.y=!1
w=this.b
if(w.a){v.z=!0
v.e.me(C.py)
v.f.me(C.py)
v.r.me(C.py)
v.x=!1}else{w=w.b
v.Q=w==null?"server_error":w}},
$S:0}
B.aFh.prototype={
$0(){var w,v=this.a
if(A.bX(v,!1).xc())A.bX(v,!1).dm()
else{w=x.X
A.bX(v,!1).a73("/",w,w)}},
$S:0}
B.aFc.prototype={
$1(d){if(C.c.c_(d==null?"":d).length<2)return this.a.hQ("name_invalid")
return null},
$S:50}
B.aFd.prototype={
$1(d){var w=C.c.c_(d==null?"":d)
if(!C.c.p(w,"@")||!C.c.p(w,"."))return this.a.hQ("email_invalid")
return null},
$S:50}
B.aFe.prototype={
$1(d){var w=this.a
return w.R(new B.aFb(w,d))},
$S:58}
B.aFb.prototype={
$0(){return this.a.x=this.b===!0},
$S:0}
B.aFf.prototype={
$0(){return A.bX(this.a,!1).lT("/politica-privacidade-site",x.X)},
$S:0}
B.aFg.prototype={
$0(){return this.a.BX(this.b)},
$S:0};(function inheritance(){var w=a.inheritMany,v=a.inherit
w(A.jz,[B.aLO,B.aFc,B.aFd,B.aFe])
v(B.asS,A.Q)
w(B.asS,[B.aHY,B.aHW,B.aHX])
v(B.l9,A.T)
v(B.a4M,A.V)
w(A.jA,[B.aFi,B.aFj,B.aFk,B.aFl,B.aFh,B.aFb,B.aFf,B.aFg])})()
A.u7(b.typeUniverse,JSON.parse('{"l9":{"T":[],"e":[]},"a4M":{"V":["l9"]}}'))
var y={b:"https://perfectgest-leads-api-2ztg.onrender.com/api/leads"}
var x=(function rtii(){var w=A.a4
return{L:w("ci"),p:w("v<e>"),m:w("b4<vA>"),d:w("d9"),f:w("bm<@,@>"),w:w("fW"),K:w("Q"),q:w("t1"),N:w("n"),l:w("ly"),X:w("Q?"),T:w("n?"),H:w("~")}})();(function constants(){D.MA=new A.a5(0,520,0,1/0)
D.OU=new B.aHW()
D.OV=new B.aHX()
D.OW=new B.aHY()
D.Rv=new A.aV(12e6)
D.RP=new A.aV(9e7)
D.Ub=new A.cJ(C.tW,18,null,null,null)
D.UT=new A.qU(null,null,null,"Website",null,null,null,null,null,null,null,null,null,null,null,null,!0,!0,!1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,!0,null,null,null,null)
D.uc=new A.d9(!1,"api_not_deployed")
D.Vp=new A.d9(!1,"api_unavailable")})()};
(a=>{a["Gc7FhvT+fyKcGJ5ZVFHqbZNLo/E="]=a.current})($__dart_deferred_initializers__);