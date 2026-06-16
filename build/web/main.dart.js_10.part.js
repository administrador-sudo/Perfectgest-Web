((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,B,C={
aaH(){var x=0,w=A.Q(y.f),v=1,u=[],t,s,r,q,p,o,n
var $async$aaH=A.M(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:v=3
A.jN().$1("Acordando o servidor Render... aguarde.")
r=A.eh("https://onrender.com",0,null)
q=y.g
p=A.az(["Content-Type","application/json"],q,q)
x=6
return A.R(D.aQw(r,B.dg.L2(A.az(["mensagem","Teste de iniciante com sucesso!","usuario","PerfectProAdmin","data_envio",new A.eG(Date.now(),0,!1).axP()],q,q),null),p),$async$aaH)
case 6:t=e
if(t.b===200){A.jN().$1("Sucesso: o dado chegou no Elastic.")
r=t
A.jN().$1("ID do registro: "+A.j(J.jP(B.dg.Zh(A.aQ5(A.aOS(r.e)).fI(r.w),null),"id")))}else A.jN().$1("Erro do servidor: "+t.b)
v=1
x=5
break
case 3:v=2
n=u.pop()
s=A.ap(n)
A.jN().$1("Erro de conexao: verifique internet e endpoint.")
A.jN().$1("Detalhe do erro: "+A.j(s))
x=5
break
case 2:x=1
break
case 5:return A.O(null,w)
case 1:return A.N(u.at(-1),w)}})
return A.P($async$aaH,w)}},D
J=c[1]
A=c[0]
B=c[2]
C=a.updateHolder(c[8],C)
D=c[10]
var z=a.updateTypes([])
var y={g:A.a3("m"),f:A.a3("~")}};
(a=>{a["t8/H7TSOe8UifBpZZFFZOlgOktM="]=a.current})($__dart_deferred_initializers__);