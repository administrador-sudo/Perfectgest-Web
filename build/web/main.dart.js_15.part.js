((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,B,C,D={
aa4(){var x=0,w=A.Q(y.f),v=1,u=[],t,s,r,q,p,o,n
var $async$aa4=A.M(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:v=3
A.jC().$1("Acordando o servidor Render... aguarde.")
r=A.ec("https://onrender.com",0,null)
q=y.g
p=A.az(["Content-Type","application/json"],q,q)
x=6
return A.S(C.aPf(r,B.dc.Kr(A.az(["mensagem","Teste de iniciante com sucesso!","usuario","PerfectProAdmin","data_envio",new A.eF(Date.now(),0,!1).aw6()],q,q),null),p),$async$aa4)
case 6:t=e
if(t.b===200){A.jC().$1("Sucesso: o dado chegou no Elastic.")
r=t
A.jC().$1("ID do registro: "+A.j(J.jE(B.dc.Yx(A.aON(A.aNA(r.e)).fB(r.w),null),"id")))}else A.jC().$1("Erro do servidor: "+t.b)
v=1
x=5
break
case 3:v=2
n=u.pop()
s=A.ao(n)
A.jC().$1("Erro de conexao: verifique internet e endpoint.")
A.jC().$1("Detalhe do erro: "+A.j(s))
x=5
break
case 2:x=1
break
case 5:return A.O(null,w)
case 1:return A.N(u.at(-1),w)}})
return A.P($async$aa4,w)}}
J=c[1]
A=c[0]
B=c[2]
C=c[11]
D=a.updateHolder(c[9],D)
var z=a.updateTypes([])
var y={g:A.a1("l"),f:A.a1("~")}};
(a=>{a["acoAkC5sFAeB9pm5LVeqJ6q0icM="]=a.current})($__dart_deferred_initializers__);