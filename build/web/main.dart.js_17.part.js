((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,B,C,D={
aaI(){var x=0,w=A.Q(y.f),v=1,u=[],t,s,r,q,p,o,n
var $async$aaI=A.M(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:v=3
A.jR().$1("Acordando o servidor Render... aguarde.")
r=A.eh("https://onrender.com",0,null)
q=y.g
p=A.aA(["Content-Type","application/json"],q,q)
x=6
return A.R(C.aQx(r,B.dg.L0(A.aA(["mensagem","Teste de iniciante com sucesso!","usuario","PerfectProAdmin","data_envio",new A.eK(Date.now(),0,!1).axS()],q,q),null),p),$async$aaI)
case 6:t=e
if(t.b===200){A.jR().$1("Sucesso: o dado chegou no Elastic.")
r=t
A.jR().$1("ID do registro: "+A.j(J.jT(B.dg.Zj(A.aQ5(A.aOS(r.e)).fI(r.w),null),"id")))}else A.jR().$1("Erro do servidor: "+t.b)
v=1
x=5
break
case 3:v=2
n=u.pop()
s=A.ap(n)
A.jR().$1("Erro de conexao: verifique internet e endpoint.")
A.jR().$1("Detalhe do erro: "+A.j(s))
x=5
break
case 2:x=1
break
case 5:return A.O(null,w)
case 1:return A.N(u.at(-1),w)}})
return A.P($async$aaI,w)}}
J=c[1]
A=c[0]
B=c[2]
C=c[12]
D=a.updateHolder(c[9],D)
var z=a.updateTypes([])
var y={g:A.a1("k"),f:A.a1("~")}};
(a=>{a["XtSx6AWfZlVrlfokSJI5R1BG1YM="]=a.current})($__dart_deferred_initializers__);