######## STATUS = 0 (ATIVO) / 1 (INATIVO) #################

############### CRIAÇÃO DE CATEGORIAS #####################

puts "Criando categorias"

categoria = Category.create(name: 'Desenvolvedor', status: 0)

############### CRIAÇÃO DE ESTADOS ########################

puts "Criando estados"

estado = State.create(name: 'Piaui', status: 0)

############### CRIAÇÃO DE CIDADES ########################

puts "Criando cidades"

cidade = City.create(name: 'Picos', state: estado, status: 0)

############### CRIAÇÃO DE USUARIOS #######################

puts "Criando usuários"

usuario_cliente = User.create(name: 'Cliente', city: cidade, category: categoria, kind: 0, status: 0)
usuario_profissional =User.create(name: 'Profissional', city: cidade, category: categoria, kind: 1, status: 0)
usuario_administrador =User.create(name: 'Administrador', city: cidade, category: categoria, kind: 2, status: 0)


############### CRIAÇÃO DE SERVIÇOS #######################

puts "Criando Serviços"

servico = Service.create(description: 'Sistema web para rede do bem', user_client: usuario_cliente, user_professional: usuario_profissional, status: 0)

############### CRIAÇÃO DE COMENTARIOS ####################

puts "Criando comentarios"

comentario = Comment.create(description: 'Serviço bem feito!', service: servico, status: 0)

puts "Fim da criação de conteudo teste"