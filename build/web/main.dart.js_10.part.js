((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,B,C={
ad5(){var x=0,w=A.Q(y.f),v=1,u=[],t,s,r,q,p,o,n
var $async$ad5=A.L(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:v=3
A.eL().$1("Acordando o servidor Render... aguarde.")
r=A.d_("https://onrender.com",0,null)
q=y.g
p=A.az(["Content-Type","application/json"],q,q)
x=6
return A.R(A.aK2(r,B.bN.xb(A.az(["mensagem","Teste de iniciante com sucesso!","usuario","PerfectProAdmin","data_envio",new A.ei(Date.now(),0,!1).aDr()],q,q),null),p),$async$ad5)
case 6:t=e
if(t.b===200){A.eL().$1("Sucesso: o dado chegou no Elastic.")
r=t
A.eL().$1("ID do registro: "+A.j(J.kn(B.bN.pw(A.pq(A.pl(r.e)).eu(r.w),null),"id")))}else A.eL().$1("Erro do servidor: "+t.b)
v=1
x=5
break
case 3:v=2
n=u.pop()
s=A.as(n)
A.eL().$1("Erro de conexao: verifique internet e endpoint.")
A.eL().$1("Detalhe do erro: "+A.j(s))
x=5
break
case 2:x=1
break
case 5:return A.O(null,w)
case 1:return A.N(u.at(-1),w)}})
return A.P($async$ad5,w)}}
J=c[1]
A=c[0]
B=c[2]
C=a.updateHolder(c[9],C)
var z=a.updateTypes([])
var y={g:A.a4("l"),f:A.a4("~")}};
(a=>{a["vt95Gp7XghJ9wRYQmxDB8SC3hwo="]=a.current})($__dart_deferred_initializers__);