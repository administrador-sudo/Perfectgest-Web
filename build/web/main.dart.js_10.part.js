((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,B,C={
ahn(){var x=0,w=A.P(y.f),v=1,u=[],t,s,r,q,p,o,n
var $async$ahn=A.L(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:v=3
A.f8().$1("Acordando o servidor Render... aguarde.")
r=A.df("https://onrender.com",0,null)
q=y.g
p=A.ax(["Content-Type","application/json"],q,q)
x=6
return A.Q(A.aRh(r,B.bN.v8(A.ax(["mensagem","Teste de iniciante com sucesso!","usuario","PerfectProAdmin","data_envio",new A.cg(Date.now(),0,!1).aLm()],q,q),null),p),$async$ahn)
case 6:t=e
if(t.b===200){A.f8().$1("Sucesso: o dado chegou no Elastic.")
r=t
A.f8().$1("ID do registro: "+A.j(J.iw(B.bN.oY(A.qH(A.qD(r.e)).eY(r.w),null),"id")))}else A.f8().$1("Erro do servidor: "+t.b)
v=1
x=5
break
case 3:v=2
n=u.pop()
s=A.av(n)
A.f8().$1("Erro de conexao: verifique internet e endpoint.")
A.f8().$1("Detalhe do erro: "+A.j(s))
x=5
break
case 2:x=1
break
case 5:return A.N(null,w)
case 1:return A.M(u.at(-1),w)}})
return A.O($async$ahn,w)}}
J=c[1]
A=c[0]
B=c[2]
C=a.updateHolder(c[9],C)
var z=a.updateTypes([])
var y={g:A.a1("n"),f:A.a1("~")}};
(a=>{a["YSXgGvPQr+gtLvWMIK9M7xgQTao="]=a.current})($__dart_deferred_initializers__);