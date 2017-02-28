######## STATUS = 0 (ATIVO) / 1 (INATIVO) #################

############### CRIAÇÃO DE CATEGORIAS #####################

puts "Criando categorias"

categoria = Category.create(name: 'Desenvolvedor', status: 0)
categoria.save

############### CRIAÇÃO DE ESTADOS ########################

puts "Criando estados"

estado = State.create(name: 'Piaui', status: 0)
estado.save
############### CRIAÇÃO DE CIDADES ########################

puts "Criando cidades"

cidade = City.create(name: 'Picos', state: estado, status: 0)
cidade.save
############### CRIAÇÃO DE USUARIOS #######################

puts "Criando usuários"

usuario_cliente = User.create(name: 'Cliente', email: "cliente@email.com", password:"12345678", city: cidade, category: categoria, kind: 0, status: 0)
usuario_cliente.save
usuario_profissional =User.create(name: 'Profissional', email: "profissional@email.com", password:"12345678", city: cidade, category: categoria, kind: 1, status: 0)
usuario_profissional.save
usuario_administrador =User.create(name: 'Administrador', email: "administrador@email.com", password:"12345678", city: cidade, category: categoria, kind: 2, status: 0)
usuario_administrador.save

############### CRIAÇÃO DE SERVIÇOS #######################

puts "Criando Serviços"

servico = Service.create(description: 'Sistema web para rede do bem', user_client_id: usuario_cliente, user_professional_id: usuario_profissional, status: 0)
servico.save

############### CRIAÇÃO DE COMENTARIOS ####################

puts "Criando comentarios"

comentario = Comment.create(description: 'Serviço bem feito!', service: servico, status: 0)
comentario.save
puts "Fim da criação de conteudo teste"