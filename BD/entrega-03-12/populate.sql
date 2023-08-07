INSERT INTO categoria VALUES ('Cereais');
INSERT INTO categoria VALUES ('Pao');
INSERT INTO categoria VALUES ('Massa');
INSERT INTO categoria VALUES ('Aveia');
INSERT INTO categoria VALUES ('Chocolates');
INSERT INTO categoria VALUES ('Peixe');

INSERT INTO categoria_simples VALUES ('Pao');
INSERT INTO categoria_simples VALUES ('Massa');
INSERT INTO categoria_simples VALUES ('Aveia');
INSERT INTO categoria_simples VALUES ('Chocolates');
INSERT INTO categoria_simples VALUES ('Peixe');

INSERT INTO super_categoria VALUES ('Cereais');

INSERT INTO tem_outra VALUES ('Cereais', 'Aveia');
INSERT INTO tem_outra VALUES ('Cereais', 'Massa');

INSERT INTO produto VALUES ('0000111122223333','Pao', 'Pao de centeio');
INSERT INTO produto VALUES ('0000111122224444','Aveia', 'Aveia Integral');
INSERT INTO produto VALUES ('0000888867676776','Cereais', 'Quinoa');
INSERT INTO produto VALUES ('0000111177788888','Massa', 'Massa Milaneza');
INSERT INTO produto VALUES ('0000111155589898','Massa', 'Massa Fettuccine');
INSERT INTO produto VALUES ('0000111133339999','Peixe', 'Pescada');
INSERT INTO produto VALUES ('0000111133332222','Peixe', 'Dourada');
INSERT INTO produto VALUES ('0000444888484848','Peixe', 'Robalo');
INSERT INTO produto VALUES ('0000111144448888','Chocolates', 'Twix');
INSERT INTO produto VALUES ('0000222229999111','Chocolates', 'Snickers');
INSERT INTO produto VALUES ('0000999990000333','Chocolates', 'M&Ms');
INSERT INTO produto VALUES ('0000909092424242','Chocolates', 'Bounty');


INSERT INTO tem_categoria VALUES('0000111122223333', 'Pao');
INSERT INTO tem_categoria VALUES('0000111133339999', 'Peixe');
INSERT INTO tem_categoria VALUES ('0000111133332222','Peixe');
INSERT INTO tem_categoria VALUES ('0000111144448888','Chocolates');
INSERT INTO tem_categoria VALUES ('0000999990000333','Chocolates');
INSERT INTO tem_categoria VALUES ('0000909092424242','Chocolates');

INSERT INTO IVM VALUES(1111666344441, 'AGROMAIS');
INSERT INTO IVM VALUES(2222888500022, 'Nutrifresco');
INSERT INTO IVM VALUES(3333777255599, 'MarsC');
INSERT INTO IVM VALUES(4444888899992, 'Fresh');
INSERT INTO IVM VALUES(5555090909090, 'DIA');
INSERT INTO IVM VALUES(8989898926626, 'LIDL');
INSERT INTO IVM VALUES(6666666660000, 'Continente');
INSERT INTO IVM VALUES(8888828282282, 'InterMarche');
INSERT INTO IVM VALUES(1234567890101, 'Spar');
INSERT INTO IVM VALUES(4545454545454, 'PingoDoce');
INSERT INTO IVM VALUES(3939393939393, 'Makro');
INSERT INTO IVM VALUES(6892783927487, 'Auchan');


INSERT INTO ponto_de_retalho VALUES('Rua Americo', 'Torres Novas', 'Riachos');
INSERT INTO ponto_de_retalho VALUES('Rua Professor', 'Coimbra', 'Baixa');
INSERT INTO ponto_de_retalho VALUES('Rua das Flores', 'Porto', 'BelaVista');
INSERT INTO ponto_de_retalho VALUES('Rua das Rosas', 'Madeira', 'PortoSnto');
INSERT INTO ponto_de_retalho VALUES('Rua das Hortas', 'Algarve', 'Grandem');
INSERT INTO ponto_de_retalho VALUES('Rua das Lontras', 'Lisboa', 'Arroios');
INSERT INTO ponto_de_retalho VALUES('Rua das Baleias', 'Lisboa', 'CampoGrande');
INSERT INTO ponto_de_retalho VALUES('Rua dos Peixes', 'Lisboa', 'Cais');
INSERT INTO ponto_de_retalho VALUES('Rua Filipe', 'Lisboa', 'Olaias');
INSERT INTO ponto_de_retalho VALUES('Rua Joaquim', 'Lisboa', 'Odivelas');
INSERT INTO ponto_de_retalho VALUES('Rua Vip', 'Lisboa', 'Telheiras');
INSERT INTO ponto_de_retalho VALUES('Rua Luis', 'Lisboa', 'Anjos');


INSERT INTO instalada_em VALUES(1111666344441,'AGROMAIS','Rua Americo');
INSERT INTO instalada_em VALUES(2222888500022,'Nutrifresco','Rua Professor');
INSERT INTO instalada_em VALUES(3333777255599,'MarsC','Rua das Flores');
INSERT INTO instalada_em VALUES(4444888899992,'Fresh','Rua das Rosas');
INSERT INTO instalada_em VALUES(5555090909090,'DIA','Rua das Hortas');
INSERT INTO instalada_em VALUES(8989898926626,'LIDL','Rua das Lontras');
INSERT INTO instalada_em VALUES(6666666660000,'Continente','Rua das Baleias');
INSERT INTO instalada_em VALUES(8888828282282,'InterMarche','Rua dos Peixes');
INSERT INTO instalada_em VALUES(1234567890101,'Spar','Rua Filipe');
INSERT INTO instalada_em VALUES(4545454545454,'PingoDoce','Rua Joaquim');
INSERT INTO instalada_em VALUES(3939393939393,'Makro','Rua Vip');
INSERT INTO instalada_em VALUES(6892783927487,'Auchan','Rua Luis');




