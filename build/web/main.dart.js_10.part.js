((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,B,C={
abk(){var x=0,w=A.R(y.f),v=1,u=[],t,s,r,q,p,o,n
var $async$abk=A.N(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:v=3
A.i9().$1("Acordando o servidor Render... aguarde.")
r=A.e7("https://onrender.com",0,null)
q=y.g
p=A.aA(["Content-Type","application/json"],q,q)
x=6
return A.S(D.aRW(r,B.dj.Lo(A.aA(["mensagem","Teste de iniciante com sucesso!","usuario","PerfectProAdmin","data_envio",new A.eJ(Date.now(),0,!1).ayg()],q,q),null),p),$async$abk)
case 6:t=e
if(t.b===200){A.i9().$1("Sucesso: o dado chegou no Elastic.")
r=t
A.i9().$1("ID do registro: "+A.j(J.jV(B.dj.ZI(A.aRu(A.aQg(r.e)).fN(r.w),null),"id")))}else A.i9().$1("Erro do servidor: "+t.b)
v=1
x=5
break
case 3:v=2
n=u.pop()
s=A.aq(n)
A.i9().$1("Erro de conexao: verifique internet e endpoint.")
A.i9().$1("Detalhe do erro: "+A.j(s))
x=5
break
case 2:x=1
break
case 5:return A.P(null,w)
case 1:return A.O(u.at(-1),w)}})
return A.Q($async$abk,w)}},D
J=c[1]
A=c[0]
B=c[2]
C=a.updateHolder(c[8],C)
D=c[10]
var z=a.updateTypes([])
var y={g:A.a3("k"),f:A.a3("~")}};
(a=>{a["eg/0sQKG0cvR2mmuPXE7EqHEkok="]=a.current})($__dart_deferred_initializers__);