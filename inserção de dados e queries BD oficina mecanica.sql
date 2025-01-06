-- INSERÇÃO DE DADOS E CRIAÇÃO DE QUERIES PARA O PROJETO LOGICO OFICINA MECÂNICA
use oficinaMecanica;
										-- INSERÇÃO DE DADOS
-------------------------------------------------------------------------------------------------------------------
-- tabela cliente
insert into cliente (primeiroNome, inicialSnome, ultimoNome, telefone, endereco, cpf, cnpj, email, dataCadastro)
		values  ('João', 'A.', 'Silva', '11999999999', 'Rua A, 123', '12345678901', null, 'joao.silva@gmail.com', '2025-01-01'),
				('Maria', 'B.', 'Oliveira', '21988888888', 'Rua B, 456', null, '12345678000190', 'maria.oliveira@empresa.com', '2025-01-02'),
				('Carlos', null, 'Santos', '31977777777', 'Rua C, 789', '98765432109', null, 'carlos.santos@hotmail.com', '2025-01-03'),
				('Ana', 'C.', 'Pereira', '41966666666', 'Rua D, 321', null, '23456789000190', 'ana.pereira@gmail.com', '2025-01-04'),
				('Pedro', 'D.', 'Costa', '51955555555', 'Rua E, 654', '12312312345', null, 'pedro.costa@yahoo.com', '2025-01-05'),
				('Lucia', null, 'Matos', '61944444444', 'Rua F, 987', null, '45645645600001', 'lucia.matos@empresa.com', '2025-01-06');

select * from cliente;
-------------------------------------------------------------------------------------------------------------------
-- tabela veiculo
insert into veiculo (idVCliente, placa, marca, modelo, ano, cor, tipoCombustivel, quilometragem, dataUltimaRevisao, chassi)
		values  (1, 'ABC1234', 'Toyota', 'Corolla', 2020, 'Branco', 'Flex', 35000, '2024-12-20', '1HGBH41JXMN109186'),
				(2, 'DEF5678', 'Honda', 'Civic', 2019, 'Prata', 'Gasolina', 45000, '2024-11-15', '2HGBH41JXMN109187'),
				(3, 'GHI9012', 'Chevrolet', 'Onix', 2021, 'Preto', 'Flex', 25000, '2024-10-10', '3HGBH41JXMN109188'),
				(4, 'JKL3456', 'Ford', 'Ka', 2018, 'Azul', 'Gasolina', 60000, '2024-09-05', '4HGBH41JXMN109189'),
				(5, 'MNO7890', 'Volkswagen', 'Gol', 2022, 'Vermelho', 'Diesel', 15000, '2024-08-01', '5HGBH41JXMN109190'),
				(6, 'PQR1234', 'Fiat', 'Argo', 2023, 'Cinza', 'Híbrido', 5000, '2024-07-01', '6HGBH41JXMN109191');

select * from veiculo;
-------------------------------------------------------------------------------------------------------------------
-- tabela mecanico
insert into mecanico (codigoMec, nome, endereco, especialidade, dataAdmissao, salario, statusMec)
		values  ('M001', 'José', 'Rua G, 123', 'Motor', '2023-01-01', 3500.00, 'Ativo'),
				('M002', 'Paulo', 'Rua H, 456', 'Suspensão', '2022-05-01', 4000.00, 'Ativo'),
				('m003', 'Ricardo', 'Rua I, 789', 'Freios', '2021-08-15', 3800.00, 'Inativo'),
				('m004', 'Fernanda', 'Rua J, 321', 'Pintura', '2020-11-20', 4500.00, 'Ativo'),
				('m005', 'Carla', 'Rua K, 654', 'Elétrica', '2019-03-10', 4200.00, 'ativo'),
				('M006', 'renato', 'rua L, 987', 'diagnóstico', '2023-06-01', 3700.00, 'ativo');

select * from mecanico;
-------------------------------------------------------------------------------------------------------------------
-- tabela equipe
insert into equipe (nomeEquipe, liderEquipe, dataCriacao, descricaoEquipe)
		values  ('Equipe A', 1, '2024-01-01', 'Equipe especializada em motores'),
				('Equipe B', 2, '2024-02-01', 'Equipe especializada em suspensão'),
				('Equipe C', 4, '2024-03-01', 'Equipe de pintura e estética automotiva'),
				('equipe D', 5, '2024-04-01', 'Equipe elétrica');

