-- Criação do banco de dados para o cenário de Oficina Mecânica 
show databases;
-- drop database oficinaMecanica;
create database oficinaMecanica;
use oficinaMecanica;

-- criação da tabela cliente
create table cliente (
    idCliente int auto_increment primary key,
    primeiroNome varchar(100) not null,
    inicialSnome char(3),
    ultimoNome varchar(20),
    telefone varchar(15),
    endereco varchar(150),
    cpf char(11),
    cnpj char(14),
    email varchar(100),
    dataCadastro date not null,
    constraint unique_cpf_cliente unique(cpf),
    constraint unique_cnpj_cliente unique(cnpj),
    constraint unique_email_cliente unique(email)
);
desc cliente;
alter table cliente auto_increment = 1;

-- Criação da tabela veiculo
create table veiculo (
    idVeiculo int auto_increment primary key,
    idVCliente int,
    placa varchar(10) not null,
    marca varchar(50),
    modelo varchar(50),
    ano int,
    cor varchar(20),
    tipoCombustivel enum('Gasolina', 'Diesel', 'Elétrico', 'Híbrido', 'Flex'),
    quilometragem int default 0,
    dataUltimaRevisao date,
    chassi char(17),
    constraint unique_placa unique(placa),
    constraint unique_chassi unique(chassi),
    constraint fk_veiculo_cliente foreign key (idVCliente) references cliente(idCliente)
			on delete cascade
			on update cascade
);
desc veiculo;
alter table veiculo auto_increment = 1;

-- Criação da tabela mecanico
create table mecanico (
    idMecanico int auto_increment primary key,
    codigoMec varchar(45) not null,
    nome varchar(100) not null,
    endereco varchar(150),
    especialidade varchar(100),
    dataAdmissao date not null,
    salario decimal(10, 2) not null,
    statusMec enum('Ativo', 'Inativo') default 'Ativo',
     constraint unique_codigoMec unique(codigoMec)
);
desc mecanico;
alter table mecanico auto_increment = 1;

-- Criação da tabela equipe
create table equipe (
    idEquipe int auto_increment primary key,
    nomeEquipe varchar(100) not null,
    liderEquipe int not null,
    dataCriacao date not null,
    descricaoEquipe varchar(255),
    constraint fk_equipe_lider foreign key (liderEquipe) references mecanico(idMecanico)
			on delete cascade
			on update cascade
);
desc equipe;
alter table equipe auto_increment = 1;

-- Criação da tabela serviços 
create table servico (
    idServico int auto_increment primary key,
    descricao varchar(100) not null,
    valorMaoDeObra float not null,
    tempoEstimado int,
    prioridade enum('Alta', 'Média', 'Baixa'),
    equipeResponsavel varchar(100) not null,
    observacoes varchar(255)
);
desc servico;
alter table servico auto_increment = 1;

-- Criação da tabela ordem de serviços
create table ordemServico (
    idOS int auto_increment primary key,
    idOSEquipe int,
    idOSVeiculo int,
    numeroOS varchar(20) not null,
    autorizacaoCliente bool default false,
    dataEmissao date not null,
    dataConclusao date,
    valorTotal float not null,
    osStatus enum('Aberta', 'Fechada', 'Cancelada') default 'Aberta',
    observacoes varchar(255),
    responsavelAbertura varchar(100) not null,
    dataAprovacao date,
    constraint unique_numeroOS unique(numeroOS),
    constraint fk_os_equipe foreign key (idOSEquipe) references equipe(idEquipe)
        on delete cascade
        on update cascade,
    constraint fk_os_veiculo foreign key (idOSVeiculo) references veiculo(idVeiculo)
        on delete cascade
        on update cascade
);
desc ordemServico;
alter table ordemServico auto_increment = 1;

-- Criação da tabela peças
create table peca (
    idPeca int auto_increment primary key,
    descricao varchar(100) not null,
    fabricante varchar(100),
    modelo varchar(50),
    preco float not null,
    estoqueAtual int default 0,
    estoqueMinimo int not null
);
desc peca;
alter table peca auto_increment = 1;

-- Criação da tabela equipe_mecanico
create table equipeMecanico (
    idEMequipe int,
    idEMmecanico int,
    primary key (idEMequipe, idEMmecanico),
    constraint fk_equipe_mecanico foreign key (idEMequipe) references equipe(idEquipe)
        on delete cascade
        on update cascade,
    constraint fk_mecanico_equipe foreign key (idEMmecanico) references mecanico(idMecanico)
        on delete cascade
        on update cascade
);
 desc equipeMecanico;
 
 -- Criação da tabela mecanico_serviço
create table mecanicoServico (
    idmsMecanico int,
    idmsServico int,
    tempoGastoHoras decimal(5, 2),
    observacoes varchar(255),
    primary key (idmsMecanico, idmsServico),
    constraint fk_mecanico_servico_mecanico foreign key (idmsMecanico) references mecanico(idMecanico)
        on delete cascade
        on update cascade,
    constraint fk_mecanico_servico_servico foreign key (idmsServico) references servico(idServico)
        on delete cascade
        on update cascade
);
desc mecanicoServico;

-- Criação da tabela ordemServiço_serviço
create table ordemServico_Servico (
    idossOS int,
    idossServico int,
    quantidade int default 1,
    primary key (idossOS, idossServico),
    constraint fk_oss_servico foreign key (idossOS) references ordemServico(idOS)
        on delete cascade
        on update cascade,
    constraint fk_servico_oss foreign key (idossServico) references servico(idServico)
        on delete cascade
        on update cascade
);
desc ordemServico_Servico;

-- Criação da tabela ordemServiço_peça
create table ordemServicoPeca (
    idospOS int,
    idospPeca int,
    quantidade int default 1,
    precoUnitario float not null,
    primary key (idospOS, idospPeca),
    constraint fk_osp_peca foreign key (idospOS) references ordemServico(idOS)
        on delete cascade
        on update cascade,
    constraint fk_peca_osp foreign key (idospPeca) references peca(idPeca)
        on delete cascade
        on update cascade
);
desc ordemServicoPeca;


