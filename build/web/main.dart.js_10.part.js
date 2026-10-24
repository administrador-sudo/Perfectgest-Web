((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,B,C={
agZ(){var x=0,w=A.N(y.f),v=1,u=[],t,s,r,q,p,o,n
var $async$agZ=A.J(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:v=3
A.f6().$1("Acordando o servidor Render... aguarde.")
r=A.d4("https://onrender.com",0,null)
q=y.g
p=A.aw(["Content-Type","application/json"],q,q)
x=6
return A.P(A.aQG(r,B.bv.r_(A.aw(["mensagem","Teste de iniciante com sucesso!","usuario","PerfectProAdmin","data_envio",new A.cf(Date.now(),0,!1).aL4()],q,q),null),p),$async$agZ)
case 6:t=e
if(t.b===200){A.f6().$1("Sucesso: o dado chegou no Elastic.")
r=t
A.f6().$1("ID do registro: "+A.j(J.iv(B.bv.nj(A.ol(A.oj(r.e)).eL(r.w),null),"id")))}else A.f6().$1("Erro do servidor: "+t.b)
v=1
x=5
break
case 3:v=2
n=u.pop()
s=A.au(n)
A.f6().$1("Erro de conexao: verifique internet e endpoint.")
A.f6().$1("Detalhe do erro: "+A.j(s))
x=5
break
case 2:x=1
break
case 5:return A.L(null,w)
case 1:return A.K(u.at(-1),w)}})
return A.M($async$agZ,w)}}
J=c[1]
A=c[0]
B=c[2]
C=a.updateHolder(c[9],C)
var z=a.updateTypes([])
var y={g:A.a1("n"),f:A.a1("~")}};
(a=>{a["IJDjzk+zpkjPd0AkKjWW1LY8lM4="]=a.current})($__dart_deferred_initializers__);