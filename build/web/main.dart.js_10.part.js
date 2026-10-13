((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,B,C={
adq(){var x=0,w=A.O(y.f),v=1,u=[],t,s,r,q,p,o,n
var $async$adq=A.J(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:v=3
A.eM().$1("Acordando o servidor Render... aguarde.")
r=A.cT("https://onrender.com",0,null)
q=y.g
p=A.az(["Content-Type","application/json"],q,q)
x=6
return A.Q(A.aKL(r,B.bQ.xm(A.az(["mensagem","Teste de iniciante com sucesso!","usuario","PerfectProAdmin","data_envio",new A.ej(Date.now(),0,!1).aDU()],q,q),null),p),$async$adq)
case 6:t=e
if(t.b===200){A.eM().$1("Sucesso: o dado chegou no Elastic.")
r=t
A.eM().$1("ID do registro: "+A.j(J.js(B.bQ.pB(A.pu(A.pp(r.e)).ev(r.w),null),"id")))}else A.eM().$1("Erro do servidor: "+t.b)
v=1
x=5
break
case 3:v=2
n=u.pop()
s=A.aq(n)
A.eM().$1("Erro de conexao: verifique internet e endpoint.")
A.eM().$1("Detalhe do erro: "+A.j(s))
x=5
break
case 2:x=1
break
case 5:return A.M(null,w)
case 1:return A.L(u.at(-1),w)}})
return A.N($async$adq,w)}}
J=c[1]
A=c[0]
B=c[2]
C=a.updateHolder(c[9],C)
var z=a.updateTypes([])
var y={g:A.a2("l"),f:A.a2("~")}};
(a=>{a["7Ns93NNlPM+abCzofjvyNddWgXY="]=a.current})($__dart_deferred_initializers__);