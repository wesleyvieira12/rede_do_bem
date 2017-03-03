######## STATUS = 0 (ATIVO) / 1 (INATIVO) #################

############### CRIAÇÃO DE CATEGORIAS #####################

puts "Criando categorias"

categoria = Category.create(name: 'Desenvolvedor', status: 0)
categoria.save
categoria2 = Category.create(name: 'Pedreiro', status: 0)
categoria2.save
############### CRIAÇÃO DE ESTADOS ########################

puts "Criando estados"

estado = State.create(name: 'Piaui', status: 0)
estado.save
############### CRIAÇÃO DE CIDADES ########################

puts "Criando cidades"

cidade = City.create(name: 'Picos', state: estado, status: 0)
cidade.save
cidade2 = City.create(name: 'Oeiras', state: estado, status: 0)
cidade2.save
############### CRIAÇÃO DE USUARIOS #######################

puts "Criando usuários"

usuario_profissional =User.create(name: 'Profissional', email: "profissional@email.com", password:"12345678", city: cidade, category: categoria, kind: 1, status: 0)
usuario_profissional.save
usuario_profissional2 =User.create(name: 'Profissional 2', email: "profissional2@email.com", password:"12345678", city: cidade2, category: categoria2, kind: 1, status: 0)
usuario_profissional2.save
usuario_cliente = User.create(name: 'Cliente', email: "cliente@email.com", password:"12345678", city: cidade, category: nil, kind: 0, status: 0, professional_id: 1)
usuario_cliente.save
usuario_cliente2 = User.create(name: 'Cliente2', email: "cliente2@email.com", password:"12345678", city: cidade2, category: nil, kind: 0, status: 0, professional_id: 2)
usuario_cliente2.save
usuario_administrador = User.create(name: 'Administrador', email: "administrador@email.com", password:"12345678", city: cidade, category: nil, kind: 2, status: 0)
usuario_administrador.save

############### CRIAÇÃO DE SERVIÇOS #######################

puts "Criando Serviços"

servico = Service.create(description: 'Sistema web para rede do bem', user_client_id: 1, user_professional_id: 3, status: 0)
servico.save
servico2 = Service.create(description: 'Criação de uma casa de luxo', user_client_id: 2, user_professional_id: 4, status: 0)
servico2.save
############### CRIAÇÃO DE COMENTARIOS ####################

puts "Criando comentarios"

comentario = Comment.create(description: 'Serviço bem feito!', service: servico, status: 0)
comentario.save
comentario2 = Comment.create(description: 'Esta sendo bem feita a casa!', service: servico2, status: 0)
comentario2.save
puts "Fim da criação de conteudo teste"