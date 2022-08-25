
use master
go
if exists(select 1 from sys.databases where name = 'luvancar')
begin
	alter database luvancar set single_user with rollback immediate
	drop database luvancar
end
go 
create database luvancar
go
use luvancar
go

create table cliente
(
idcliente int primary key identity(1,1),
nome varchar(50),
cpf int, --será necessario uma validacao para aceitar somente numeros
sobrenome varchar(40),
endereco varchar(150),
telefone varchar(20),
)
go
create table funcionario
(
idfuncionario int primary key identity(1,1),
nome varchar(50),
cpf int, --será necessario uma validacao para aceitar somente numeros
sobrenome varchar(40),
endereco varchar(150),
telefone varchar(20),
)
go
create table veiculo
(
idveiculo int primary key identity(1,1),
placa varchar(7), --não pode aceitar sinal de menos
cor varchar(20),
ano int,
modelo varchar(30),
marca varchar(20),
tipo varchar(20), --suv, caminhonete, caminhao
valordiaria float
)

go
create table aluguel
(
data_inicial date,
data_entrega date,-- sera preenchido somente na devolucao do veiculo
valor_total float,
observacao varchar(300),
idcliente int,
idveiculo int,
idfuncionario int
)

go
alter table aluguel
add
constraint fkcliente_aluguel foreign key(idcliente) references cliente(idcliente),
constraint fkveiculo_aluguel foreign key(idveiculo) references veiculo(idveiculo),
constraint fkfuncinario_aluguel foreign key(idfuncionario)references funcionario(idfuncionario)

