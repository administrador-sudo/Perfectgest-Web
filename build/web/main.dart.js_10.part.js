((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,B,C={
ahz(){var x=0,w=A.M(y.f),v=1,u=[],t,s,r,q,p,o,n
var $async$ahz=A.I(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:v=3
A.fa().$1("Acordando o servidor Render... aguarde.")
r=A.ci("https://onrender.com",0,null)
q=y.g
p=A.ar(["Content-Type","application/json"],q,q)
x=6
return A.H(A.AW(r,B.aP.me(A.ar(["mensagem","Teste de iniciante com sucesso!","usuario","PerfectProAdmin","data_envio",new A.bV(Date.now(),0,!1).abO()],q,q),null),p),$async$ahz)
case 6:t=e
if(t.b===200){A.fa().$1("Sucesso: o dado chegou no Elastic.")
r=t
A.fa().$1("ID do registro: "+A.j(J.i_(B.aP.j8(A.hX(A.hV(r.e)).e_(r.w),null),"id")))}else A.fa().$1("Erro do servidor: "+t.b)
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
case 5:return A.K(null,w)
case 1:return A.J(u.at(-1),w)}})
return A.L($async$ahz,w)}}
J=c[1]
A=c[0]
B=c[2]
C=a.updateHolder(c[9],C)
var z=a.updateTypes([])
var y={g:A.a5("n"),f:A.a5("~")}};
(a=>{a["Bm0HSFJ6VNBwIoDXV6RTjMbiq1g="]=a.current})($__dart_deferred_initializers__);