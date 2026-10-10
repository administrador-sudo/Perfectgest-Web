((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,B,C={
acx(){var x=0,w=A.Q(y.f),v=1,u=[],t,s,r,q,p,o,n
var $async$acx=A.M(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:v=3
A.f0().$1("Acordando o servidor Render... aguarde.")
r=A.cZ("https://onrender.com",0,null)
q=y.g
p=A.az(["Content-Type","application/json"],q,q)
x=6
return A.S(A.aJe(r,B.bL.wX(A.az(["mensagem","Teste de iniciante com sucesso!","usuario","PerfectProAdmin","data_envio",new A.ex(Date.now(),0,!1).aCJ()],q,q),null),p),$async$acx)
case 6:t=e
if(t.b===200){A.f0().$1("Sucesso: o dado chegou no Elastic.")
r=t
A.f0().$1("ID do registro: "+A.j(J.km(B.bL.pp(A.pl(A.pg(r.e)).ek(r.w),null),"id")))}else A.f0().$1("Erro do servidor: "+t.b)
v=1
x=5
break
case 3:v=2
n=u.pop()
s=A.ap(n)
A.f0().$1("Erro de conexao: verifique internet e endpoint.")
A.f0().$1("Detalhe do erro: "+A.j(s))
x=5
break
case 2:x=1
break
case 5:return A.O(null,w)
case 1:return A.N(u.at(-1),w)}})
return A.P($async$acx,w)}}
J=c[1]
A=c[0]
B=c[2]
C=a.updateHolder(c[9],C)
var z=a.updateTypes([])
var y={g:A.a4("l"),f:A.a4("~")}};
(a=>{a["1HTgvsCd4vvf+H/AY8eR2OeGIM8="]=a.current})($__dart_deferred_initializers__);