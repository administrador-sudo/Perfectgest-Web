((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,B,C={
ahG(){var x=0,w=A.M(y.f),v=1,u=[],t,s,r,q,p,o,n
var $async$ahG=A.I(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:v=3
A.fc().$1("Acordando o servidor Render... aguarde.")
r=A.cj("https://onrender.com",0,null)
q=y.g
p=A.as(["Content-Type","application/json"],q,q)
x=6
return A.F(A.AY(r,B.aL.mg(A.as(["mensagem","Teste de iniciante com sucesso!","usuario","PerfectProAdmin","data_envio",new A.bQ(Date.now(),0,!1).ac_()],q,q),null),p),$async$ahG)
case 6:t=e
if(t.b===200){A.fc().$1("Sucesso: o dado chegou no Elastic.")
r=t
A.fc().$1("ID do registro: "+A.j(J.i3(B.aL.iK(A.i0(A.hZ(r.e)).e_(r.w),null),"id")))}else A.fc().$1("Erro do servidor: "+t.b)
v=1
x=5
break
case 3:v=2
n=u.pop()
s=A.av(n)
A.fc().$1("Erro de conexao: verifique internet e endpoint.")
A.fc().$1("Detalhe do erro: "+A.j(s))
x=5
break
case 2:x=1
break
case 5:return A.K(null,w)
case 1:return A.J(u.at(-1),w)}})
return A.L($async$ahG,w)}}
J=c[1]
A=c[0]
B=c[2]
C=a.updateHolder(c[9],C)
var z=a.updateTypes([])
var y={g:A.a5("n"),f:A.a5("~")}};
(a=>{a["Mgi6R3LWjfytVUvCUUABBBzcbqU="]=a.current})($__dart_deferred_initializers__);