INSERT INTO prateleira VALUES(1, 1111666344441, 'AGROMAIS', 1.30, 'Cereais');
INSERT INTO prateleira VALUES(2, 2222888500022, 'Nutrifresco', 2.30, 'Peixe');
INSERT INTO prateleira VALUES(3, 3333777255599, 'MarsC', 3.30, 'Chocolates');

INSERT INTO prateleira VALUES(1, 6666666660000, 'Continete', 5.30, 'Chocolates');
INSERT INTO prateleira VALUES(2, 8989898926626, 'LIDL', 6.30, 'Massa');
INSERT INTO prateleira VALUES(8, 5555090909090, 'DIA', 5.30, 'Pao');
INSERT INTO prateleira VALUES(9, 3939393939393, 'Makro', 1.50, 'Cereais');

INSERT INTO prateleira VALUES(1, 6892783927487, 'Auchan', 1.50, 'Massa');
INSERT INTO prateleira VALUES(1, 4545454545454, 'PingoDoce', 1.50, 'Peixe');
INSERT INTO prateleira VALUES(1, 8888828282282, 'InterMarche', 1.50, 'Pao');
INSERT INTO prateleira VALUES(1, 1234567890101, 'Spar', 1.50, 'Aveia');



INSERT INTO planograma VALUES('0000111122223333',1, 1111666344441,'AGROMAIS', 5, 20, 'CR');
INSERT INTO planograma VALUES('0000111133339999',2, 2222888500022,'Nutrifresco', 3, 10, 'PX');
INSERT INTO planograma VALUES('0000111144448888',3, 3333777255599 ,'MarsC', 10, 20, 'CH');
INSERT INTO planograma VALUES('0000909092424242',3, 3333777255599 ,'MarsC', 10, 11, 'CH');
INSERT INTO planograma VALUES('0000999990000333',3, 3333777255599 ,'MarsC', 10, 34, 'CH');

INSERT INTO planograma VALUES('0000111177788888',1, 6666666660000 ,'Continete', 10, 34, 'CH');
INSERT INTO planograma VALUES('0000111177788888',1, 6892783927487 ,'Auchan', 10, 34, 'MX');
INSERT INTO planograma VALUES('0000888867676776',9, 3939393939393 ,'Makro', 10, 34, 'CX');
INSERT INTO planograma VALUES('0000888867676776',9, 3939393939393 ,'Auchan', 10, 34, 'CX');





INSERT INTO retalhista VALUES( 91111110, 'Carla Dias');
INSERT INTO retalhista VALUES( 89466667 , 'Joaquim Monteiro');
INSERT INTO retalhista VALUES( 92019281 , 'Catarina Alves');

INSERT INTO responsavel_por VALUES('Cereais', 92019281, 1111666344441,'AGROMAIS');
INSERT INTO responsavel_por VALUES('Aveia', 92019281 , 1234567890101 ,'Spar');
INSERT INTO responsavel_por VALUES('Pao', 92019281 , 5555090909090 ,'DIA');
INSERT INTO responsavel_por VALUES('Massa', 92019281 , 8989898926626 ,'LIDL');
INSERT INTO responsavel_por VALUES('Peixe', 92019281 , 4444888899992 ,'Fresh');
INSERT INTO responsavel_por VALUES('Chocolates', 92019281 , 3333777255599 ,'MarsC');

INSERT INTO responsavel_por VALUES('Chocolates', 91111110 , 6666666660000 ,'Continete');
INSERT INTO responsavel_por VALUES('Pao', 91111110 , 8888828282282 ,'InterMarche');


INSERT INTO responsavel_por VALUES('Peixe', 89466667 , 4545454545454 ,'PingoDoce');
INSERT INTO responsavel_por VALUES('Cereais', 89466667 , 3939393939393 ,'Makro');
INSERT INTO responsavel_por VALUES('Massa', 89466667 , 6892783927487 ,'Auchan');





INSERT INTO evento_reposicao VALUES('0000111144448888',1, 6666666660000, 'Continete', '2020-02-26 14:30:00',10,91111110);

INSERT INTO evento_reposicao VALUES('0000111133339999', 2, 2222888500022, 'Nutrifresco','2020-07-11 9:15:00',5,92019281);
INSERT INTO evento_reposicao VALUES('0000111144448888', 3, 3333777255599, 'MarsC','2020-11-14 10:55:00',7,92019281);
INSERT INTO evento_reposicao VALUES('0000909092424242',3,3333777255599, 'MarsC', '2020-11-14 11:35:00', 9, 92019281);
INSERT INTO evento_reposicao VALUES('0000999990000333',3,3333777255599, 'MarsC', '2020-11-14 11:50:00', 10, 92019281);
INSERT INTO evento_reposicao VALUES('0000111122223333',1, 1111666344441, 'AGROMAIS', '2020-08-26 14:30:00',10,92019281);
INSERT INTO evento_reposicao VALUES('0000111133339999', 2, 2222888500022, 'Nutrifresco','2020-07-11 10:15:00',10,92019281);

INSERT INTO evento_reposicao VALUES('0000111177788888', 1, 6892783927487, 'Auchan', '2020-01-11 10:15:00',10, 89466667);
INSERT INTO evento_reposicao VALUES('0000888867676776', 9, 3939393939393, 'Makro', '2020-02-11 10:15:00',10, 89466667);
INSERT INTO evento_reposicao VALUES('0000888867676776', 9, 3939393939393, 'Auchan', '2020-02-11 15:15:00',10, 89466667);




