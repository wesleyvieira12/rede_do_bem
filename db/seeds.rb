######## STATUS = 0 (ATIVO) / 1 (INATIVO) #################

############### CRIAÇÃO DE CATEGORIAS #####################

puts "Criando categorias"

categoria = Category.create(name: 'Desenvolvedor', status: 0)
categoria.save
categoria2 = Category.create(name: 'Pedreiro', status: 0)
categoria2.save
categoria3 = Category.create(name: 'Carpinteiro', status: 1)
categoria3.save

############### CRIAÇÃO DE ESTADOS ########################

puts "Criando estados"

estado = State.create(name: 'PI', status: 0)
estado.save

estado2 = State.create(name: 'SP', status: 1)
estado2.save

############### CRIAÇÃO DE CIDADES ########################

puts "Criando cidades"

cidade = City.create(name: 'Picos', state: estado, status: 0)
cidade.save
cidade2 = City.create(name: 'Oeiras', state: estado, status: 0)
cidade2.save
cidade3 = City.create(name: 'Osaco', state: estado2, status: 1)
cidade3.save
############### CRIAÇÃO DE USUARIOS #######################

puts "Criando usuários"

usuario_profissional =User.create(name: 'José de Freitas', email: "profissional@email.com", password:"12345678", city: cidade, category: categoria, kind: 1, status: 0)
usuario_profissional.save
usuario_profissional2 =User.create(name: 'Marcio dos Santos', email: "profissional2@email.com", password:"12345678", city: cidade2, category: categoria2, kind: 1, status: 1)
usuario_profissional2.save
usuario_cliente = User.create(name: 'Fulano de tal', email: "cliente@email.com", password:"12345678", city: cidade, category: nil, kind: 0, status: 0, professional_id: 1)
usuario_cliente.save
usuario_cliente2 = User.create(name: 'Beltrano da fonseca', email: "cliente2@email.com", password:"12345678", city: cidade2, category: nil, kind: 0, status: 1, professional_id: 2)
usuario_cliente2.save
usuario_administrador = User.create(name: 'Administrador geral', email: "administrador@email.com", password:"12345678", city: cidade, category: nil, kind: 2, status: 0)
usuario_administrador.save

############### CRIAÇÃO DE SERVIÇOS #######################

puts "Criando Serviços"

servico = Service.create(description: 'Sistema web para rede do bem', user_client_id: 3, user_professional_id: 1, status: 0)
servico.save
servico2 = Service.create(description: 'Criação de um chat para sistema de vendas', user_client_id: 4, user_professional_id: 1, status: 0)
servico.save
servico3 = Service.create(description: 'Criação de uma casa de luxo', user_client_id: 3, user_professional_id: 2, status: 0)
servico3.save
servico4 = Service.create(description: 'Manutenção em hospital', user_client_id: 4, user_professional_id: 2, status: 1)
servico4.save
############### CRIAÇÃO DE COMENTARIOS ####################

puts "Criando comentarios"

comentario = Comment.create(description: 'Serviço bem feito!', service: servico, status: 0)
comentario.save
comentario3 = Comment.create(description: 'Muito bom o profissional', service: servico2, status: 0)
comentario3.save
comentario = Comment.create(description: 'Esta sendo bem feita a casa!', service: servico3, status: 0)
comentario.save
comentario3 = Comment.create(description: 'Boa manutenção.', service: servico4, status: 0)
comentario3.save
puts "Fim da criação de conteudo teste"