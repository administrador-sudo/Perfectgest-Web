((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,B,C,D={
ae4(){var x=0,w=A.S(y.f),v=1,u=[],t,s,r,q,p,o,n
var $async$ae4=A.O(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:v=3
A.iB().$1("Acordando o servidor Render... aguarde.")
r=A.dA("https://onrender.com",0,null)
q=y.g
p=A.az(["Content-Type","application/json"],q,q)
x=6
return A.T(C.aXn(r,B.dF.Nm(A.az(["mensagem","Teste de iniciante com sucesso!","usuario","PerfectProAdmin","data_envio",new A.eL(Date.now(),0,!1).aDF()],q,q),null),p),$async$ae4)
case 6:t=e
if(t.b===200){A.iB().$1("Sucesso: o dado chegou no Elastic.")
r=t
A.iB().$1("ID do registro: "+A.j(J.kn(B.dF.a2q(A.aWU(A.aVG(r.e)).hb(r.w),null),"id")))}else A.iB().$1("Erro do servidor: "+t.b)
v=1
x=5
break
case 3:v=2
n=u.pop()
s=A.av(n)
A.iB().$1("Erro de conexao: verifique internet e endpoint.")
A.iB().$1("Detalhe do erro: "+A.j(s))
x=5
break
case 2:x=1
break
case 5:return A.Q(null,w)
case 1:return A.P(u.at(-1),w)}})
return A.R($async$ae4,w)}}
J=c[1]
A=c[0]
B=c[2]
C=c[15]
D=a.updateHolder(c[10],D)
var z=a.updateTypes([])
var y={g:A.a0("l"),f:A.a0("~")}};
(a=>{a["bJkk8AYC/z8UqtnMsPZx7d7Ivx8="]=a.current})($__dart_deferred_initializers__);