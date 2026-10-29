((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,B,C={
ahr(){var x=0,w=A.O(y.f),v=1,u=[],t,s,r,q,p,o,n
var $async$ahr=A.J(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:v=3
A.fa().$1("Acordando o servidor Render... aguarde.")
r=A.cw("https://onrender.com",0,null)
q=y.g
p=A.am(["Content-Type","application/json"],q,q)
x=6
return A.I(A.NU(r,B.b4.nq(A.am(["mensagem","Teste de iniciante com sucesso!","usuario","PerfectProAdmin","data_envio",new A.bW(Date.now(),0,!1).abJ()],q,q),null),p),$async$ahr)
case 6:t=e
if(t.b===200){A.fa().$1("Sucesso: o dado chegou no Elastic.")
r=t
A.fa().$1("ID do registro: "+A.j(J.hZ(B.b4.kB(A.k2(A.jZ(r.e)).em(r.w),null),"id")))}else A.fa().$1("Erro do servidor: "+t.b)
v=1
x=5
break
case 3:v=2
n=u.pop()
s=A.au(n)
A.fa().$1("Erro de conexao: verifique internet e endpoint.")
A.fa().$1("Detalhe do erro: "+A.j(s))
x=5
break
case 2:x=1
break
case 5:return A.M(null,w)
case 1:return A.L(u.at(-1),w)}})
return A.N($async$ahr,w)}}
J=c[1]
A=c[0]
B=c[2]
C=a.updateHolder(c[9],C)
var z=a.updateTypes([])
var y={g:A.a1("n"),f:A.a1("~")}};
(a=>{a["+6z9P94FFVvRHOUWsW5MI2HytGk="]=a.current})($__dart_deferred_initializers__);