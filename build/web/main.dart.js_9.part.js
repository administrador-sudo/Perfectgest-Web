((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,B={
aRo(d,e,f){return B.aqN(new B.arL(d,f,e,null),y.f)},
aqN(d,e){return B.aPr(d,e,e)},
aPr(d,e,f){var x=0,w=A.Q(f),v,u=2,t=[],s=[],r,q
var $async$aqN=A.M(function(g,h){if(g===1){t.push(h)
x=u}for(;;)switch(x){case 0:A.aS5()
q=A.c([],y.k)
r=new A.vb(q)
u=3
x=6
return A.S(d.$1(r),$async$aqN)
case 6:q=h
v=q
s=[1]
x=4
break
s.push(5)
x=4
break
case 3:s=[2]
case 4:u=2
r.aR()
x=s.pop()
break
case 5:case 1:return A.O(v,w)
case 2:return A.N(t.at(-1),w)}})
return A.P($async$aqN,w)},
arL:function arL(d,e,f,g){var _=this
_.a=d
_.b=e
_.c=f
_.d=g},
a20(){var x=0,w=A.Q(y.a),v=1,u=[],t,s,r,q,p,o,n
var $async$a20=A.M(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:v=3
A.mE().$1("Acordando o servidor Render... aguarde.")
r=A.cV("https://onrender.com",0,null)
q=y.g
p=A.aB(["Content-Type","application/json"],q,q)
x=6
return A.S(B.aRo(r,C.cW.Ro(A.aB(["mensagem","Teste de iniciante com sucesso!","usuario","PerfectProAdmin","data_envio",new A.dZ(Date.now(),0,!1).ahg()],q,q),null),p),$async$a20)
case 6:t=e
if(t.b===200){A.mE().$1("Sucesso: o dado chegou no Elastic.")
r=t
A.mE().$1("ID do registro: "+A.j(J.mJ(C.cW.QN(A.aQl(A.aO1(r.e)).eH(r.w),null),"id")))}else A.mE().$1("Erro do servidor: "+t.b)
v=1
x=5
break
case 3:v=2
n=u.pop()
s=A.an(n)
A.mE().$1("Erro de conexao: verifique internet e endpoint.")
A.mE().$1("Detalhe do erro: "+A.j(s))
x=5
break
case 2:x=1
break
case 5:return A.O(null,w)
case 1:return A.N(u.at(-1),w)}})
return A.P($async$a20,w)}}
J=c[1]
A=c[0]
C=c[2]
B=a.updateHolder(c[8],B)
var z=a.updateTypes([])
B.arL.prototype={
$1(d){var x=this
return d.qE("POST",x.a,x.b,x.c,x.d)},
$S:523};(function inheritance(){var x=a.inherit
x(B.arL,A.fA)})()
var y={k:A.a0("u<ax>"),f:A.a0("oy"),g:A.a0("n"),a:A.a0("~")}};
(a=>{a["2UV+rXvBqGo3i10rpb3G1ejbqX8="]=a.current})($__dart_deferred_initializers__);