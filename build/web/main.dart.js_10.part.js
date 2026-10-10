((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,B,C={
aeB(){var x=0,w=A.O(y.f),v=1,u=[],t,s,r,q,p,o,n
var $async$aeB=A.K(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:v=3
A.eS().$1("Acordando o servidor Render... aguarde.")
r=A.cX("https://onrender.com",0,null)
q=y.g
p=A.az(["Content-Type","application/json"],q,q)
x=6
return A.R(A.aMr(r,B.bR.xD(A.az(["mensagem","Teste de iniciante com sucesso!","usuario","PerfectProAdmin","data_envio",new A.eo(Date.now(),0,!1).aFa()],q,q),null),p),$async$aeB)
case 6:t=e
if(t.b===200){A.eS().$1("Sucesso: o dado chegou no Elastic.")
r=t
A.eS().$1("ID do registro: "+A.j(J.kw(B.bR.q_(A.pO(A.pI(r.e)).eC(r.w),null),"id")))}else A.eS().$1("Erro do servidor: "+t.b)
v=1
x=5
break
case 3:v=2
n=u.pop()
s=A.as(n)
A.eS().$1("Erro de conexao: verifique internet e endpoint.")
A.eS().$1("Detalhe do erro: "+A.j(s))
x=5
break
case 2:x=1
break
case 5:return A.M(null,w)
case 1:return A.L(u.at(-1),w)}})
return A.N($async$aeB,w)}}
J=c[1]
A=c[0]
B=c[2]
C=a.updateHolder(c[9],C)
var z=a.updateTypes([])
var y={g:A.a4("n"),f:A.a4("~")}};
(a=>{a["FmTqKm92N8j7ZA27DYrMKN1iILE="]=a.current})($__dart_deferred_initializers__);