select * from equipe;
-------------------------------------------------------------------------------------------------------------------
-- tabela serviço
insert into servico (descricao, valorMaoDeObra, tempoEstimado, prioridade, equipeResponsavel, observacoes)
		values  ('Troca de óleo', 150.00, 1, 'Baixa', 'Equipe A', 'Serviço simples'),
				('alinhamento e balanceamento', 200.00, 2, 'Média', 'equipe B', 'revisão de alinhamento'),
				('revisão de freios', 300.00, 3, 'Alta', 'Equipe A', 'Inclui troca de pastilhas'),
				('pintura de porta', 500.00, 5, 'Alta', 'Equipe C', 'Inclui lixamento'),
				('diagnóstico eletrônico', 250.00, 2, 'média', 'Equipe B', 'Análise de sensores e falhas'),
				('Troca de bateria', 200.00, 1, 'média', 'Equipe D', 'Inclui instalação');

select * from servico;
-------------------------------------------------------------------------------------------------------------------
-- tabela ordemServiço
insert into ordemServico (idOSEquipe, idOSVeiculo, numeroOS, autorizacaoCliente, dataEmissao, dataConclusao, valorTotal, osStatus, observacoes, responsavelAbertura, dataAprovacao)
		values  (1, 1, 'OS001', true, '2025-01-01', '2025-01-03', 400.00, 'Fechada', 'Serviço concluído com sucesso', 'José', '2025-01-01'),
				(2, 2, 'oS002', true, '2025-01-02', '2025-01-04', 600.00, 'fechada', 'incluiu balanceamento', 'paulo', '2025-01-02'),
				(3, 3, 'oS003', false, '2025-01-03', null, 0.00, 'aberta', 'aguardando autorização', 'Fernanda', null),
				(4, 4, 'Os004', true, '2025-01-04', null, 500.00, 'Cancelada', 'Troca de bateria', 'Carla', '2025-01-04'),
				(2, 5, 'Os005', true, '2025-01-05', '2025-01-06', 750.00, 'fechada', 'Diagnóstico completo', 'Renato', '2025-01-05'),
				(4, 6, 'oS006', true, '2025-01-06', null, 200.00, 'Cancelada', 'Revisão de freios', 'Ricardo', '2025-01-06');

select * from ordemServico;
-------------------------------------------------------------------------------------------------------------------
-- tabela peça
insert into peca (descricao, fabricante, modelo, preco, estoqueAtual, estoqueMinimo)
		values  ('Filtro de óleo', 'Bosch', 'FO123', 50.00, 10, 5),
				('Pneu', 'Pirelli', 'P123', 300.00, 20, 8),
				('Pastilha de freio', 'TRW', 'PF456', 100.00, 15, 5),
				('Bateria', 'Moura', 'BM100', 400.00, 5, 2),
				('Amortecedor', 'Monroe', 'A789', 250.00, 8, 3),
				('Velas de ignição', 'nGK', 'v456', 30.00, 25, 10);

select * from peca;
-------------------------------------------------------------------------------------------------------------------
-- tabela equipe_mecanico
insert into equipeMecanico (idEMequipe, idEMmecanico)
		values  (1, 1), 
				(1, 6), 
				(2, 2), 
				(3, 4), 
				(4, 5), 
				(4, 3);

select * from equipeMecanico;
-------------------------------------------------------------------------------------------------------------------
-- tabela mecanico_serviço
insert into mecanicoServico (idmsMecanico, idmsServico, tempoGastoHoras, observacoes)
		values  (1, 1, 1.5, 'Troca realizada rapidamente'),
				(2, 2, 2.0, 'Alinhamento concluído'),
				(3, 3, 3.0, 'Revisão completa'),
				(4, 4, 5.0, 'Pintura bem detalhada'),
				(5, 5, 2.0, 'Diagnóstico completo'),
				(6, 6, 1.0, 'troca de bateria realizada');

select * from mecanicoServico;
-------------------------------------------------------------------------------------------------------------------
-- tabela ordemServiço_serviço
insert into ordemServico_Servico (idossOS, idossServico, quantidade)
		values  (1, 1, 1), 
				(1, 2, 1), 
				(2, 3, 1), 
				(2, 4, 1), 
				(3, 5, 1), 
				(4, 6, 1);

