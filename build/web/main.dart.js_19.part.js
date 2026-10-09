((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,B,C,D={
ae6(){var x=0,w=A.R(y.f),v=1,u=[],t,s,r,q,p,o,n
var $async$ae6=A.N(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:v=3
A.fY().$1("Acordando o servidor Render... aguarde.")
r=A.dk("https://onrender.com",0,null)
q=y.g
p=A.aA(["Content-Type","application/json"],q,q)
x=6
return A.T(C.aP4(r,B.ci.Dr(A.aA(["mensagem","Teste de iniciante com sucesso!","usuario","PerfectProAdmin","data_envio",new A.eB(Date.now(),0,!1).aEi()],q,q),null),p),$async$ae6)
case 6:t=e
if(t.b===200){A.fY().$1("Sucesso: o dado chegou no Elastic.")
r=t
A.fY().$1("ID do registro: "+A.j(J.kp(B.ci.wZ(A.LV(A.LK(r.e)).f1(r.w),null),"id")))}else A.fY().$1("Erro do servidor: "+t.b)
v=1
x=5
break
case 3:v=2
n=u.pop()
s=A.av(n)
A.fY().$1("Erro de conexao: verifique internet e endpoint.")
A.fY().$1("Detalhe do erro: "+A.j(s))
x=5
break
case 2:x=1
break
case 5:return A.P(null,w)
case 1:return A.O(u.at(-1),w)}})
return A.Q($async$ae6,w)}}
J=c[1]
A=c[0]
B=c[2]
C=c[14]
D=a.updateHolder(c[10],D)
var z=a.updateTypes([])
var y={g:A.a2("m"),f:A.a2("~")}};
(a=>{a["6ZVWdN6d+C26NEhrX7AxtadZndQ="]=a.current})($__dart_deferred_initializers__);