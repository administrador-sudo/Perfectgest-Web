((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,B,C={
adz(){var x=0,w=A.Q(y.f),v=1,u=[],t,s,r,q,p,o,n
var $async$adz=A.M(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:v=3
A.fR().$1("Acordando o servidor Render... aguarde.")
r=A.di("https://onrender.com",0,null)
q=y.g
p=A.aA(["Content-Type","application/json"],q,q)
x=6
return A.S(A.aOg(r,B.ch.De(A.aA(["mensagem","Teste de iniciante com sucesso!","usuario","PerfectProAdmin","data_envio",new A.ew(Date.now(),0,!1).aDq()],q,q),null),p),$async$adz)
case 6:t=e
if(t.b===200){A.fR().$1("Sucesso: o dado chegou no Elastic.")
r=t
A.fR().$1("ID do registro: "+A.j(J.kj(B.ch.wS(A.Lt(A.Li(r.e)).eZ(r.w),null),"id")))}else A.fR().$1("Erro do servidor: "+t.b)
v=1
x=5
break
case 3:v=2
n=u.pop()
s=A.au(n)
A.fR().$1("Erro de conexao: verifique internet e endpoint.")
A.fR().$1("Detalhe do erro: "+A.j(s))
x=5
break
case 2:x=1
break
case 5:return A.O(null,w)
case 1:return A.N(u.at(-1),w)}})
return A.P($async$adz,w)}}
J=c[1]
A=c[0]
B=c[2]
C=a.updateHolder(c[9],C)
var z=a.updateTypes([])
var y={g:A.a4("n"),f:A.a4("~")}};
(a=>{a["NlLTRSNdMHAzEPdw3SupOS41taY="]=a.current})($__dart_deferred_initializers__);