select * from ordemServico_Servico;
-------------------------------------------------------------------------------------------------------------------
-- tabela ordemServiço_peça
insert into ordemServicoPeca (idospOS, idospPeca, quantidade, precoUnitario)
		values  (1, 1, 2, 50.00), 
				(1, 2, 4, 300.00), 
				(2, 3, 2, 100.00), 
				(3, 4, 1, 400.00), 
				(4, 5, 2, 250.00), 
				(5, 6, 4, 30.00);

select * from ordemServicoPeca;

-------------------------------------------------------------------------------------------------------------------

												-- QUERIES

-------------------------------------------------------------------------------------------------------------------

-- Quais são os nomes dos clientes e suas respectivas placas de veículos?
SELECT c.primeiroNome, c.ultimoNome, v.placa FROM cliente c
		JOIN veiculo v ON c.idCliente = v.idVCliente;
        
-- Quais mecânicos ativos possuem especialidade em "Suspensão"?
SELECT nome, especialidade, salario FROM mecanico
		WHERE statusMec = 'Ativo' AND especialidade LIKE '%Suspensão%';
        
-- Qual é o custo total estimado (peças + mão de obra) para cada ordem de serviço?
SELECT os.numeroOS, os.valorTotal AS maoDeObra, SUM(osp.quantidade * osp.precoUnitario) AS totalPecas,
       (os.valorTotal + SUM(osp.quantidade * osp.precoUnitario)) AS custoTotal
			FROM ordemServico os
			JOIN ordemServicoPeca osp ON os.idOS = osp.idospOS
			GROUP BY os.idOS;
            
-- Listando as ordens de serviço em ordem decrescente de valor total.
SELECT numeroOS, valorTotal, osStatus, dataConclusao FROM ordemServico
		ORDER BY valorTotal DESC;

-- Quais equipes têm mais de 1 mecânicos associados?
SELECT e.nomeEquipe, COUNT(em.idEMmecanico) AS totalMecanicos FROM equipe e
		JOIN equipeMecanico em ON e.idEquipe = em.idEMequipe
		GROUP BY e.idEquipe
		HAVING COUNT(em.idEMmecanico) > 1;

-- Quais serviços foram realizados em cada ordem de serviço, incluindo os tempos estimados e as equipes responsáveis?
SELECT os.numeroOS, s.descricao AS servico, s.tempoEstimado, e.nomeEquipe FROM ordemServico os
		JOIN ordemServico_Servico oss ON os.idOS = oss.idossOS
		JOIN servico s ON oss.idossServico = s.idServico
		JOIN equipe e ON s.equipeResponsavel = e.nomeEquipe;
        
-- Liste todos os veículos com quilometragem acima de 50.000 km, ordenados por ano (mais recente primeiro).
SELECT v.placa, v.marca, v.modelo, v.ano, v.quilometragem FROM veiculo v
		WHERE v.quilometragem > 50000
		ORDER BY v.ano DESC;
        
-- Qual é o valor total faturado por serviços em ordens de serviço concluídas?
SELECT SUM(os.valorTotal) AS faturamentoTotal FROM ordemServico os
		WHERE os.osStatus = 'Fechada';
        
-- Quais clientes realizaram mais de 1 serviços diferentes e qual é o total gasto por eles?
SELECT c.primeiroNome, c.ultimoNome, COUNT(DISTINCT oss.idossServico) AS totalServicos, 
       SUM(os.valorTotal) AS totalGasto
		FROM cliente c
			JOIN veiculo v ON c.idCliente = v.idVCliente
			JOIN ordemServico os ON v.idVeiculo = os.idOSVeiculo
			JOIN ordemServico_Servico oss ON os.idOS = oss.idossOS
			GROUP BY c.idCliente
			HAVING COUNT(DISTINCT oss.idossServico) > 1;
            
-- Quais equipes participaram de ordens de serviço fechadas e qual foi o valor total gerado por cada equipe?
SELECT e.nomeEquipe, COUNT(os.idOS) AS totalOS, SUM(os.valorTotal) AS totalFaturado
		FROM equipe e
			JOIN ordemServico os ON e.idEquipe = os.idOSEquipe
			WHERE os.osStatus = 'Fechada'
			GROUP BY e.idEquipe
			ORDER BY totalFaturado DESC;